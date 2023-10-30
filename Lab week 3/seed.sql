USE mydb;

INSERT INTO  invoices (invoice_id)
VALUES (1), (2) , (3);

INSERT INTO  customers (customer_id)
VALUES (1), (2) , (3);
INSERT INTO cars (vin, manufacturer, model, year, color, cars_vin)
VALUES (1, 'Toyota', 'Corolla', '2002', 'Blue', 1),
	   (2, 'Honda', 'Accord', '2004', 'Red', 2),
       (3, 'Mercedes', 'Amg', '2015', 'Black', 3),
       (4,'BMW', 'X5', '2016', 'Green', 4 );
       
       
	SELECT * FROM cars;	
    
    Error Code: 1136. Column count doesn't match value count at row 4
Error Code: 1452. Cannot add or update a child row: a foreign key constraint fails (`mydb`.`cars`, CONSTRAINT `fk_cars_customers1` FOREIGN KEY (`customers_customer_id`) REFERENCES `customers` (`customer_id`))
