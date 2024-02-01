import until.MySQLConnect;

import java.sql.Connection;

public class Application {
    public static void main(String[] args) {
        Connection conn = MySQLConnect.open();
        if (conn != null)
            System.out.println("Success");
        else
            System.out.println("Failed");
    }
}
