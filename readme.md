
# MovieStreamDB

## Project Description and Purpose
This is a comprehensive database and web application that simulates the operations of a movie streaming service. It runs on local server, with the frontend built using HTML and the backend powered by Python (using Flask), and MySQL for the Database. The application is designed to provide seamless CRUD (Create, Retrieve, Update, Delete) functionality for managing users, movies, genres, ratings, subscriptions, and payments. This application features live server-side integration, which allows users to modify the database directly from the frontend interface. This enables efficient interaction with the database while ensuring real-time updates and consistency across  the system. This was initially developed as the final project of COMP 4754 course at MUN offered by Prof. Hafez Seliem on Fall-2024.

---

## Table of Contents
1. [Key Functionalities and Features](#key-functionalities-and-features)
2. [Project Structure](#project-structure)
3. [Front-end pages and Their Purpose](#Front-end-pages-and-Their-Purpose)
4. [Database Schema](#database-schema)
5. [Description of the Database Tables and Their Functionality](#description-of-the-database-tables-and-their-functionality)
6. [How to Install and Run the Project](#how-to-install-and-run-the-project)
7. [How to Use the Project](#how-to-use-the-project)
8. [Contributors](#contributors)
9. [Latest updates](#Latest-updates)
10. [Future Development](#future-development-Thoughts)
11. [Re-using/Cloning the code](#Cloning-the-code)

---

## Key Functionalities and Features
- **Dashboard**: The main page of the server, shows the key metrics related to the database
- **User Management**: View, Add, edit, and delete user records.
- **Movies and Genres**: Manage a comprehensive database of movies and their associated genres.
- **Ratings and Reviews**: Enable users to add, edit, and view ratings for movies.
- **Subscriptions and Payments**: Track and manage user subscriptions and payment history.
- **Reports**: Generate reports and execute complex queries on the database.

---

## Project Structure
```
MovieStreamDB/
├── app/
│   ├── __init__.py                         # Initializes the Flask app
│   ├── routes.py                           # Defines API endpoints and routing
│   ├── queries.py                          # Stores and executes the SQL Queries (as per demo feedback)
│   ├── db.py                               # Manages database connections
│   ├── templates/
│   |   ├── base.html                       # Base layout used across all templates 
│   |   ├── dashboard.html                  # Admin dashboard page 
│   |   ├── reports.html                    # Page to display and generate reports 
│   |   ├── add_genre.html                  # Form to add a new genre 
│   |   ├── edit_genre.html                 # Form to edit an existing genre 
│   |   ├── genres.html                     # Page to list and manage genres 
│   |   ├── add_movie.html                  # Form to add a new movie 
│   |   ├── edit_movie.html                 # Form to edit an existing movie 
│   |   ├── movies.html                     # Page to list and manage movies 
│   |   ├── add_user.html                   # Form to add a new user 
│   |   ├── edit_user.html                  # Form to edit an existing user 
│   |   ├── users.html                      # Page to list and manage users 
│   |   ├── add_subscription.html           # Form to add a new subscription 
│   |   ├── edit_subscription.html          # Form to edit an existing subscription 
│   |   ├── subscriptions.html              # Page to list and manage subscriptions 
│   |   ├── add_payment.html                # Form to add a new payment 
│   |   ├── edit_payment.html               # Form to edit an existing payment 
│   |   ├── payments.html                   # Page to list and manage payments 
│   |   ├── add_rating.html                 # Form to add a new rating 
│   |   ├── edit_rating.html                # Form to edit an existing rating 
│   |   ├── ratings.html                    # Page to list and manage ratings
├── database/
|   ├── database.sql           # SQL script for creating, and populating the database automatically 
|   ├── trigger.sql          # SQL script for triggers table (user login tracking) 
├── Documents/
|   ├── Group1-Phase1.pdf                       # Phase-1 submission of the project (Project Overview)
|   ├── Group1-Phase2.pdf                       # Phase-2 submission (ERD, Relational Schema, and Normalization)
|   ├── project-Report.pdf                      # Final Project Report
├── run.py                                  # Main application entry point
├── readme.md                               # This file
```

---

## Front-end pages and Their Purpose
- `http://127.0.0.1:5000`: Dashboard (under development for key metrics, data and operations visualizations)
- `/movies`, `/movies/add`, `/movies/edit/<movieID>`, `/movies/delete/<movieID>`: For Viewing Movies list with attributes, adding, editing and deleting movies
- `/genres`, `/genres/add`, `/genres/edit/<movieID><genreID>`, `/genres/delete`: For Viewing genres list with movie title, adding, editing and deleting genres
- `/users`, `/users/add`, `/users/edit/<userID>`, `/users/delete/<userID>`: For Viewing users list with attributes, adding, editing and deleting users
- `/subscriptions`, `/subscriptions/add`, `/subscriptions/edit/<subscriptionID>`, `/subscriptions/delete/<subscriptionID>`: For Viewing subscriptions list, status, adding, editing and deleting subscriptions
- `/payments`, `/payments/add`, `/payments/edit/<paymentID>`, `/payments/delete/<paymentID>`: For Viewing, adding, editing and deleting payments
- `/ratings`, `/ratings/add`, `/ratings/edit/<movieID><userID>`, `/ratings/delete/<movieID><userID>`: For Viewing, adding, editing and deleting ratings
- `/reports` : For showing a comprehensive report of the database (currently under development)

---

## Database Schema
The database schema consists of the following main tables:
1. **Users**: Stores information about users, including name, email, and subscription status.
2. **Movies**: Contains details about movies such as title, release year, and associated genres.
3. **Genres**: Lists all movie genres and their metadata.
4. **Ratings**: Collects user-submitted ratings and reviews for movies.
5. **Subscriptions**: Tracks subscription plans and status.
6. **Payments**: Manages payment history, including amounts and timestamps.

---

## Description of the Database Tables and Their Functionality
- **Users**:
  - Primary key: UserID
  - Attributes: userName, email, password, date_of_birth
- **Movies**:
  - Primary key: Movieid
  - Attributes: title, release_date, duration, description
- **Movie Genre**:
  - Primary key: movieid, movie_genre
- **Ratings**:
  - Primary key: userId, movieid
  - Attributes: ratingScore, review, rating_date
- **Subscriptions**:
  - Primary key: Subscription_id
  - Attributes: UserID, StartDate, End_Date, subscription_status
- **Payments**:
  - Primary key: Payment_id
  - Attributes: payment_amount, card_no, payment_date, payment_method, subscription_id

---

## How to Install and Run the Project
### Prerequisites
- Python
- Flask framework
- MySQL database
- MySQL Workbench

### Steps
1. please clone the repository from terminal using:
   `git clone <https://github.com/mdzubayer-ahmed/MovieStreamDB>` and run using `cd MovieStreamDB`

2. Install dependencies:
   `pip install flask, mysql.connector`

3. Set up the database:
   - Open MySQL Workbench or your preferred database tool.
   - Create a new database using :
     `CREATE DATABASE movie_streaming;`
   - Configure `MovieStreamDB/app/db.py` and `MovieStreamDB/app/__init__.py` with your MySQL host, username, password, and database name (movie_streaming or any other name if you wrote while creating the database)
   - Populate the database:
     `mysql -u <username/root> -p movie_streaming < moviestreaming/movie_streaming_<table_name>.sql`
4. Run the application:
   `python run.py`
5. Now the application should be live at `http://127.0.0.1:5000`.

---

## How to Use the Project
1. Intuitive design in the front end you'll find yourself in the Dashboard.
2. Access the relevant tabs from the navigation bar for CRUD operations on users, movies, genres, payments, ratings and subscriptions.
2. Navigate to the reports section to generate reports (under development)
3. Test user interactions by adding, removing or editing data using the buttons and HTML forms.

---

## Contributors
The initial project was developed by Group 1 of the COMP-4754 Database Systems course. I have further refined and integrated the advanced functionalities on the project. <br>
**Contributors:**

- Md. Zubayer Ahmed <br>
ID: 202160438 <br>
Email: mzahmed@mun.ca

- Jason Wheeler <br>
ID: 202018057 <br>
Email: jwheeler@mun.ca

- Tanjet Tanjet <br>
ID: 202174678 <br>
Email: tanjett@mun.ca

---
## Latest updates
(Date: December 09, 2024, by Md. Zubayer Ahmed)
- Unified the Database
- Added SQL Triggers and procedures
- Created Database.sql to create and populate the database automatically

----

## Future Development Thoughts
- Implementation of a Query page so the user can do their own queries from the front-end
- Implementation of user authentication with role-based access control.
- Expanding the database attributes, integrity and functionalities.

## Cloning the code:
Under all circumstances, this project is NOT permitted to be cloned/re-used since it was a group effort and part of an academic course. Please email all three of us before cloning the code. Thanks
