-- Identifying the thief based on multiple criteria
SELECT name -- Selecting the name of the potential thief
  FROM people
 WHERE license_plate IN (
    SELECT license_plate -- Selecting license plates matching certain criteria from bakery security logs
      FROM bakery_security_logs
     WHERE day = 28 AND month = 7 AND year = 2021 -- Narrowing down the date
       AND hour = 10 AND minute BETWEEN 15 AND 25 -- Narrowing down the time frame
       AND activity = "exit" -- Specific activity logged
)
AND id IN (
    SELECT id -- Selecting IDs matching certain criteria from bank accounts and ATM transactions
      FROM people
     WHERE id IN (
        SELECT person_id
          FROM bank_accounts
         WHERE account_number IN (
            SELECT account_number
              FROM atm_transactions
             WHERE day = 28 AND month = 7 AND year = 2021 -- Narrowing down the date
               AND atm_location = "Leggett Street" -- Narrowing down the location
               AND transaction_type = "withdraw" -- Specific transaction type
        )
    )
)
AND phone_number IN (
    SELECT caller -- Selecting phone numbers matching certain criteria from phone call records
      FROM phone_calls
     WHERE day = 28 AND month = 7 AND year = 2021 -- Narrowing down the date
       AND duration < 60 -- Calls with duration less than 60 seconds
)
AND passport_number IN (
    SELECT passport_number -- Selecting passport numbers matching certain criteria from flight passenger records
      FROM passengers
     WHERE flight_id IN (
        SELECT id -- Selecting flight IDs matching certain criteria from flight records
          FROM flights
         WHERE hour = 8 AND minute = 20 AND month = 7 AND year = 2021 -- Narrowing down the date and time
           AND day = 29 -- Narrowing down the date
           AND origin_airport_id = (
                SELECT id -- Selecting airport IDs for a specific city
                  FROM airports
                 WHERE city = "Fiftyville" -- Narrowing down the city
            )
    )
);

-- Retrieving the city information for the destination airport of the flight
SELECT city -- Selecting the city name
  FROM airports
 WHERE id IN (
    SELECT destination_airport_id -- Selecting destination airport IDs
      FROM flights
     WHERE hour = 8 AND minute = 20 AND month = 7 AND year = 2021 -- Narrowing down the date and time
       AND day = 29 -- Narrowing down the date
       AND origin_airport_id = (
            SELECT id -- Selecting airport IDs for a specific city
              FROM airports
             WHERE city = "Fiftyville" -- Narrowing down the city
        )
);

-- Finding the potential accomplice based on phone call records
SELECT name -- Selecting the name of the potential accomplice
  FROM people
 WHERE phone_number = (
    SELECT receiver -- Selecting receiver phone numbers
      FROM phone_calls
     WHERE day = 28 AND month = 7 AND year = 2021 -- Narrowing down the date
       AND duration < 60 -- Calls with duration less than 60 seconds
       AND caller = (
            SELECT phone_number -- Selecting phone numbers associated with a specific person
              FROM people
             WHERE name = 'Bruce' -- Narrowing down the person's name
        )
);
