<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Empleados</title>
<style> 
	body{text-align:center;}
	#resultados{background-color: #023659;margin-top:10px;}
	td{height:50px;background-color: #cef9ff;}
	td:hover{background-color: #3bd6e8;}
	table{width:96%;margin-left:2%;border:0px;padding-top:2%;padding-bottom:2%;}
	#top{background-color:white;}
	#datos{border:0.5px grey solid;display:none;margin-bottom:10px;}
	#buscar{display:none;}
	#creaMod{display:none; text-align:center;}
	#tabla2{display:none;}
	#volver{display:none;}
	#dissMod{display:none;}
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
            var filas=[];
            var palabras=[];
           		
            	var prueba = document.getElementById('prueba');   
        	    var tbl = document.getElementById("tabla");
        	    if(document.body.contains(prueba)){
        	    	document.getElementById("prueba").innerHTML='';
        	    	var tblBody = document.getElementById("prueba");
        	    }else{
        	    	var tblBody = document.createElement("tbody");
            	    tblBody.setAttribute("id","prueba");
        	    }
        	    filas=datos.split(";");
        	    for (var i = 0; i < filas.length-1; i++) {
        	        var fila = document.createElement("tr");
        	        palabras=filas[i].split("#");
        	        for (var j = 0; j < palabras.length; j++) {
        	        	if(almacen==0 || almacen==null){
        	        		var almacen=palabras[j]
        	        	}
        	            var celda = document.createElement("td");
        	            var textoCelda = document.createTextNode(palabras[j]);
        	            celda.appendChild(textoCelda);
        	            fila.appendChild(celda);
        	        }
        	        var celda = document.createElement("td");
    	            var textoCelda = document.createElement("button");
    	            var textoBut = document.createTextNode("Eliminar");
    	            textoCelda.setAttribute("type","button");
    	            textoCelda.setAttribute("value",almacen);
    	            textoCelda.setAttribute("onclick","eliminar(this.value)");
    	            textoCelda.appendChild(textoBut);
    	            celda.appendChild(textoCelda);
    	            var textoCelda2 = document.createElement("button");
    	            var textoBut2 = document.createTextNode("Modificar");
    	            textoCelda2.setAttribute("type","button");
    	            textoCelda2.setAttribute("value",almacen);
    	            textoCelda2.setAttribute("onclick","preModificar(this.value)");
    	            textoCelda2.appendChild(textoBut2);
    	            celda.appendChild(textoCelda2);
    	            fila.appendChild(celda);
        	        tblBody.appendChild(fila);
        	        almacen=0;
        	    }
        	    tbl.appendChild(tblBody);
        	    tbl.setAttribute("border", "2");
        }
	    }
        xmlhttp.open("GET","Emp?" + datos ,true);  // crea la conexión con parámetros: método, url, asíncrono?
	    xmlhttp.setRequestHeader("X-Requested-With", "xmlhttprequest");  // establece la cabecera HTTP necesaria
	    xmlhttp.send();  // lanza la solicitud
	}
	
	function preBuscar(){
		document.getElementById("datos").style.display = "none";
		document.getElementById("buscar").style.display = "inline-block";
		document.getElementById("botones").style.display = "none";
		
		var datos = 'preBuscar';
		
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
            var dospalabras= datos.split("#");
            var palabra=[];
            select = document.getElementById('depart');            
            for (var i = 0; i < dospalabras.length-1; i++) {
            	var opt = document.createElement('option');
            	palabra=dospalabras[i].split(";");
                opt.value = palabra[1];
                opt.innerHTML = palabra[0];
                select.appendChild(opt);
            }
        }
	    }
        xmlhttp.open("GET","Emp?" + datos ,true);  // crea la conexión con parámetros: método, url, asíncrono?
	    xmlhttp.setRequestHeader("X-Requested-With", "xmlhttprequest");  // establece la cabecera HTTP necesaria
	    xmlhttp.send();  // lanza la solicitud
	}
	function buscar(){
		var datos = 'apellido=' + document.getElementById("apellido").value 
		 + '&fecMin=' + document.getElementById("fecMin").value
		 + '&fecMax=' + document.getElementById("fecMax").value
		 + '&salMin=' + document.getElementById("salMin").value
		 + '&salMax=' + document.getElementById("salMax").value
		 + '&depart=' + document.getElementById("depart").value
		 + '&buscar';
		
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
            var filas=[];
            var palabras=[];
            
        	    var tbl = document.getElementById("tabla2");
        	    var tblBody = document.createElement("tbody");
        	    filas=datos.split(";");
        	    for (var i = 0; i < filas.length-1; i++) {
        	        var fila = document.createElement("tr");
        	        palabras=filas[i].split("#");
        	        for (var j = 0; j < palabras.length; j++) {
        	        	if(almacen==0 || almacen==null){
        	        		var almacen=palabras[j]
        	        	}
        	            var celda = document.createElement("td");
        	            var textoCelda = document.createTextNode(palabras[j]);
        	            celda.appendChild(textoCelda);
        	            fila.appendChild(celda);
        	        }
        	        var celda = document.createElement("td");
    	            var textoCelda = document.createElement("button");
    	            var textoBut = document.createTextNode("Eliminar");
    	            textoCelda.setAttribute("type","button");
    	            textoCelda.setAttribute("value",almacen);
    	            textoCelda.setAttribute("onclick","eliminar(this.value)");
    	            textoCelda.appendChild(textoBut);
    	            celda.appendChild(textoCelda);
    	            var textoCelda2 = document.createElement("button");
    	            var textoBut2 = document.createTextNode("Modificar");
    	            textoCelda2.setAttribute("type","button");
    	            textoCelda2.setAttribute("value",almacen);
    	            textoCelda2.setAttribute("onclick","preModificar(this.value)");
    	            textoCelda2.appendChild(textoBut2);
    	            celda.appendChild(textoCelda2);
    	            fila.appendChild(celda);
        	        tblBody.appendChild(fila);
        	        almacen=0;
        	    }
        	    tbl.appendChild(tblBody);
        	    tbl.setAttribute("border", "2");
        	    document.getElementById("tabla2").style.display = "table";
        	    document.getElementById("tabla").style.display = "none";
        	    document.getElementById("buscar").style.display = "none";
        	    document.getElementById("volver").style.display = "inline-block";
        }
	    }
        xmlhttp.open("GET","Emp?" + datos ,true);  // crea la conexión con parámetros: método, url, asíncrono?
	    xmlhttp.setRequestHeader("X-Requested-With", "xmlhttprequest");  // establece la cabecera HTTP necesaria
	    xmlhttp.send();  // lanza la solicitud
	}
	function volver(){
		document.getElementById("buscar").style.display = "none";
		document.getElementById("tabla").style.display = "table";
		document.getElementById("tabla2").style.display = "none";
		document.getElementById("botones").style.display = "inline-block";
		document.getElementById("volver").style.display = "none";
		
	}
	function preCrear(){
		document.getElementById("datos").style.display = "none";
		document.getElementById("botones").style.display = "none";
		document.getElementById("creaMod").style.display = "inline";
		document.getElementById("tabla").style.display = "none";
	}
	function crear(){
		var datos = 'nEmp=' + document.getElementById("nEmp").value 
		 + '&apellido2=' + document.getElementById("apellido2").value
		 + '&oficio=' + document.getElementById("oficio").value
		 + '&fech=' + document.getElementById("fech").value
		 + '&jefe=' + document.getElementById("jefe").value
		 + '&salario=' + document.getElementById("salario").value
		 + '&comision=' + document.getElementById("comision").value
		 + '&depart2=' + document.getElementById("depart2").value
		 + '&crear';
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
            document.getElementById("datos").innerHTML=datos;
            document.getElementById("datos").style.display = "inline-block";
            document.getElementById("botones").style.display = "inline-block";
    		document.getElementById("creaMod").style.display = "none";
    		document.getElementById("tabla").style.display = "table";
    		cargarDatos();
        }
	    }
        xmlhttp.open("GET","Emp?" + datos ,true);  // crea la conexión con parámetros: método, url, asíncrono?
	    xmlhttp.setRequestHeader("X-Requested-With", "xmlhttprequest");  // establece la cabecera HTTP necesaria
	    xmlhttp.send();  // lanza la solicitud
		
	}
	function eliminar(id){
		document.getElementById("datos").style.display = "none";
		var datos = 'nEmp=' + id 
		 + '&eliminar';
		 
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
	            document.getElementById("datos").style.display = "inline-block";
	            document.getElementById("datos").innerHTML=datos;
	            
	            cargarDatos();
	        }
		    }
	        xmlhttp.open("GET","Emp?" + datos ,true);  // crea la conexión con parámetros: método, url, asíncrono?
		    xmlhttp.setRequestHeader("X-Requested-With", "xmlhttprequest");  // establece la cabecera HTTP necesaria
		    xmlhttp.send();  // lanza la solicitud
		
	}
	function preModificar(id){
		document.getElementById("datos").style.display = "none";
		var datos = 'nEmp=' + id 
		 + '&preModificar';
		
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
            document.getElementById("datos").innerHTML="Modificar el empleado Nº: "+datos;
            document.getElementById("datos").style.display = "inline-block";
            document.getElementById("botones").style.display = "none";
    		document.getElementById("tabla").style.display = "none";
    		document.getElementById("creaMod").style.display = "inline";
    		document.getElementById("dissMod").style.display = "inline";
    		
    		var x = document.getElementsByClassName("dissCrear");
    		var i;
    		for (i = 0; i < x.length; i++) {
    		  x[i].style.display = "none";
    		} 
        }
	    }
        xmlhttp.open("GET","Emp?" + datos ,true);  // crea la conexión con parámetros: método, url, asíncrono?
	    xmlhttp.setRequestHeader("X-Requested-With", "xmlhttprequest");  // establece la cabecera HTTP necesaria
	    xmlhttp.send();  // lanza la solicitud
		
		
	}
	function modificar(){
		var datos = 'nEmp=' + document.getElementById("nEmp").value 
		 + '&modificar'
		
	}
