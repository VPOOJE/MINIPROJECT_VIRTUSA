import csv
import os
import matplotlib.pyplot as plt

FILE_NAME = "expenses.csv"


def create_file():
    if not os.path.exists(FILE_NAME):
        with open(FILE_NAME, "w", newline="") as f:
            writer = csv.writer(f)
            writer.writerow(["Date", "Category", "Amount", "Description"])


def add_expense():
    date = input("Enter date (YYYY-MM-DD): ")
    category = input("Enter category (Food/Travel/Bills/etc): ")
    amount = float(input("Enter amount: "))
    desc = input("Enter description: ")

    with open(FILE_NAME, "a", newline="") as f:
        writer = csv.writer(f)
        writer.writerow([date, category, amount, desc])

    print("Expense added successfully!\n")


def read_expenses():
    data = []
    with open(FILE_NAME, "r") as f:
        reader = csv.DictReader(f)
        for row in reader:
            data.append(row)
    return data


def monthly_summary():
    month = input("Enter month (YYYY-MM): ")
    expenses = read_expenses()

    total = 0
    category_data = {}

    for row in expenses:
        if row["Date"].startswith(month):
            amt = float(row["Amount"])
            total += amt

            cat = row["Category"]
            category_data[cat] = category_data.get(cat, 0) + amt

    print(f"\nTotal spending in {month}: {total}")

    print("\nCategory breakdown:")
    for cat, amt in category_data.items():
        print(cat, ":", amt)

    if category_data:
        highest = max(category_data, key=category_data.get)
        print("\nHighest spending category:", highest)

    print("\n--- Suggestions ---")

    if category_data and total > 0:
        highest = max(category_data, key=category_data.get)
        percent = (category_data[highest] / total) * 100

        print(f"You are spending the most on '{highest}' ({percent:.1f}%).")

        if percent > 40:
            print(f" Try to reduce spending on {highest}. It is too high.")

    if total > 10000:
        print(" Your total spending is high. Consider setting a budget.")
    elif total < 3000:
        print(" Good job! Your spending is under control.")
    else:
        print(" Your spending is moderate. Try to optimize more.")

    if category_data:
        plt.pie(category_data.values(), labels=category_data.keys(), autopct="%1.1f%%")
        plt.title("Expense Distribution")
        plt.show()


def menu():
    create_file()

    while True:
        print("\n--- Expense Tracker ---")
        print("1. Add Expense")
        print("2. Monthly Summary")
        print("3. Exit")

        choice = input("Enter choice: ")

        if choice == "1":
            add_expense()
        elif choice == "2":
            monthly_summary()
        elif choice == "3":
            print("Exiting...")
            break
        else:
            print("Invalid choice!")


menu()