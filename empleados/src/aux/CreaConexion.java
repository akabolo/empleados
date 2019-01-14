package aux;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class CreaConexion {
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
