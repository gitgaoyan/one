package com.inspur.dao;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import com.inspur.entity.Dept;

//通过jdbc连接数据库，获取scott用户下的dept表中的数据
public class deptDao {
	public static void main(String[] args) {
	  try {
		Utils.getConnection();
		StringBuffer sb = new StringBuffer("select deptno,dname,loc from dept");
		StringBuffer sb1 = new StringBuffer("update dept set dname = 'sales' where deptno = '30'");
		StringBuffer sb2 = new StringBuffer("insert into dept values('009','market','beijing')");
		StringBuffer sb3 = new StringBuffer("delete from dept where dname ='market'");
		Utils.updateMethod(sb3.toString());
		Utils.queryMethod(sb.toString());
	} catch (Exception e) {
		e.printStackTrace();
	}finally{
		Utils.closeAll(Utils.conn, Utils.s, Utils.ps, Utils.rs);
	}
	
  }
}	




package com.inspur.dao;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import com.inspur.entity.Dept;

public class Utils {
	public static Connection conn;
	public static Statement s;
	public static PreparedStatement ps;
	public static ResultSet rs;
	public static  void getConnection() throws ClassNotFoundException,
			SQLException {
		//1加载驱动类		
    Class.forName("oracle.jdbc.driver.OracleDriver");
		// 2 建立连接。 谁连接？ 
    String url = "jdbc:oracle:thin:@192.168.3.253:1521:INSPUR";// 通信协议+通信地址,此处的ip地址也可以是一个域名呀。就像http:www.baidu.com
		String username = "scott";
		String password = "tiger";
		conn = DriverManager.getConnection(url, username, password);// 注意连接不是conn自己发起的，而是DriverManager类的getConnection()方法。
			
}

	public static void closeAll(Connection conn,Statement s) {
			try {
				conn.close();
				s.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
	}
	public static void closeAll(Connection conn,Statement s,
			 ResultSet rs) {
			try {
				conn.close();
				s.close();
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
	}
	
	public static void closeAll(Connection conn,Statement s,PreparedStatement ps,
			 ResultSet rs) {
		try {
			conn.close();
			s.close();
			ps.close();
			rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public static List queryMethod(String sql) throws SQLException {
		
		 List<Dept> list=new ArrayList();
     //3 发送sql。谁发送？
     ps=conn.prepareStatement(sql);
     //4 执行sql。【并处理结果】
     rs=ps.executeQuery();
		 Dept dept=new Dept();
		 while(rs.next()){
			dept=new Dept();
			dept.setDeptno(rs.getString("DEPTNO"));
			dept.setDname(rs.getString("DNAME"));
			dept.setLoc(rs.getString("LOC"));
			list.add(dept);		
		}
		for(Dept d : list){
			System.out.println("Deptno="+d.getDeptno()+"  Dname="+d.getDname()+" Location="+d.getLoc());
			System.out.println();
			}
		
		return list;
	}

	public static void updateMethod(String sql) throws Exception{
		 s = conn.createStatement();
		 s.executeUpdate(sql);
	}
	
}
