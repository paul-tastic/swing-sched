# Swing Scheduler

A flutter app that replaces the paper sign-in sheet!

# To Install and run

1. git clone the repo to a local computer
2. open in IDE inside the codebase, select a device as an emulator
3. Run through your IDE (VS Code is Run->Start Debugging)

# Assumptions

1. only need to schedule current day (as per instructions).
2. building API endpoints for data is beyond the scope (but I built data requirements below).
3. the required fields are the same as the the paper sign in sheet (name and phone number).

# TODO/Expansino of capabilities:

1. Add authentication, user login
2. retrieve calendar/appointments from API
3. update appointments to server via API
4. add cupertino icons for iOS (coded this on a PC)
5. Integrate testing before major build out
6. add previous visits column in appt booking
7. add calendar feature to select different days
8. add dashboard of stats (# booked, # open slots, average class per days, busiest days)
9. add menu options: logout, profile, dashboard

Database/API requirements:

1. Users table (authentication) is there is already a web app in place? Hit endpoint, secret token exchange.
2. Appointments table
3. Customers table
