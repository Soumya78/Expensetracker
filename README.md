Expense Tracking App
An Expense Tracking application built with Flutter. This app allows users to track daily expenses by adding expense details, viewing a list of expenses, and navigating through sections like home, profile, and charts. It uses a bottom navigation bar for easy navigation and a modal for adding new expenses.

Features
Add and list expenses with titles, amounts, categories, and dates.
View expenses in a categorized list format.
Bottom navigation bar with Home, Profile, and Chart sections.
Floating action button to quickly add new expenses.
Provider and MVVM architecture for efficient state management.
Screens
Home Screen: Displays the list of expenses.
Add Expense Modal: Opens a form for adding a new expense.
Bottom Navigation: Contains icons for Home, Profile, and Chart for easy navigation.
Installation
Clone the repository:

bash
Copy code
git clone https://github.com/your-username/expense-tracking-app.git
cd expense-tracking-app
Install dependencies:

bash
Copy code
flutter pub get
Run the app:

bash
Copy code
flutter run
Code Structure
lib/main.dart: Entry point for the application.
lib/model/expensemodel.dart: Defines the data model for an expense.
lib/widgets/expenselist.dart: Displays the list of expenses.
lib/widgets/new_expense.dart: Modal widget for adding a new expense.
Usage
Home Screen: View all expenses.
Add New Expense: Tap on the floating action button to open a modal to add a new expense.
Profile & Chart Sections: Navigate using the bottom navigation bar for future functionalities.
Dependencies
Flutter: Framework for building the app.
Provider: For state management and MVVM architecture support.
Contributing
Feel free to open issues or create pull requests. Contributions are welcome!

License
This project is licensed under the MIT License. See the LICENSE file for details.
