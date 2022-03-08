<%-- 
    Document   : PantallaResultado
    Created on : 10 feb 2022, 20:00:37
    Author     : Maria Tchijov Cruz.
    Calculador de área y perímetro de triángulos equiláteros usando servlets y jsp.
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!-- Se importa el modelo -->
<%@page import="model.Triangulo"%>
<!-- Comienza la página principal -->
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!-- Título de la página -->
        <title>Cálculos completados</title>
    </head>
    <body>
        <!-- Comienza la pantalla de resultados -->
        <h1>Los resultados son:</h1>
        <!-- Se hace el request para el servlet -->
        <%
            Triangulo triangle = (Triangulo) request.getAttribute("Cálculos realizados");
        %>
        <!-- Se muestran los resultados al usuario -->
        <h2>Área:<br>(<%=triangle.getBase()%> * <%=triangle.getAltura()%>) / 2 = <%=triangle.getArea()%></h2><br>
        <h2>Perímetro:<br>3 * <%=triangle.getBase()%> = <%=triangle.getPerimetro()%></h2>
    </body>
</html>
