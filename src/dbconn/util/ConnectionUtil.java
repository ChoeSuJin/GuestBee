package dbconn.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

public class ConnectionUtil {
	
	public static Connection Connect() {
		Connection conn = null;
		try {
			Class.forName("oracle.jdbc.OracleDriver");
			conn = DriverManager.getConnection(
					"jdbc:oracle:thin:@localhost:1521:xe", 
					"guestbee", 
					"oracle");
		
		} catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			return conn;
		}
		
	}

}
