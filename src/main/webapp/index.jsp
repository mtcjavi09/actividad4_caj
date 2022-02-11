<%-- 
    Document   : index
    Created on : 10 feb 2022, 19:18:00
    Author     : Maria Tchijov Cruz
    Calculador de área y perímetro de triángulos equiláteros.
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!-- Importa el controlador -->
<%@page import="controller.MuestraResultados"%>
<!-- Comienza la página principal -->
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!-- Título de la página -->
        <title>Calculadora de triángulos</title>
    </head>
    <body>
        <!-- Comienza la página -->
        <h1>BIENVENID@ A LA CALCULADORA DE TRIÁNGULOS MTC</h1>
        <!-- Se referencia al Servlet MuestraResultados -->
        <form action="MuestraResultados" method="post">
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