</script>
</head>
<body onload="cargarDatos()">
	<h1>Empleados</h1>
	
	<div id="datos"></br></div>
	
	<form id="botones">
		<input type="button" value="Buscar Empleado" onclick="preBuscar()"/>
		<input type="button" value="Nuevo Empleado" onclick="preCrear()"/>
	</form>

	<form id="volver">
		<input type="button" value="Volver" onclick="volver()"/>
	</form>

	<div id="buscar">
		<form>
			<h3>Buscar empleado</h3>
			Apellido <input type="text" id="apellido"/></br></br>
			Fecha contratacion inicial <input type="text" id="fecMin"/>
			Fecha contratacion final <input type="text" id="fecMax"/></br></br>
			Salario Mínimo <input type=""text"" id="salMin"/>
			Salario Máximo <input type=""text"" id="salMax"/></br></br>
			Lista de departamentos <select id="depart"><option value=""></select></br></br>
			<input type="button" value="Buscar Empleado" onclick="buscar()"/>
		</form></br>
	</div>
	
	<div id="creaMod">
		<h3 class="dissCrear">Crear nuevo empleado</h3>
		<form>
			<p class="dissCrear">Nº de Empleado * </p><input class="dissCrear" type="text" id="nEmp"/></br></br>
			<p>Apellido </p><input type="text" id="apellido2"/></br></br>
			<p>Fecha contratacion </p><input type="text" id="fech"/></br></br>
			<p>Oficio </p><input type="text" id="oficio"/></br></br>
			<p>Nº de Jefe </p><input type="text" id="jefe"/></br></br>
			<p>Salario </p><input type="text" id="salario"/></br></br>
			<p>Comision </p><input type="text" id="comision"/></br></br>
			<p>Codigo de departamento </p><input type="text" id="depart2"/></br></br>
			<input class="dissCrear" type="button" value="Crear Empleado" onclick="crear()"/>
			<input id="dissMod" type="button" value="Modificar empleado" onclick="modificar()"/>
		</form></br>
	</div>
		
	<div id="resultados">
		<table id="tabla"><tr><td id="top">N.Empleado</td><td id="top">Nombre</td><td id="top">Trabajo</td><td id="top">Jefe</td><td id="top">Fecha de alta</td><td id="top">Salario</td><td id="top">Comisión</td><td id="top">Departamento</td><td id="top"><div>Opciones</div></td></tr></table>
		<table id="tabla2"><tr><td id="top">N.Empleado</td><td id="top">Nombre</td><td id="top">Trabajo</td><td id="top">Jefe</td><td id="top">Fecha de alta</td><td id="top">Salario</td><td id="top">Comisión</td><td id="top">Departamento</td><td id="top"><div>Opciones</div></td></tr></table>
	</div>
</body>
</html>