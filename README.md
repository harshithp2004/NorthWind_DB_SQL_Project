# NorthWind_DB_SQL_Project
## The Questions/Objective and Explaination:
## Easy Queries:
1.List all products and their categories.

Explanation: This query retrieves the names of all products alongside their category names by joining the Products and Categories tables on CategoryID, which is a shared column between these tables. 

2.Show the first and last names of all employees and the name of the city where they work.
Explanation: This basic query selects and displays the first name, last name, and city of each employee from the Employees table, without requiring any join.

3.Retrieve all orders for a specific customer.
Explanation: This query finds all orders for a specific customer (in this case, "ALFKI") by joining the Orders and Customers tables on CustomerID and filtering by the specific CustomerID.

4.List all shippers and their contact phone numbers.
Explanation: This query retrieves each shipper's company name and contact phone number from the Shippers table.

5.Display a list of all unique cities where suppliers are based.
Explanation: The DISTINCT keyword filters out duplicate cities, listing only unique ones from the Suppliers table.

6.Find the total number of products available in the Products table.
Explanation: Using the COUNT aggregate function, this query counts the total number of products in the Products table.

7.Count the number of employees in each city.
Explanation: This query groups employees by their city and counts the number of employees in each city using the COUNT function and GROUP BY clause.

8.Retrieve a list of orders with their shipment details (order ID, ship date, and freight).
Explanation: A straightforward query that retrieves each order’s ID, shipped date, and freight cost from the Orders table.

## Modertate Queries:
1.Count of products in each category.
Explanation: By joining Categories and Products on CategoryID, this query groups results by category and counts the number of products in each, giving insights into product distribution across categories.

2.List employees and the territories they cover.
Explanation: This query uses two joins to retrieve each employee’s name alongside their assigned territory. || concatenates the first and last names for better readability.

3.Retrieve order details including order date, customer name, and the shipper’s company name.
Explanation: By joining Orders, Customers, and Shippers, this query displays the order date, customer name, and shipper for each order, utilizing multiple joins to combine relevant data.

4.View of high-value orders (freight > $500).
Explanation: This query creates a view named HighValueOrders to store orders with freight costs exceeding $500. Views are used here to simplify recurring queries and allow quicker access to high-value orders.

5.List the products and the suppliers that supply them, sorted by product name.
Explanation: This query joins Products and Suppliers tables to list each product with its supplier, sorted alphabetically by product name.

6.Display orders placed by customers in Germany and show their order dates.
Explanation: By filtering Customers based on country (Germany), this query joins Orders with Customers and lists the German customers’ orders along with their dates.

7.Calculate the average unit price of products in each category.
Explanation: This query groups products by category and calculates the average unit price for each category, helping understand the pricing trend across categories.

8.Show the total quantity ordered for each product.
Explanation: By joining Order Details with Products, this query sums the quantities ordered for each product, showing the total quantity sold per product.

## Difficult Queries:
1.Calculate the total revenue for each employee by summing their handled orders.
Explanation: This query calculates revenue per employee by summing the product of unit price, quantity, and discount for each order handled by that employee. Grouping by employee allows revenue calculation per employee.

2.Identify the top 3 most frequently ordered products across all orders.
Explanation: This query identifies the top 3 products ordered in terms of quantity by summing quantities and sorting in descending order.

3.Customer order summary showing the count and total value of orders placed by each customer.
Explanation: This query calculates the total value of orders per customer by joining Orders and Order Details with Customers and grouping results by customer name.

4.Create a view to show orders placed in 1997, including the customer name, order ID, and order date.
Explanation: This query creates a view named OrdersIn1997 that stores orders placed in 1997, enabling quick access to these historical records.

5.Identify customers who have placed orders for products in at least three different categories.
Explanation: This query identifies customers who have ordered products across three or more categories by counting distinct categories and using HAVING to filter for customers meeting the criteria.

6.Find the average discount offered on products ordered in each region.
Explanation: This query calculates the average discount given on products ordered within each region. It joins multiple tables to gather customer location details and then groups results by region, averaging discounts across all orders in each.

7.Find the total revenue generated by each product category and the number of orders placed for products in each category.
Explanation:This query calculates the total revenue and total order count for each product category.

8.List suppliers and their products, showing suppliers who supply three or more unique products.
Explanation:This query lists suppliers who provide three or more unique products, along with the count of those unique products.
