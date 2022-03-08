/*
    APP 07 : CALCULOS EQUILATERO JSP.
    FECHA: 10 DE ENERO DE 2022.
    AUTORA: MARIA TCHIJOV CRUZ.
    CALCULADORA DE PERÍMETRO Y ÁREA DE TRIÁNGULO USANDO SERVLETS.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet(name = "MuestraResultados", urlPatterns = {"/MuestraResultados"})
public class MuestraResultados extends HttpServlet 
{
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException 
    {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) 
        {
            //SE PIDEN LOS DOS PARÁMETROS
            String base = request.getParameter("base");
            String altura = request.getParameter("altura");
            //SE REFERENCIA AL MODELO, CREANDO UN NUEVO OBJETO
            model.Triangulo triangle = new model.Triangulo(base, altura);
            //SE LLAMAN A LOS MÉTODOS PERÍMETRO Y ÁREA
            triangle.perimetro();
            triangle.area();
            //SE GUARDAN LOS RESULTADOS EN VARIABLES LOCALES DEL SERLVET
            int perimetro = triangle.getPerimetro();
            int area = triangle.getArea();
            //SE GUARDA EL NOMBRE DEL USUARIO COMO ATRIBUTO DE SESIÓN PARA SU USO POSTERIOR
            HttpSession sesion = request.getSession();
            sesion.setAttribute("nombre", "Maria");
            //SE GUARDAN LOS RESULTADOS EN UNAS COOKIES
            Cookie ck1 = new Cookie("base", triangle.getBase() + "");
            response.addCookie(ck1);
            ck1.setMaxAge(5000);
            Cookie ck2 = new Cookie("altura", triangle.getAltura() + "");
            response.addCookie(ck2);
            ck2.setMaxAge(5000);
            Cookie ck3 = new Cookie("perimetro", triangle.getPerimetro() + "");
            response.addCookie(ck3);
            ck3.setMaxAge(5000);
            Cookie ck4 = new Cookie("area", triangle.getArea() + "");
            response.addCookie(ck4);
            ck4.setMaxAge(5000);
            //SE AGREGAN SENTENCIAS DE REFERENCIA PARA EL JSP
            request.setAttribute("Cálculos realizados", triangle);
            //SE ENVÍA EL OBJETO AL JSP
            request.getRequestDispatcher("/PantallaResultado.jsp").forward(request,response);            
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
