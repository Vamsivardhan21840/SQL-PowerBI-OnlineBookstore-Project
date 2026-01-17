-- Advance Questions : 

-- 1) Retrieve the total number of books sold for each genre:
select b.Genre,sum(o.Quantity) as total
from books b
join orders o on b.Book_ID = o.Book_ID
group by b.Genre
order by total asc;


-- 2) Find the average price of books in the "Fantasy" genre:
select round(avg(price),2) as avg_price
from books
where Genre = "Fantasy";


-- 3) List customers who have placed at least 2 orders:
select c.customer_id,c.name , count(order_id) as total_count
from orders o
join customers c on o.Customer_ID = c.Customer_ID
group by c.Customer_ID,c.Name
having count(Order_ID) >= 2;

-- 4) Find the most frequently ordered book:
select b.title,b.Book_ID , count(Order_id)from books b
join orders o on b.Book_ID = o.Book_ID
group by b.title,b.Book_ID
order by count(o.Order_ID) desc limit 1;


-- 5) Show the top 3 most expensive books of 'Fantasy' Genre :

select title,max(Price) as high_price from books
where Genre = "Fantasy"
group by title
having max(Price)
order by high_price desc
limit 3;
-------------------------------- 
SELECT * FROM books
WHERE genre ='Fantasy'
ORDER BY price DESC LIMIT 3;
-- 6) Retrieve the total quantity of books sold by each author:

select b.author as Author,sum(o.quantity) as Total_Quantity
from books b
join orders o on b.book_id = o.book_id
group by b.Author
having sum(o.Quantity);


-- 7) List the cities where customers who spent over $30 are located:
select distinct c.city, o.Total_Amount
from customers c
join orders o on c.Customer_ID = o.Customer_ID
where o.Total_Amount > 30;


-- 8) Find the customer who spent the most on orders:
select c.customer_id , c.name ,sum(o.Total_Amount) as spent
from customers c
join orders o on c.Customer_ID = o.Customer_ID
group by c.Customer_ID,c.Name
order by spent desc limit 1;

-- 9) Calculate the stock remaining after fulfilling all orders:
SELECT b.book_id, b.title, b.stock, COALESCE(SUM(o.quantity),0) AS Order_quantity,  
	b.stock- COALESCE(SUM(o.quantity),0) AS Remaining_Quantity
FROM books b
LEFT JOIN orders o ON b.book_id=o.book_id
GROUP BY b.book_id ORDER BY b.book_id;