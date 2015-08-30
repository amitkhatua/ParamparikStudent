/**
 * 
 */
package in.student.param.framework;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Properties;

import org.apache.log4j.Logger;

/**
 * @author amitk933
 * 
 */
public class ConnectionManager {
	
    private static final String DRIVER_CLASS = "oracle.jdbc.driver.OracleDriver";
    private static Logger logger = Logger.getLogger("ConnectionManager");
	

	public static Connection getConnection() throws Exception {

		Connection conn = null;
		try {
			Properties prop = new Properties();
			prop.load(ConnectionManager.class.getClassLoader().getResourceAsStream("in/student/param/properties/db.properties"));
            String userName = prop.getProperty("db.user");
            String password = prop.getProperty("db.password");
            String connURL = prop.getProperty("db.url");

			Class.forName(DRIVER_CLASS);
			conn = DriverManager.getConnection(connURL, userName, password);
			logger.info("Got connection from Driver manager");
		} catch (SQLException sqle) {
			throw sqle;
		} catch (ClassNotFoundException cnfe) {
			throw cnfe;
		}catch (Exception e) {
			throw e;
		}

		return conn;
	}

	public static void close(Connection conn, Statement stmt, ResultSet rset, PreparedStatement ps) // throws
	// Exception
	{
		if (rset != null) {
			try {
				rset.close();
			} catch (Throwable ex) {
				logger.error(" Exception occured in if block(reset) of close method  ", ex);
			}
		}
		if (stmt != null) {
			try {
				stmt.close();
			} catch (Throwable ex) {
				logger.error(" Exception occured in if block(stmt) of close method  ", ex);
			}
		}
		if (ps != null) {
			try {
				ps.close();
			} catch (Throwable ex) {
				logger.error(" Exception occured in if block(ps) of close method  ", ex);
			}
		}

		if (conn != null) {
			try {
				conn.close();
			} catch (Throwable ex) {
				logger.error(" Exception occured in if block(conn) of close method  ", ex);
			}
		}

	}

}
