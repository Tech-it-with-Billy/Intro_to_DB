import mysql.connector  

mydb = mysql.connector.connect(
    host="localhost",
    user= "root",
    password="Halloween@1"
    database="alx_book_store"
)

mycursor = mydb.cursor()
mycursor.execute(
    "
    CREATE TABLE IF NOT EXISTS Books (
        book_id INT PRIMARY KEY,
        title VARCHAR(130) NOT NULL,
        author_id  FOREIGN KEY (author_id) REFERENCES Authors(author_id),
        price DOUBLE,
        publication_date DATE,
    );

    CREATE TABLE IF NOT EXISTS Authors (
        author_id INT PRIMARY KEY,
        author_name VARCHAR(215) NOT NULL,
    );

    CREATE TABLE IF NOT EXISTS Customers (
        customer_id INT PRIMARY KEY,
        customer_name VARCHAR(215) NOT NULL,
        email VARCHAR(215) UNIQUE NOT NULL,
        address TEXT,
    );

    CREATE TABLE IF NOT EXISTS Orders (
        order_id INT PRIMARY KEY,
        customer_id FOREIGN KEY (customer_id) REFERENCES Customers(customer_id),
        order_date DATE,
    );

    CREATE TABLE IF NOT EXISTS Order_Details (
        orderdetailid INT PRIMARY KEY,
        order_id FOREIGN KEY (order_id) REFERENCES Orders(order_id),
        book_id FOREIGN KEY (book_id) REFERENCES Books(book_id),
        quantity DOUBLE,
    );
    "
)
mycursor.close()
mydb.close()

