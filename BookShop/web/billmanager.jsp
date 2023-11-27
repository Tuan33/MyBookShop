<%-- 
    Document   : bookmanager
    Created on : Jul 18, 2023, 11:53:51 PM
    Author     : tranh
--%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title>EShopper - Bootstrap Shop Template</title>
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <meta content="Free HTML Templates" name="keywords">
        <meta content="Free HTML Templates" name="description">

        <!-- Favicon -->
        <link href="img/favicon.ico" rel="icon">

        <!-- Google Web Fonts -->
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap" rel="stylesheet"> 

        <!-- Font Awesome -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">

        <!-- Libraries Stylesheet -->
        <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">

        <!-- Customized Bootstrap Stylesheet -->
        <link href="css/style.css" rel="stylesheet">
    </head>
    <body>
        <jsp:include page="pannel.jsp"></jsp:include>

        <%
            if(session.getAttribute("permission")==null){
                response.sendRedirect("LoginController");
            }else if(!session.getAttribute("permission").toString().equals("Admin")){
                response.sendRedirect("LoginController");
            }
        %>
        <!-- Recent Sales Start -->
        <div class="container-fluid pt-4 px-4">
            <div class="bg-light text-center rounded p-4">
                <form action="BillController" method="POST">
                    <a href="BillController?go=statusFilter&statusf=wait">Wait</a>
                    <a href="BillController?go=statusFilter&statusf=process" >Process</a>
                    <a href="BillController?go=statusFilter&statusf=done" >Done</a>
                </form>
                <div class="d-flex align-items-center justify-content-between mb-4">
                    <h6 class="mb-0">Bill Manager</h6>
                </div>
                <div class="table-responsive">
                    <table class="table text-start align-middle table-bordered table-hover mb-0">
                        <thead>
                            <tr class="text-dark">
                                <th scope="col">OrderID</th>
                                <th scope="col">CustomerID</th>
                                <th scope="col">Status</th>
                                <th scope="col">OrderDate</th>
                                <th scope="col">ShipName</th>
                                <th scope="col">Location</th>
                                <th scope="col">Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                ResultSet rs = (ResultSet) request.getAttribute("rsOrder");
                                while(rs.next()){
                            %>
                            <tr>
                                <td><%=rs.getString(1)%></td>
                                <td><%=rs.getString(2)%></td>
                                <td><%=rs.getString(3)%></td>
                                <td><%=rs.getString(4)%></td>
                                <td><%=rs.getString(5)%></td>
                                <td><%=rs.getString(6)%></td>
                                <td>
                                    <%
                                        if(!rs.getString(3).equals("done")) {
                                    %>
                                    <a class="btn btn-sm btn-primary" href="BillController?go=updateOrder&oid=<%=rs.getString(1)%>">Update</a>

                                    <%
                                        } else {
                                    %>
                                    Already done
                                    <%
                                        }
                                    %>
                                    <a class="btn btn-sm btn-primary" href="BillController?go=showOrderDetail&oid=<%=rs.getString(1)%>&statusD=<%=rs.getString(3)%>">Detail</a></td>
                            </tr>
                            <%}%>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <!-- Recent Sales End -->

        <jsp:include page="footer.jsp"></jsp:include>
        <!-- JavaScript Libraries -->
        <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
        <script src="lib/easing/easing.min.js"></script>
        <script src="lib/owlcarousel/owl.carousel.min.js"></script>

        <!-- Contact Javascript File -->
        <script src="mail/jqBootstrapValidation.min.js"></script>
        <script src="mail/contact.js"></script>

        <!-- Template Javascript -->
        <script src="js/main.js"></script>
    </body>
</html>
