package serv;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import auxi.CreaConexion;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;

import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;

@WebServlet("/Emp")
public class Emp extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public Emp(){super();}
    
    protected void empleado (HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, ClassNotFoundException, SQLException, ParseException {
        
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        
        // Comprobar si la petición es mediante Ajax
        Boolean esAjax;
        esAjax="XMLHttpRequest".equalsIgnoreCase(request.getHeader("X-Requested-With")); // Cabecera X-Requested-With
        if (esAjax) {
        	
        	CreaConexion con= new CreaConexion();
        	String orden="";
        	//variables cargarDatos
        	String cargarDatos=request.getParameter("cargarDatos");
        	//variables preBuscar
        	String preBuscar=request.getParameter("preBuscar");
        	//variables buscar
        	String buscar=request.getParameter("buscar");
        	String apellido=request.getParameter("apellido");
        	String fecMin=request.getParameter("fecMin");
        	String fecMax=request.getParameter("fecMax");
        	String salMin=request.getParameter("salMin");
        	String salMax=request.getParameter("salMax");
        	String depart=request.getParameter("depart");
        	//variables crear
        	String crear=request.getParameter("crear");
        	String nEmp=request.getParameter("nEmp");
        	String apellido2=request.getParameter("apellido2");
        	String fech=request.getParameter("fech");
        	String oficio=request.getParameter("oficio");
        	String jefe=request.getParameter("jefe");
        	String salario=request.getParameter("salario");
        	String comision=request.getParameter("comision");
        	String depart2=request.getParameter("depart2");
        	//variables eliminar
        	String eliminar=request.getParameter("eliminar");
        	//variables modificar
        	String modificar=request.getParameter("modificar");
        	//variables preModificar
        	String preModificar=request.getParameter("preModificar");
        	
        	if(cargarDatos!=null) {	
        		out.println(con.mostrarEmpleados());
        	}
        	if(preBuscar!=null) {	
        		out.println(con.mostrarDepartamentos());
        	}
        	if(buscar!=null) {	
        		orden="Select * from emp";
        		int where=0;
        		if(apellido!="") {
        			orden+=" where ename='"+apellido+"'";
        			where++;
        		}
        		if(fecMin!="") {
        			if(where==1) {
        				orden+=" and hiredate> '"+fecMin+"'";
        			}else {
        				orden+=" where hiredate> '"+fecMin+"'";
        				where++;
        			}
        		}
        		if(fecMax!="") {
        			if(where==1) {
        				orden+=" and hiredate< '"+fecMax+"'";
        			}else {
        				orden+=" where hiredate< '"+fecMax+"'";
        				where++;
        			}
        		}
        		if(salMin!="") {
        			if(where==1) {
        				orden+=" and sal> "+salMin;
        			}else {
        				orden+=" where sal> "+salMin;
        				where++;
        			}
        		}
        		if(salMax!="") {
        			if(where==1) {
        				orden+=" and sal< "+salMax;
        			}else {
        				orden+=" where sal< "+salMax;
        				where++;
        			}
        		}
        		if(depart!="") {
        			if(where==1) {
        				orden+=" and deptno= "+depart;
        			}else {
        				orden+=" where deptno= "+depart;
        				where++;
        			}
        		}
        		orden+=";";
        		out.println(con.buscar(orden));
        	}
        	if(crear!=null) {
        		SimpleDateFormat formato= new SimpleDateFormat("yyyy-MM-dd");
        		java.util.Date imp=formato.parse(fech);
        		Date fecha=new Date(imp.getTime());
        		fech=formato.format(fecha);
        		int njefe= Integer.parseInt(jefe);
        		int nnEmp= Integer.parseInt(nEmp);
        		float nsalario= Float.parseFloat(salario);
        		float ncomision= Float.parseFloat(comision);
        		if(nnEmp>0 && nnEmp<10000) {
        			orden="INSERT INTO emp VALUES('"+nnEmp+"', '"+apellido2+"', '"+oficio+"', '"+njefe+"', '"+fech+"', '"+nsalario+"', '"+ncomision+"', '"+depart2+"')";
        			int meda=Integer.parseInt(con.crear(orden));
        			out.println("El nuevo empleado Nº: "+nnEmp+" ha sido creado correctamente");
        		}else {
        			out.println("Es obligatorio asignar un Numero de empleado entre 0 y 9999");
        		}
        	}
        	
        	if(eliminar!=null) {
        		String msg;
        		orden="Delete from emp where empno="+nEmp+"";
        		msg=con.eliminar(orden);
        		out.println("Se ha eliminado el empleado correctamente");
        	}
        	if(preModificar!=null) {
        		out.println(nEmp);
        	}
        	if(modificar!=null) {
        		out.println(nEmp);
        	}
           
                        
        }    
        else {
            out.println("Este servlet solo se puede invocar via Ajax");
        }    
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {		
		try {
			empleado(request, response);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			empleado(request, response);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
