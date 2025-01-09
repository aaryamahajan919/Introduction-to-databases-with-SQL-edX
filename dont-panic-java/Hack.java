import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.util.Scanner;

public class Hack {
    public static void main(String[] args) throws Exception {
        // Create a scanner object to capture user input
        Scanner scanner = new Scanner(System.in);
        System.out.println("Enter the new password: ");
        String password = scanner.nextLine();

        // Establish a connection to the SQLite database
        Connection sqliteConnection = DriverManager.getConnection("jdbc:sqlite:dont-panic.db");

        // Define the SQL query with a placeholder for the password
        String query = """
            UPDATE "users"
            SET "password" = ?
            WHERE "username" = 'admin';
        """;

        // Create a PreparedStatement and set the password
        PreparedStatement sqliteStatement = sqliteConnection.prepareStatement(query);
        sqliteStatement.setString(1, password);

        // Execute the query
        sqliteStatement.executeUpdate();

        // Close the connection and scanner
        sqliteConnection.close();
        scanner.close();

        System.out.println("Password updated successfully!");
    }
}

