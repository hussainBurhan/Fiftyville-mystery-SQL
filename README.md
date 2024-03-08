
# Fiftyville Mystery

## Overview

Fiftyville Mystery is a SQL-based project that aims to solve a series of crimes in the fictional town of Fiftyville. The project involves analyzing data from various sources, such as witness statements, transaction records, and travel itineraries, to identify suspects and unravel the mystery.

## Getting Started

To get started with this project, you will need to have a SQL database management system (DBMS) installed, such as SQLite, MySQL, or PostgreSQL. You will also need to import the provided data into your DBMS.

### Prerequisites

- SQL database management system (SQLite, MySQL, PostgreSQL, etc.)
- Basic knowledge of SQL queries

### Installation

1. Clone this repository to your local machine:
   ```
   git clone https://github.com/your-username/fiftyville-mystery.git
   ```

2. Navigate to the project directory:
   ```
   cd fiftyville-mystery
   ```

3. Import the database file `fiftyville.db` into your SQL DBMS.

## Usage

Once you have the database set up, you can start exploring the data and writing SQL queries to solve the mystery. The main areas of investigation are:

- **Witness Statements**: Analyze statements from witnesses to gather clues.
- **Transaction Records**: Examine financial transactions to track suspects' movements.
- **Travel Itineraries**: Investigate travel records to determine suspects' locations at the time of the crimes.

Example query:

```sql
SELECT * FROM witnesses WHERE location = 'Fiftyville Park';
```

## Contributing

Contributions are welcome! If you have any suggestions or improvements, feel free to fork the repository and submit a pull request.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Acknowledgments

- Thanks to the CS50 team for providing the inspiration for this project.
- Special thanks to all the contributors who helped in developing and refining the project.
