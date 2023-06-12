# Introduction
More details: [here]()


# Table of Content
* [How do you implement relationship in Access?]()
* [How do you implement a query command in Access?]()


# Getting Started

select Customers.CustomerName, Orders.OrderID 
from Customers
left join Orders on Customers.CustomerID = Orders.CustomerID