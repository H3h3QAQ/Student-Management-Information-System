package utils;

import java.sql.DriverManager;
import java.sql.SQLException;
import com.mysql.jdbc.Connection;

public class DBUtils {
	
    /**
     * 获取数据库连接
     * @return Connection对象
     */
    public static Connection getConnection(){
    	String dbUserName = "root";
    	String dbUserPasswd = "123456";
    	String dbURL = "jdbc:mysql://localhost:3306/studentinfomanagement?"
    	            + "user="+dbUserName+"&password="+dbUserPasswd+"&useSSL=false&useUnicode=true&characterEncoding=UTF8";
    	Connection conn = null;
    	try {
    		Class.forName("com.mysql.jdbc.Driver");
    		conn = (Connection) DriverManager.getConnection(dbURL,dbUserName,dbUserPasswd);
			System.out.println("数据库连接正常🔗");
    	} catch (ClassNotFoundException | SQLException e) {
    		e.printStackTrace();
			System.out.println("数据库连接失败❌");
    	} 
    	return conn;
    }
    
    /**
     * 关闭数据库连接
     * @param conn Connection对象
     */
    public static void closeConnection(Connection conn) {
		//判断conn是否为空
    	if(conn != null){
    		try {
				conn.close();//关闭数据库连接
			} catch (SQLException e) {
				// TODO: handle exception
				e.printStackTrace();
			}
    	}
	}

	public static void main(String[] args) {
		getConnection();
	}
}
