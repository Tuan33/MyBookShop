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
        <%
            if(session.getAttribute("permission")==null){
                response.sendRedirect("LoginController");
            }else if(!session.getAttribute("permission").toString().equals("Admin")){
                response.sendRedirect("LoginController");
            }
        %>
        <jsp:include page="pannel.jsp"></jsp:include>


            <!-- Recent Sales Start -->
            <div class="container-fluid pt-4 px-4">
                <div class="bg-light text-center rounded p-4">
                    <div class="d-flex align-items-center justify-content-between mb-4">
                        <h6 class="mb-0">Bill Manager</h6>
                    </div>
                <%
                    ResultSet rs = (ResultSet) request.getAttribute("rsOrderDetail");
                    String statusD = (String) request.getAttribute("statusD");
                %>
                <div class="table-responsive">
                    <form action="BillController" method="post">
                        <table class="table text-start align-middle table-bordered table-hover mb-0">
                            <thead>
                                <tr class="text-dark">
                                    <th scope="col">OrderID</th>
                                    <th scope="col">BookID</th>
                                    <th scope="col">Quantity</th>
                                    <th scope="col">PricePerUnit</th>
                                    <th scope="col">Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%while(rs.next()){%>

                                <tr>
                                    <td><%=rs.getString(1)%></td>
                                    <td><%=rs.getString(2)%></td>
                                    <%if(statusD.equals("done")){%>
                                    <td><%=rs.getString(3)%></td>
                                    <td><%=rs.getString(4)%></td>
                                    <%}else{%>
                                    <!--if(statusD.equals("wait")||statusD.equals("process"))-->
                                    <td><input type="text" name="quantity" value="<%=rs.getString(3)%>" style="width: 42px; text-align: center"></td>
                                    <td>$<input type="text" name="price" value="<%=rs.getString(4)%>" style="width: 52px; text-align: center"></td>        
                                        <%}%>
                                    <td>
                                        <input type="hidden" name="oid" value="<%=rs.getString(1)%>">
                                        <input type="hidden" name="bid" value="<%=rs.getString(2)%>">
                                        <a class="btn btn-sm btn-primary" 
                                           href="BillController?go=removeOrderDetail&oid=<%=rs.getString(1)%>&bid=<%=rs.getString(2)%>">Remove</a></td>
                                </tr>
                                <%}%>
                            </tbody>
                        </table>
                        <input type="submit" value="Update" class="btn btn-sm btn-primary">
                        <input type="hidden" name="go" value="updateOrderDetail">
                    </form>
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
