<%-- 
    Document   : sair
    Created on : 02/04/2019, 16:33:04
    Author     : Administrador
--%>

<%
session.removeAttribute("funcionario");
response.sendRedirect("login.jsp");

%>