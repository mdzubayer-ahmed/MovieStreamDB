# MovieStreamDB

MovieStreamDB is a robust movie streaming platform database and management system. It handles movies, subscriptions, payments, and ratings while offering a clean, user-friendly interface for administration and reporting.

## Features
- **Movies Management**: Add, edit, and view movie details.
- **Subscriptions**: Manage user subscriptions with statuses and timelines.
- **Payments**: Track payment details and methods.
- **Ratings**: Display user ratings and reviews for movies.
- **Reports**: Generate insights such as top-rated movies and subscription counts.

## Tech Stack
- **Database**: MySQL for efficient data storage and management.
- **Backend**: Python Flask for server-side logic and routing.
- **Frontend**: HTML and CSS for a responsive and user-friendly interface.

# Project Structure
MovieStreamDB/
│
├── app/
│   ├── __init__.py    # Application factory
│   ├── db.py          # Database connection and management
│   ├── routes.py      # Application routes
│   └── templates/     # HTML templates
│
├── database/          # SQL files for database setup
├── run.py             # Application entry point
└── README.md          # Project documentation

# Set up the database:

- Please import the SQL files into your MySQL server to create the required tables.
- Update the database credentials in app/__init__.py (the port number, hostname and password)
- Run the application using: `python run.py`
- Open your browser and navigate to: `http://127.0.0.1:5000`

# Usage
- Navigate through the admin dashboard to manage movies, subscriptions, payments, and ratings.
- Generate reports to analyze data and trends.
