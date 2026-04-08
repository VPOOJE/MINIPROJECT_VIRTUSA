import java.util.Scanner;

public class PasswordValidator {


public static boolean isValidPassword(String password) {
    boolean hasUpper = false;
    boolean hasDigit = false;

  
    if (password.length() < 8) {
        System.out.println("Password is too short (minimum 8 characters required)");
        return false;
    }

   
    for (int i = 0; i < password.length(); i++) {
        char ch = password.charAt(i);

        if (Character.isUpperCase(ch)) {
            hasUpper = true;
        }

        if (Character.isDigit(ch)) {
            hasDigit = true;
        }
    }

  
    if (!hasUpper) {
        System.out.println("Missing an uppercase letter");
    }

    if (!hasDigit) {
        System.out.println("Missing a digit");
    }

    return hasUpper && hasDigit;
}

public static void main(String[] args) {
    Scanner sc = new Scanner(System.in);
    String password;

    while (true) {
        System.out.print("Enter your password: ");
        password = sc.nextLine();

        if (isValidPassword(password)) {
            System.out.println("Password is strong and accepted!");
            break;
        } else {
            System.out.println(" Please try again.\n");
        }
    }

    sc.close();
}


}
