package aux;

import java.sql.*;
import java.util.ArrayList;

public class CreaConexion {
	
	public static Connection conexion() throws ClassNotFoundException,SQLException{
		Class.forName("com.mysql.jdbc.Driver");
		Connection conexion=null;
		conexion= DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/DBBASS","root","rootroot");
		return conexion;
	}
	
	public String mostrarEmpleados() throws ClassNotFoundException, SQLException{
		String fin="";
		Statement sentencia = conexion().createStatement();
		//ResultSet resultado = sentencia.executeQuery("Select emp.empno, emp.ename, emp.job, emp.mgr, emp.hiredate, emp.sal, emp.comm, dept.dname from emp,dept where emp.deptno = dept.deptno");
		ResultSet resultado = sentencia.executeQuery("Select * from dept");
		while(resultado.next()) {
			
			fin = resultado.getString(1) +"#"+ resultado.getString(2) +"#"+ resultado.getString(3) +"#"+ resultado.getString(4) +"#"+
					resultado.getString(5) +"#"+ resultado.getString(6) +"#"+ resultado.getString(7) +"#"+ resultado.getString(8)+";";
		}
		return fin;
		
	}
	/*
	try {
		Class.forName("com.mysql.jdbc.Driver");
	} catch (ClassNotFoundException e1) {
		System.err.println("El driver no se encuentra");
		System.exit(-1);
	}
	Connection conexion=null;
	try {
		conexion= DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/","root","rootroot");			
		Statement sentencia = conexion.createStatement();
		ResultSet resultado = sentencia.executeQuery("Select");
		while(resultado.next()) {
			
		}
		resultado.close();
		sentencia.close();
		conexion.close();
		
	} catch (SQLException e) {
		System.out.println("Error en la base de datos" + e1.getMessage());
		e1.printStackTrace();
	}
	finally {
		if(conexion!=null) {
			try {
				conexion.close();
			}
			catch(SQLException e) {
				System.err.println("Error al cerrar la conexión" + e.getMessage());
			}
		}
	}
	*/
}
