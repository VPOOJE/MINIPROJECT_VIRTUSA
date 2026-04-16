import java.util.*;

// Book class
class Book {
    int id;
    String title;
    String author;
    boolean issued;

    Book(int id, String title, String author) {
        this.id = id;
        this.title = title;
        this.author = author;
        this.issued = false;
    }
}

// User class
class User {
    int id;
    String name;

    User(int id, String name) {
        this.id = id;
        this.name = name;
    }
}

// Transaction class
class Transaction {
    int bookId;
    int userId;
    Date issueDate;
    Date dueDate;
    Date returnDate;

    Transaction(int bookId, int userId, Date issueDate, Date dueDate) {
        this.bookId = bookId;
        this.userId = userId;
        this.issueDate = issueDate;
        this.dueDate = dueDate;
        this.returnDate = null;
    }
}

// Main class
public class LibrarySystem {

    static ArrayList<Book> books = new ArrayList<>();
    static ArrayList<User> users = new ArrayList<>();
    static ArrayList<Transaction> records = new ArrayList<>();
    static Scanner sc = new Scanner(System.in);

    // Add Book
    static void addBook() {
        System.out.print("Enter Book ID: ");
        int id = sc.nextInt();
        sc.nextLine();

        System.out.print("Enter Title: ");
        String title = sc.nextLine();

        System.out.print("Enter Author: ");
        String author = sc.nextLine();

        books.add(new Book(id, title, author));
        System.out.println("Book added successfully!");
    }

    // View Books
    static void viewBooks() {
        if (books.isEmpty()) {
            System.out.println("No books available.");
            return;
        }

        for (Book b : books) {
            System.out.println(b.id + " | " + b.title + " | " + b.author + " | Issued: " + b.issued);
        }
    }

    // ✅ Remove Book
    static void removeBook() {
        System.out.print("Enter Book ID to remove: ");
        int id = sc.nextInt();

        Iterator<Book> it = books.iterator();
        boolean found = false;

        while (it.hasNext()) {
            Book b = it.next();
            if (b.id == id) {
                if (b.issued) {
                    System.out.println("Book is currently issued. Cannot remove!");
                    return;
                }
                it.remove();
                found = true;
                System.out.println("Book removed successfully!");
                break;
            }
        }

        if (!found) {
            System.out.println("Book not found!");
        }
    }

    // Register User
    static void addUser() {
        System.out.print("Enter User ID: ");
        int id = sc.nextInt();
        sc.nextLine();

        System.out.print("Enter Name: ");
        String name = sc.nextLine();

        users.add(new User(id, name));
        System.out.println("User registered successfully!");
    }

    // Issue Book
    static void issueBook() {
        System.out.print("Enter Book ID: ");
        int bookId = sc.nextInt();

        System.out.print("Enter User ID: ");
        int userId = sc.nextInt();

        Book selectedBook = null;

        for (Book b : books) {
            if (b.id == bookId && !b.issued) {
                selectedBook = b;
                break;
            }
        }

        if (selectedBook == null) {
            System.out.println("Book not available!");
            return;
        }

        Date issueDate = new Date();
        Calendar cal = Calendar.getInstance();
        cal.setTime(issueDate);
        cal.add(Calendar.DATE, -3); // 👈 for testing fine
        Date dueDate = cal.getTime();

        records.add(new Transaction(bookId, userId, issueDate, dueDate));
        selectedBook.issued = true;

        System.out.println("Book issued! Due date: " + dueDate);
    }

    // Return Book
    static void returnBook() {
        System.out.print("Enter Book ID: ");
        int bookId = sc.nextInt();

        for (Transaction t : records) {
            if (t.bookId == bookId && t.returnDate == null) {
                t.returnDate = new Date();

                for (Book b : books) {
                    if (b.id == bookId) {
                        b.issued = false;
                        break;
                    }
                }

                long diff = t.returnDate.getTime() - t.dueDate.getTime();
                long lateDays = diff / (1000 * 60 * 60 * 24);

                if (lateDays > 0) {
                    double fine = lateDays * 5;
                    System.out.println("Late return! Fine: ₹" + fine);
                } else {
                    System.out.println("Returned on time. No fine.");
                }
                return;
            }
        }

        System.out.println("Transaction not found!");
    }

    // Search Book
    static void searchBook() {
        sc.nextLine();
        System.out.print("Enter title or author: ");
        String key = sc.nextLine().toLowerCase();

        boolean found = false;

        for (Book b : books) {
            if (b.title.toLowerCase().contains(key) || b.author.toLowerCase().contains(key)) {
                System.out.println(b.id + " | " + b.title + " | " + b.author);
                found = true;
            }
        }

        if (!found) {
            System.out.println("No matching books found.");
        }
    }

    // Menu
    public static void main(String[] args) {
        while (true) {
            System.out.println("\n--- Library Menu ---");
            System.out.println("1. Add Book");
            System.out.println("2. View Books");
            System.out.println("3. Remove Book");
            System.out.println("4. Register User");
            System.out.println("5. Issue Book");
            System.out.println("6. Return Book");
            System.out.println("7. Search Book");
            System.out.println("8. Exit");

            System.out.print("Enter choice: ");
            int choice = sc.nextInt();

            switch (choice) {
                case 1: addBook(); break;
                case 2: viewBooks(); break;
                case 3: removeBook(); break;
                case 4: addUser(); break;
                case 5: issueBook(); break;
                case 6: returnBook(); break;
                case 7: searchBook(); break;
                case 8: System.exit(0);
                default: System.out.println("Invalid choice!");
            }
        }
    }
}