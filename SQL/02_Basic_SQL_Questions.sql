-- 1) Retrieve all books in the "Fiction" genre:

select * from books
where Genre = "Fiction";

-- 2) Find books published after the year 1950:
select * from books
where Published_Year > 1950;

-- 3) List all customers from the Canada:
select * from customers
where country = "Canada";

-- 4) Show orders placed in November 2023:
select * from orders
where month(Order_Date) = 11 and year(Order_Date) = 2023;


-- 5) Retrieve the total stock of books available:
select sum(Stock) as Total_Stack from books;
-- 25056
-- 6) Find the details of the most expensive book:
select * from books
where price =(
select max(price) from books
limit 1
);

SELECT * FROM Books 
ORDER BY Price DESC 
LIMIT 1;
-- '340', 'Proactive system-worthy orchestration', 'Robert Scott', 'Mystery', '1907', '49.98', '88'

-- 7) Show all customers who ordered more than 1 quantity of a book:
select * from customers
join orders on customers.Customer_ID = orders.Customer_ID
where orders.Quantity > 1;
-- return 400 rows returned


-- 8) Retrieve all orders where the total amount exceeds $20:
select * from orders
where Total_Amount > 20;

-- 9) List all genres available in the Books table:
select Genre from books
group by Genre;
-- 7 rows returned

-- 10) Find the book with the lowest stock:

select * from books
order by stock asc
limit 1;
-- 'Networked systemic implementation'

-- 11) Calculate the total revenue generated from all orders:
select sum(Total_Amount) from orders;
-- '75628.66'