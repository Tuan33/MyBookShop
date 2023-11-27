<%-- 
    Document   : menu
    Created on : Jul 8, 2023, 9:29:02 PM
    Author     : tranh
--%>
<%@page import="entity.Book,java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
    ResultSet rsCate = (ResultSet) request.getAttribute("listCate");
    String tag = (String) request.getAttribute("tag");
    if(tag == null){
     tag="";
    }
%>  

<div class="col-lg-3 d-none d-lg-block">
    <a class="btn shadow-none d-flex align-items-center justify-content-between bg-primary text-white w-100" data-toggle="collapse" href="#navbar-vertical" style="height: 65px; margin-top: -1px; padding: 0 30px;">
        <h6 class="m-0">Categories</h6>
        <!--<i class="fa fa-angle-down text-dark"></i>-->
    </a>
    <!--<nav class="collapse show navbar navbar-vertical navbar-light align-items-start p-0 border border-top-0 border-bottom-0" id="navbar-vertical">-->
    <div class="align-items-center justify-content-between w-100 overflow" style="height: 410px">
        <a href="HomeController?go=displayAll" class="nav-item nav-link <%=tag.equals("") ? "activecate":"" %>">All</a>
        <%while(rsCate.next()){%>
        <a class="nav-item nav-link <%=tag.equals(rsCate.getString(1)) ? "activecate":"" %>" href="HomeController?go=displayCate&cateid=<%=rsCate.getString(1)%>"><%=rsCate.getString(2)%></a>
        <%}%>
    </div>
    <!--</nav>-->
</div>