<%-- 
    Document   : index
    Created on : 10 feb 2022, 19:18:00
    Author     : Maria Tchijov Cruz
    Calculador de área y perímetro de triángulos equiláteros usando servlets y jsp.
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!-- Importa el controlador -->
<%@page import="controller.MuestraResultados"%>
<!-- Importa el modelo para guardar el nombre del usuario -->
<%@page import="model.Triangulo"%>
<!-- Se notifica que es una sesión http -->
<%@page import="java.util.*" import="javax.swing.*" session="true"%> 
<!-- Comienza la página del formulario -->
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!-- Título de la página -->
        <title>Calculadora de triángulos</title>
    </head>
    <body>
        <!-- Comienza la página -->
        <!-- Se pide el nombre del usuario -->
        <%
            //Se crea la sesión
            HttpSession sesion = request.getSession(); 
            //Se verifica si existen atributos de sesión guardados
            Enumeration e = sesion.getAttributeNames();
            //Se crea la variable para guardar el nombre del usuario en la anterior sesión
            String name = "";
            //Se crean las variables para guardar los mensajes con los datos encontrados en las cookies
            String mensajeUsuario = "", mensajePerimetro = "", mensajeArea = "";
            
            //Si encuentra un nombre, se guarda en la variable name
            if (e.hasMoreElements())
            {
                name = sesion.getAttribute("nombre").toString();
                if(name != null || name != "")
                {mensajeUsuario = "Los resultados calculados por " + name + " en la sesión anterior, fueron:";}
            }            
            //Se crean las variables que guardarán las cookies
            String base = "", altura = "", perimetro = "", area = "";
            //Se verifica si existen cookies guardadas
            Cookie ck[]= request.getCookies();
            if (ck != null)
            {
                for (int x = 0; x<ck.length; x++)
                {
                    //SE VERIFICA EL ÚLTIMO VALOR DE LA BASE
                    if (ck[x].getName().equals("base"))
                    {base = ck[x].getValue();}
                    //SE VERIFICA EL ÚLTIMO VALOR DE LA ALTURA
                    if (ck[x].getName().equals("altura"))
                    {altura = ck[x].getValue();}
                    //SE VERIFICA EL ÚLTIMO VALOR DEL PERÍMETRO
                    if (ck[x].getName().equals("perimetro"))
                    {perimetro = ck[x].getValue();}
                    //SE VERIFICA EL ÚLTIMO VALOR DEL ÁREA
                    if (ck[x].getName().equals("area"))
                    {area = ck[x].getValue();}
                }
                
                if (base != "" && perimetro != "")
                {mensajePerimetro = "Perímetro: " + base + " * 3 = " + perimetro;}
                if (base != "" && altura != "" && area != "")
                {mensajeArea = "Área: (" + base + " * " + altura + ") / 2 = " + area;}
            }
        %>
        
        <h3><%if (mensajeUsuario != "") {out.print(mensajeUsuario);}%></h3>
        <h4><%if (mensajePerimetro != "") {out.print(mensajePerimetro);}%></h4>
        <h4><%if (mensajeArea != "") {out.print(mensajeArea);}%></h4>
        
        <!-- Se referencia al Servlet MuestraResultados -->
        <form action="MuestraResultados" method="post">
            <!-- Se saluda al usuario -->
            <h1>¡Bienvenid@ a la calculadora de triángulos! :D</h1>
            <h2>A continuación, llena la siguiente información: </h2>
            <!-- Se pide el nombre del usuario -->
            <% if(!e.hasMoreElements() || e.equals(null))
            {%>Usuario:<br><input type="text" name="usuario" value=""><%}
            else
            {%>Tu nombre es: 
            <%  out.print(name+"\n");
                request.setAttribute("usuario", name);
            }%><br>
            <!-- Se pide la base y la altura -->
            Base:<br>
            <input type="text" name="base" value=""><br>
            Altura:<br>
            <input type="text" name="altura" value=""><br>
            <!-- Se agrega el botón de submit -->
            <br><input type="submit" value="¡Calcular el triángulo!"/>
        </form>
    </body>
</html>
