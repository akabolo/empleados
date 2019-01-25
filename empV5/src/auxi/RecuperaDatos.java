package auxi;

import java.sql.*;

public class RecuperaDatos {
	
	//variables apoyo
	String orden="";
	String fin="";
	int finN;
	
	public static Connection conexion() throws ClassNotFoundException,SQLException{
		Class.forName("com.mysql.jdbc.Driver");
		Connection conexion=null;
		conexion= DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/DBBASS?autoReconnect=true&useSSL=false","root","rootroot");
		return conexion;
	}
	
	public String mostrarEmpleados() throws ClassNotFoundException, SQLException{
		fin="";
		Statement sentencia = conexion().createStatement();
		ResultSet resultado = sentencia.executeQuery("Select * from emp");
		while(resultado.next()) {
			fin += resultado.getString(1) +"#"+ resultado.getString(2) +"#"+ resultado.getString(3) +"#"+ resultado.getString(4) +"#"+
					resultado.getString(5) +"#"+ resultado.getString(6) +"#"+ resultado.getString(7) +"#"+ resultado.getString(8)+";";
		}
		return fin;
	}
	public String mostrarDepartamentos() throws ClassNotFoundException, SQLException{
		fin="";
		Statement sentencia = conexion().createStatement();
		ResultSet resultado = sentencia.executeQuery("select dname,deptno from dept");
		while(resultado.next()) {
			fin += resultado.getString(1)+";"+resultado.getString(2)+"#";
		}
		return fin;
	}
	public String buscar(String apellido,String fecMin,String fecMax,String salMin,String salMax,String depart) throws ClassNotFoundException, SQLException{
		fin="";
		orden="";
		orden="Select * from emp";
		int where=0;
		if(apellido!="") {
			orden+=" where ename='"+apellido+"'";
			where++;
		}
		if(fecMin!="") {
			if(where==1) {
				orden+=" and hiredate>'"+fecMin+"'";
			}else {
				orden+=" where hiredate>'"+fecMin+"'";
				where++;
			}
		}
		if(fecMax!="") {
			if(where==1) {
				orden+=" and hiredate<'"+fecMax+"'";
			}else {
				orden+=" where hiredate<'"+fecMax+"'";
				where++;
			}
		}
		if(salMin!="") {
			if(where==1) {
				orden+=" and sal>"+salMin;
			}else {
				orden+=" where sal>"+salMin;
				where++;
			}
		}
		if(salMax!="") {
			if(where==1) {
				orden+=" and sal<"+salMax;
			}else {
				orden+=" where sal<"+salMax;
				where++;
			}
		}
		if(depart!="") {
			if(where==1) {
				orden+=" and deptno="+depart;
			}else {
				orden+=" where deptno="+depart;
				where++;
			}
		}
		orden+=";";
		Statement sentencia = conexion().createStatement();
		ResultSet resultado = sentencia.executeQuery(orden);
		while(resultado.next()) {
			fin += resultado.getString(1) +"#"+ resultado.getString(2) +"#"+ resultado.getString(3) +"#"+ resultado.getString(4) +"#"+
					resultado.getString(5) +"#"+ resultado.getString(6) +"#"+ resultado.getString(7) +"#"+ resultado.getString(8)+";";
		}
		return fin;
	}
	public int crear(int nnEmp,String apellido2,String oficio,int njefe,String fech,float nsalario,float ncomision,String depart2) throws ClassNotFoundException, SQLException{
		orden="INSERT INTO emp VALUES('"+nnEmp+"','"+apellido2+"','"+oficio+"','"+njefe+"','"+fech+"','"+nsalario+"','"+ncomision+"','"+depart2+"')";
		Statement sentencia = conexion().createStatement();
		finN = sentencia.executeUpdate(orden);
		return finN;
	}
	public int eliminar(String nEmp) throws ClassNotFoundException, SQLException{
		Statement sentencia = conexion().createStatement();
		orden="Delete from emp where empno="+nEmp+"";
		finN = sentencia.executeUpdate(orden);
		return finN;
	}
	public int modificar(String apellido2,String oficio,int njefe,String fech,float nsalario,float ncomision,String depart2,int nnEmp) throws ClassNotFoundException, SQLException{
		Statement sentencia = conexion().createStatement();
		orden="UPDATE emp SET ename ='"+apellido2+"',job='"+oficio+"',mgr='"+njefe+"',hiredate='"+fech+"',sal='"+nsalario+"',comm='"+ncomision+"',deptno='"+depart2+"' where empno="+nnEmp+";";
		finN = sentencia.executeUpdate(orden);
		return finN;
	}
}
