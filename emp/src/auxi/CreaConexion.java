package auxi;

import java.sql.*;
import java.util.ArrayList;

public class CreaConexion {
	
	public static Connection conexion() throws ClassNotFoundException,SQLException{
		Class.forName("com.mysql.jdbc.Driver");
		Connection conexion=null;
		conexion= DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/DBBASS?autoReconnect=true&useSSL=false","root","rootroot");
		return conexion;
	}
	
	public String mostrarEmpleados() throws ClassNotFoundException, SQLException{
		String fin="";
		Statement sentencia = conexion().createStatement();
		ResultSet resultado = sentencia.executeQuery("Select * from emp");
		while(resultado.next()) {
			fin += resultado.getString(1) +"#"+ resultado.getString(2) +"#"+ resultado.getString(3) +"#"+ resultado.getString(4) +"#"+
					resultado.getString(5) +"#"+ resultado.getString(6) +"#"+ resultado.getString(7) +"#"+ resultado.getString(8)+";";
		}
		return fin;
	}
	public String mostrarDepartamentos() throws ClassNotFoundException, SQLException{
		String fin="";
		Statement sentencia = conexion().createStatement();
		ResultSet resultado = sentencia.executeQuery("select dname,deptno from dept");
		while(resultado.next()) {
			fin += resultado.getString(1)+";"+resultado.getString(2)+"#";
		}
		return fin;
	}
	public String buscar(String a) throws ClassNotFoundException, SQLException{
		String fin="";
		Statement sentencia = conexion().createStatement();
		ResultSet resultado = sentencia.executeQuery(a);
		while(resultado.next()) {
			fin += resultado.getString(1) +"#"+ resultado.getString(2) +"#"+ resultado.getString(3) +"#"+ resultado.getString(4) +"#"+
					resultado.getString(5) +"#"+ resultado.getString(6) +"#"+ resultado.getString(7) +"#"+ resultado.getString(8)+";";
		}
		return fin;
	}
	public String crear(String a) throws ClassNotFoundException, SQLException{
		int fin;
		Statement sentencia = conexion().createStatement();
		fin = sentencia.executeUpdate(a);
		
		return Integer.toString(fin);
	}
	public String eliminar(String a) throws ClassNotFoundException, SQLException{
		int fin;
		Statement sentencia = conexion().createStatement();
		fin = sentencia.executeUpdate(a);
		return Integer.toString(fin);
	}
}
