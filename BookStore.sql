	/*Drop database BookShop*/
	/*create database BookShop*/

	use BookShop
	go

	-- Table: Author
	CREATE TABLE Authors (
		AuthorID INT IDENTITY(1,1) PRIMARY KEY,
		"Name" VARCHAR(255),
		"Description" TEXT,
		"Image" VARCHAR(255)
	);

	-- Table: Customers
	CREATE TABLE Customers (
		CustomerID INT IDENTITY(1,1) PRIMARY KEY,
		Username VARCHAR(255),
		"Password" VARCHAR(255),
		"Name" VARCHAR(255),
		Email VARCHAR(255),
		"Address" VARCHAR(255),
		PhoneNumber VARCHAR(20)
	);

	-- Table: Employees
	CREATE TABLE Employees (
		EmployeeID INT IDENTITY(1,1) PRIMARY KEY,
		Username VARCHAR(255),
		"Password" VARCHAR(255),
		"Name" VARCHAR(255),
		Email VARCHAR(255),
		PhoneNumber VARCHAR(20),
		"Address" VARCHAR(255),
		HireDate DATE,
		Salary DECIMAL(10, 2),
		"Role" VARCHAR(20)
	);

	CREATE TABLE Categories (
		CategoryID INT IDENTITY(1,1) PRIMARY KEY,
		CategoryName VARCHAR(50) NOT NULL,
		"Description" VARCHAR(255) NOT NULL,
		"Image" VARCHAR(255) NOT NULL
	);

	-- Table: Books
	CREATE TABLE Books (
		BookID INT IDENTITY(1,1) PRIMARY KEY,
		Title VARCHAR(255),
		AuthorID INT,
		"Description" TEXT,
		Price DECIMAL(10, 2),
		PublicationDate DATE,
		Publisher VARCHAR(255),
		QuantityInStock INT,
		CategoryID INT,
		"Image" VARCHAR(255),
		FOREIGN KEY (AuthorID) REFERENCES Authors(AuthorID),
		FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID)
	);

	-- Create the Orders table
	CREATE TABLE Orders (
		OrderID INT IDENTITY(1,1) PRIMARY KEY,
		CustomerID INT,
		EmployeeID INT,
		"Status" nvarchar(10),
		OrderDate DATE,
		"ShippedDate" "datetime",
		"ShipName" nvarchar (40),
		"ShipAddress" nvarchar (60),
		"ShipCity" nvarchar (15),
		FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
		FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID)
	);

	-- Table: OrderItems
	CREATE TABLE OrderDetails (
		OrderID INT,
		BookID INT,
		Quantity INT,
		PricePerUnit DECIMAL(10, 2),
		FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
		FOREIGN KEY (BookID) REFERENCES Books(BookID)
	);

	CREATE TABLE Comments (
		CommentID INT IDENTITY(1,1) PRIMARY KEY,
		CustomerID INT,
		BookID INT,
		Comment TEXT,
		Rating INT,
		CommentDate DATE,
		FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
		FOREIGN KEY (BookID) REFERENCES Books(BookID)
	);

	-- Insert sample data into Categories table
	INSERT INTO Categories ( CategoryName, "Description", "Image")
	VALUES
		('Fiction', 'Books that are based on imagination and not real events.', 'img/Fiction.jpg'),
		('Non-Fiction', 'Books that are based on real events and facts.', 'img/Non-Fiction.jpg'),
		('Mystery', 'Books that involve suspense and the solving of a crime or puzzle.', 'img/Mystery.jpg'),
		('Science', 'Books that explore imaginative and futuristic concepts.', 'img/Science.jpg'),
		('Biography', 'Books that tell the life story of a real person.', 'img/Biography.jpg'),
		('Self-Help', 'Books that provide guidance and advice for personal improvement.', 'img/Self-Help.jpg'),
		('Thriller', 'Books that create an intense, suspenseful atmosphere.', 'img/Thriller.jpg');

	INSERT INTO Authors ("Name", "Description", "Image")
	VALUES
    ('Harper Lee', 'American novelist known for "To Kill a Mockingbird."', 'img/Harper-Lee.jpg'),
    ('George Orwell', 'English author known for "1984."', 'img/George-Orwell.jpg'),
    ('F. Scott Fitzgerald', 'American author known for "The Great Gatsby."', 'img/F.Scott-Fitzgerald.jpg'),
    ('Jane Austen', 'English author known for "Pride and Prejudice."', 'img/Jane-Austen.jpg'),
    ('Virginia Woolf', 'English author known for "To the Lighthouse."', 'img/Virginia-Woolf.jpg'),
    ('Yuval Noah Harari', 'Israeli author known for "Sapiens: A Brief History of Humankind."', 'img/Yuval-Noah-Harari.jpg'),
    ('Mark Manson', 'American author known for "The Subtle Art of Not Giving a F*ck."', 'img/Mark-Manson.jpg'),
    ('Tara Westover', 'American author known for "Educated: A Memoir."', 'img/Tara-Westover.jpg'),
    ('Dan Brown', 'American author known for "The Da Vinci Code."', 'img/Dan-Brown.jpg'),
	('J.R.R. Tolkien', 'English author known for "The Lord of the Rings."', 'img/J.R.R.-Tolkien.jpg'),
    ('J.K. Rowling', 'British author known for the Harry Potter series.', 'img/JK-Rowling.jpg'),
    ('Stephen R. Covey', 'American educator and author known for "The 7 Habits of Highly Effective People."', 'img/Stephen-R-Covey.jpg'),
    ('Napoleon Hill', 'American author known for "Think and Grow Rich."', 'img/Napoleon-Hill.jpg'),
    ('Stieg Larsson', 'Swedish author known for "The Girl with the Dragon Tattoo."', 'img/Stieg-Larsson.jpg'),
    ('Gillian Flynn', 'American author known for "Gone Girl."', 'img/Gillian-Flynn.jpg'),
    ('Eckhart Tolle', 'German-born spiritual teacher known for "The Power of Now."', 'img/Eckhart-Tolle.jpg');

	INSERT INTO Books (Title, AuthorID, "Description", Price, PublicationDate, Publisher, QuantityInStock, CategoryID, "Image")
	VALUES
		('To Kill a Mockingbird', 1, 'A classic novel depicting racial injustice in the 1930s.', 10.99, '1960-07-11', 'Harper Perennial', 20, 1, 'img/To-Kill-a-Mockingbird.jpg'),
		('1984', 2, 'A dystopian novel set in a totalitarian society.', 9.99, '1949-06-08', 'Signet Classics', 15, 1, 'img/1984.jpg'),
		('The Great Gatsby', 3, 'A tale of the American Dream and the Roaring Twenties.', 12.50, '1925-04-10', 'Scribner', 18, 1, 'img/The-Great-Gatsby.jpg'),
		('Pride and Prejudice', 4, 'A classic romance novel featuring Elizabeth Bennet and Mr. Darcy.', 8.99, '1813-01-28', 'Penguin Classics', 25, 1, 'img/Pride-and-Prejudice.jpg'),
		('To the Lighthouse', 5, 'An experimental novel exploring the consciousness of characters.', 11.99, '1927-05-05', 'Harvest Books', 10, 1, 'img/To-the-Lighthouse.jpg'),
		('Sapiens: A Brief History of Humankind', 6, 'A captivating account of the history of Homo sapiens.', 14.99, '2011-04-28', 'Harper Perennial', 30, 2, 'img/A-Brief-History-of-Humankind.jpg'),
		('The Subtle Art of Not Giving a F*ck', 7, 'A self-help book promoting personal growth and resilience.', 13.50, '2016-09-13', 'HarperOne', 22, 2, 'img/The-Subtle-Art-of-Not-Giving-a-Fack.jpg'),
		('Educated: A Memoir', 8, 'A memoir about a woman who overcomes her isolated upbringing through education.', 15.50, '2018-02-20', 'Random House', 12, 2, 'img/Educated-A-Memoir.jpg'),
		('Sapiens: A Graphic History', 6, 'A graphic novel adaptation of the book Sapiens.', 17.99, '2021-10-05', 'Harper Perennial', 8, 2, 'img/A-Graphic-History.jpg'),
		('The Da Vinci Code', 9, 'A thriller revolving around a hidden secret in Leonardo da Vinci’s works.', 9.99, '2003-03-18', 'Anchor', 16, 3, 'img/The-Da-Vinci-Code.jpg'),
		('Harry Potter and the Philosopher''s Stone', 12, 'The first book in the Harry Potter series by J.K. Rowling.', 12.99, '1997-06-26', 'Bloomsbury', 25, 3, 'img/Harry-Potter-and-the-Philosophers-Stone.jpg'),
		('Harry Potter and the Chamber of Secrets', 12, 'The second book in the Harry Potter series by J.K. Rowling.', 13.99, '1998-07-02', 'Bloomsbury', 20, 3, 'img/Harry-Potter-and-the-Chamber-of-Secrets.jpg'),
		('Harry Potter and the Prisoner of Azkaban', 12, 'The third book in the Harry Potter series by J.K. Rowling.', 14.99, '1999-07-08', 'Bloomsbury', 18, 3, 'img/Harry-Potter-and-the-Prisoner-of-Azkaban.jpg'),
		('Harry Potter and the Goblet of Fire', 12, 'The fourth book in the Harry Potter series by J.K. Rowling.', 15.99, '2000-07-08', 'Bloomsbury', 22, 4, 'img/Harry-Potter-and-the-Goblet-of-Fire.jpg'),
		('Harry Potter and the Order of the Phoenix', 12, 'The fifth book in the Harry Potter series by J.K. Rowling.', 16.99, '2003-06-21', 'Bloomsbury', 20, 4, 'img/Harry-Potter-and-the-Order-of-the-Phoenix.jpg'),
		('Harry Potter and the Half-Blood Prince', 12, 'The sixth book in the Harry Potter series by J.K. Rowling.', 17.99, '2005-07-16', 'Bloomsbury', 18, 4, 'img/Harry-Potter-and-the-Half-Blood-Prince.jpg'),
		('Harry Potter and the Deathly Hallows', 12, 'The seventh and final book in the Harry Potter series by J.K. Rowling.', 18.99, '2007-07-21', 'Bloomsbury', 20, 4, 'img/Harry-Potter-and-the-Deathly-Hallows.jpg'),
		('The Fellowship of the Ring', 11, 'The first book in The Lord of the Rings series by J.R.R. Tolkien.', 14.99, '1954-07-29', 'Allen & Unwin', 30, 5, 'img/The-Fellowship-of-the-Ring.jpg'),
		('The Two Towers', 11, 'The second book in The Lord of the Rings series by J.R.R. Tolkien.', 14.99, '1954-11-11', 'Allen & Unwin', 28, 5, 'img/The-Two-Towers.jpg'),
		('The Return of the King', 11, 'The third book in The Lord of the Rings series by J.R.R. Tolkien.', 14.99, '1955-10-20', 'Allen & Unwin', 25, 5, 'img/The-Return-of-the-King.jpg'),
		('The 7 Habits of Highly Effective People', 13, 'A self-help book that provides a holistic approach to personal and professional effectiveness.', 12.99, '1989-08-15', 'Free Press', 15, 6, 'img/7-Habits-of-Highly-Effective-People.jpg'),
		('Think and Grow Rich', 14, 'A personal development and self-help book that emphasizes the power of positive thinking and goal setting.', 10.99, '1937-03-26', 'The Ralston Society', 10, 6, 'img/Think-and-Grow-Rich.jpg'),
		('The Girl with the Dragon Tattoo', 15, 'A gripping thriller novel that follows a journalist and a computer hacker as they investigate a decades-old disappearance.', 14.50, '2005-08-01', 'Norstedts Förlag', 18, 7, 'img/Girl-with-the-Dragon-Tattoo.jpg'),
		('Gone Girl', 16, 'A psychological thriller about a husband whose wife goes missing, with twists and turns that keep the reader guessing.', 13.99, '2012-06-05', 'Crown Publishing Group', 12, 7, 'img/Gone-Girl.jpg');


	INSERT INTO Employees (Username, "Password", "Name", Email, PhoneNumber, "Address", HireDate, Salary, "Role")
	VALUES
		('doremon', 'password1', 'Doremon', 'doremon@gmail.com', '555-1234', '123 Main Street', '2022-01-01', 0, 'Admin'),
		('conan', 'password2', 'Conan', 'conan@gmail.com', '555-5678', '456 Elm Street', '2022-02-01', 2000.00, 'Employee'),
		('goku', 'password3', 'Goku', 'goku@gmail.com', '555-9012', '789 Oak Avenue', '2022-03-01', 2500.00, 'Employee'),
		('ahiru', 'password4', 'Ahiru', 'ahiru@gmail.com', '555-3456', '321 Pine Road', '2022-04-01', 2500.00, 'Employee'),
		('sora', 'password5', 'Sora', 'sora@gmail.com', '555-7890', '654 Cedar Lane', '2022-05-01', 2000.00, 'Employee'),
		('hanazono', 'password6', 'Hanazono', 'hanazono@gmail.com', '555-2345', '987 Birch Court', '2022-06-01', 2500.00, 'Employee');

	INSERT INTO Customers (Username, "Password", "Name", Email, "Address", PhoneNumber)
	VALUES
		('johndoe', 'password7', 'John Doe', 'johndoe@gmail.com', '123 Main Street, Cityville', '555-1234'),
		('janesmith', 'password8', 'Jane Smith', 'janesmith@gmail.com', '456 Elm Street, Townsville', '555-5678'),
		('davidjohnson', 'password9', 'David Johnson', 'davidjohnson@gmail.com', '789 Oak Avenue, Villageton', '555-9012'),
		('sarahwilliams', 'password10', 'Sarah Williams', 'sarahwilliams@gmail.com', '321 Pine Road, Hamletville', '555-3456'),
		('michaelbrown', 'password11', 'Michael Brown', 'michaelbrown@gmail.com', '654 Cedar Lane, Countryside', '555-7890'),
		('emilydavis', 'password12', 'Emily Davis', 'emilydavis@gmail.com', '987 Birch Court, Townsville', '555-2345'),
		('robertwilson', 'password13', 'Robert Wilson', 'robertwilson@gmail.com', '159 Maple Street, Cityville', '555-6789'),
		('oliviamartinez', 'password14', 'Olivia Martinez', 'oliviamartinez@gmail.com', '357 Oak Avenue, Villageton', '555-0123'),
		('danielanderson', 'password15', 'Daniel Anderson', 'danielanderson@gmail.com', '753 Pine Road, Hamletville', '555-4567'),
		('sophiathomas', 'password16', 'Sophia Thomas', 'sophiathomas@gmail.com', '246 Cedar Lane, Countryside', '555-8901');

	INSERT INTO Comments (CustomerID, BookID, Comment, Rating, CommentDate)
	VALUES
		(1, 2, 'Great book! Highly recommended.', 5, '2023-06-15'),
		(3, 4, 'Enjoyed reading this classic.', 4, '2023-06-16'),
		(2, 1, 'The story was captivating.', 4, '2023-06-17'),
		(5, 3, 'Loved the characters and the setting.', 5, '2023-06-18'),
		(1, 5, 'Interesting exploration of consciousness.', 3, '2023-06-18'),
		(4, 6, 'Fascinating insights into human history.', 5, '2023-06-19'),
		(6, 8, 'A memoir that touched my heart.', 4, '2023-06-19'),
		(3, 10, 'Could not put it down!', 4, '2023-06-20'),
		(7, 7, 'Inspiring and thought-provoking.', 5, '2023-06-20'),
		(8, 9, 'Engaging graphic novel adaptation.', 3, '2023-06-21');
