package servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/emp")
public class emp extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
    public emp(){super();}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
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
			System.out.println("Error en la base de datos" + e.getMessage());
			e.printStackTrace();
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
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}