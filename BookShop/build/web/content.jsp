<%-- 
    Document   : content
    Created on : Jul 10, 2023, 9:11:27 PM
    Author     : tranh
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="entity.Book,java.sql.ResultSet" %>
<!DOCTYPE html>

<%
    ResultSet rs = (ResultSet) request.getAttribute("listBook");
%>  


<div class="row px-xl-5 pb-3">
    <!--Loop through each book in the list--> 
    <%while(rs.next()){%>
    <div class="col-lg-3 col-md-6 col-sm-12 pb-1">
        <div class="card product-item border-0 mb-4">
            <div class="card-header product-img position-relative overflow-hidden bg-transparent border p-0">
                <!--Book image--> 
                <img class="img-fluid w-100" style="height: 290px;" src="<%=rs.getString(10)%>" alt="">
            </div>
            <div class="card-body border-left border-right text-center p-0 pt-4 pb-3">
                <!--Book title--> 
                <h6 class="text-truncate mb-3"><%=rs.getString(2)%></h6>
                <div class="d-flex justify-content-center">
                    <!--Book price--> 
                    <h6>$<%=rs.getString(5)%></h6>
                </div>
            </div>
            <div class="card-footer d-flex justify-content-between bg-light border">
                <%if(session.getAttribute("permission")!=null){%>
                <%if(session.getAttribute("permission").toString().equals("Admin")){%>
                <a href="BookController?go=update&bookid=<%=rs.getString(1)%>" class="btn btn-sm text-dark p-0"><i class="fas fa-eye text-primary mr-1"></i>Update</a>
                <a href="BookController?go=remove&bookid=<%=rs.getString(1)%>" class="btn btn-sm text-dark p-0"><i class="fas fa-shopping-cart text-primary mr-1"></i>Remove</a>
                <%}else{%>
                <a href="DetailController?bookid=<%=rs.getString(1)%>" class="btn btn-sm text-dark p-0"><i class="fas fa-eye text-primary mr-1"></i>View Detail</a>
                <a href="CartController?go=add2Cart&bookid=<%=rs.getString(1)%>"
                   class="btn btn-sm text-dark p-0"><i class="fas fa-shopping-cart text-primary mr-1"></i>Add To Cart</a>
                <%}%>
                <%}else{%>
                <a href="DetailController?bookid=<%=rs.getString(1)%>" class="btn btn-sm text-dark p-0"><i class="fas fa-eye text-primary mr-1"></i>View Detail</a>
                <a href="CartController?go=add2Cart&bookid=<%=rs.getString(1)%>"
                   class="btn btn-sm text-dark p-0"><i class="fas fa-shopping-cart text-primary mr-1"></i>Add To Cart</a>
                <%}%>
            </div>
        </div>
    </div>
    <%}%>
</div>
