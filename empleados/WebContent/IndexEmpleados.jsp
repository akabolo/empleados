<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Empleados</title>
<style> 
	body{text-align:center;}
	#resultados{background-color: #023659;}
	td{height:50px;background-color: #cef9ff;}
	td:hover{background-color: #3bd6e8;}
	table{width:96%;margin-left:2%;border:0px;padding-top:2%;padding-bottom:2%;}
	#top{background-color:white;}
</style>
<script type="text/javascript">
	function cargarDatos(){
		var datos = 'cargarDatos';
		
		var xmlhttp;  // objeto XMLHttpRequest
        if (window.XMLHttpRequest) {  // para IE7+, Firefox, Chrome, Opera, Safari
            xmlhttp = new XMLHttpRequest();
        } else {  // para IE6, IE5
            xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
        }
        xmlhttp.onreadystatechange = function() {
        // si el resultado está listo (readyState==4) y la respuesta es correcta (status==200)
        if (xmlhttp.readyState==4 && xmlhttp.status==200) {
            var datos = xmlhttp.responseText;
            var palabras;
        	var mi="";
			datos=datos.split(";");
            for (i=0;i<datos.length;i++){
            	palabras=datos[i].split("#");
            	for (i=0;i<palabras.length;i++){
            		mi+=palabras[i]+" ~";
            	}
            	
            }
            document.getElementById("datos").innerHTML=mi;
            /*document.getElementById("datos").innerHTML=almacen;*/
        }
	    }
        xmlhttp.open("GET","emp?" + datos ,true);  // crea la conexión con parámetros: método, url, asíncrono?
	    xmlhttp.setRequestHeader("X-Requested-With", "xmlhttprequest");  // establece la cabecera HTTP necesaria
	    xmlhttp.send();  // lanza la solicitud
	}
</script>
</head>
<body onload="cargarDatos()">
	<h1>Empleados</h1>
	<div id="resultados">
		<table>
		<tr><td id="top">N.Empleado</td><td id="top">Nombre</td><td id="top">Trabajo</td><td id="top">Jefe</td><td id="top">Fecha de alta</td><td id="top">Salario</td><td id="top">Comisión</td><td id="top">Departamento</td><td id="top"><div>Opciones</div></td></tr>
		<tr><td>fila1</td><td>fila1</td><td>fila1</td><td>fila1</td><td>fila1</td><td>fila1</td><td id="borrar"><div>x</div></td></tr>
		<tr><td>fila</td></tr>
		<tr><td></td></tr>
		<tr><td></td></tr>
		<tr><td></td></tr>
		<tr><td></td></tr>
		</table>
	</div>
	<div id="datos">
	
	</div>
</body>
</html>