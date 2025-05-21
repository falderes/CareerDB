# CareerDB
## ERD-диаграмма
![image](https://github.com/user-attachments/assets/f26402b4-94d2-4514-9bac-2a9db73deb37)
## Описание БД
Данная база данных была разработана для предприятия, специализирующегося на добыче различных видов сырья в карьере. Целью создания системы стало обеспечение эффективного управления производственными процессами и контроля над материальными ресурсами. База данных включает в себя все необходимые таблицы для хранения информации о видах сырья, партиях добытых материалов, технике и оборудовании, а также операциях отгрузки и доставки. Все данные структурированы и логически связаны между собой, что позволяет обеспечить точность учёта, упрощает анализ производственных показателей и способствует принятию обоснованных управленческих решений.
## Назначение БД
База данных предназначена для использования на горнодобывающем карьере и служит для управления информацией о добыче различных видов сырья. БД позволяет хранить данные о типах полезных ископаемых, объемах добычи, характеристиках месторождений, а также о технике и персонале, задействованных в процессе добычи. Система обеспечивает ведение учета производственных показателей, контроль за выполнением плановых норм и предоставление аналитических отчетов для принятия управленческих решений.
## Типовые запросы
Запрос на получение списка активного оборудования;
```
SELECT 
    EquipmentName AS 'Оборудование',
    Type AS 'Тип',
    SerialNumber AS 'Серийный номер',
    Status AS 'Статус'
FROM Equipment
WHERE Status = 'Active'
ORDER BY EquipmentName;
```

Запрос на вывод текущих запасов продукции на складе;
```
SELECT 
    p.ProductName AS 'Продукция',
    s.Amount AS 'Количество, т',
    s.Location AS 'Место хранения',
    s.LastUpdate AS 'Дата обновления'
FROM Storage s
JOIN Product p ON s.ProductID = p.ID
WHERE s.Amount > 0
ORDER BY p.ProductName;
```

Запрос на вывод списка сотрудников с их должностями;
```
SELECT 
    LastName AS 'Фамилия',
    FirstName AS 'Имя',
    Position AS 'Должность',
    HireDate AS 'Дата приема',
    DATEDIFF(year, HireDate, GETDATE()) AS 'Стаж, лет'
FROM Employee
WHERE IsActive = 1
ORDER BY LastName, FirstName;
```

## Реализованные триггеры

Триггер для автоматического пополнения склада после переработки;
```
CREATE TRIGGER trg_UpdateStorageAfterProcessing
ON Processing
AFTER INSERT
AS
BEGIN
    SET NOCOUNT ON;
    
    -- Обновляем существующие записи на складе
    UPDATE Storage
    SET Amount = Amount + i.OutputAmount,
        LastUpdate = GETDATE()
    FROM Storage s
    JOIN inserted i ON s.ProductID = i.ProductID
    WHERE s.Location = 'Основной склад';
    
    -- Если продукта нет на складе, создаем новую запись
    INSERT INTO Storage (ProductID, Amount, LastUpdate, Location)
    SELECT i.ProductID, i.OutputAmount, GETDATE(), 'Основной склад'
    FROM inserted i
    WHERE NOT EXISTS (
        SELECT 1 FROM Storage s 
        WHERE s.ProductID = i.ProductID AND s.Location = 'Основной склад'
    );
END;
GO
```

Триггер для проверки состояния оборудования перед использованием;
```
CREATE TRIGGER trg_CheckEquipmentStatus
ON Extraction
INSTEAD OF INSERT
AS
BEGIN
    -- Разрешаем вставку только для активного оборудования
    IF EXISTS (
        SELECT 1 FROM inserted i
        JOIN Equipment e ON i.EquipmentID = e.ID
        WHERE e.Status != 'Active'
    )
    BEGIN
        RAISERROR('Нельзя использовать оборудование, которое не в активном статусе', 16, 1);
        RETURN;
    END
    
    -- Если все проверки пройдены, выполняем вставку
    INSERT INTO Extraction (MiningZoneID, ExtractionDate, Volume, Weight, EmployeeID, EquipmentID)
    SELECT MiningZoneID, ExtractionDate, Volume, Weight, EmployeeID, EquipmentID
    FROM inserted;
END;
GO
```

Триггер для ведения журнала изменений запасов;
```
-- Сначала создаем таблицу для журналирования
CREATE TABLE StorageAudit (
    ID INT IDENTITY(1,1) PRIMARY KEY,
    StorageID INT NOT NULL,
    ProductID INT NOT NULL,
    OldAmount DECIMAL(10,2) NULL,
    NewAmount DECIMAL(10,2) NULL,
    ChangeDate DATETIME NOT NULL DEFAULT GETDATE(),
    ChangeType VARCHAR(10) NOT NULL, -- 'INSERT', 'UPDATE', 'DELETE'
    ChangedBy NVARCHAR(100) NOT NULL DEFAULT SYSTEM_USER
);

-- Затем создаем триггер
CREATE TRIGGER trg_StorageAudit
ON Storage
AFTER INSERT, UPDATE, DELETE
AS
BEGIN
    SET NOCOUNT ON;
    
    -- Для операций INSERT
    IF EXISTS (SELECT * FROM inserted) AND NOT EXISTS (SELECT * FROM deleted)
    BEGIN
        INSERT INTO StorageAudit (StorageID, ProductID, OldAmount, NewAmount, ChangeType)
        SELECT i.ID, i.ProductID, NULL, i.Amount, 'INSERT'
        FROM inserted i;
    END
    
    -- Для операций UPDATE
    IF EXISTS (SELECT * FROM inserted) AND EXISTS (SELECT * FROM deleted)
    BEGIN
        INSERT INTO StorageAudit (StorageID, ProductID, OldAmount, NewAmount, ChangeType)
        SELECT i.ID, i.ProductID, d.Amount, i.Amount, 'UPDATE'
        FROM inserted i
        JOIN deleted d ON i.ID = d.ID;
    END
    
    -- Для операций DELETE
    IF NOT EXISTS (SELECT * FROM inserted) AND EXISTS (SELECT * FROM deleted)
    BEGIN
        INSERT INTO StorageAudit (StorageID, ProductID, OldAmount, NewAmount, ChangeType)
        SELECT d.ID, d.ProductID, d.Amount, NULL, 'DELETE'
        FROM deleted d;
    END
END;
GO
```
