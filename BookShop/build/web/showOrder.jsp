<%-- 
    Document   : showOrder
    Created on : Jul 21, 2023, 10:28:43 AM
    Author     : tranh
--%>
<%@page import="java.sql.ResultSet, entity.Order"%>
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
        <link href="lib2/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
        <link href="lib2/tempusdominus/css/tempusdominus-bootstrap-4.min.css" rel="stylesheet" />

        <!-- Customized Bootstrap Stylesheet -->
        <link href="css2/bootstrap.min.css" rel="stylesheet">

        <!-- Template Stylesheet -->
        <link href="css2/style.css" rel="stylesheet">

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
            Order ord = (Order)request.getAttribute("ord");
        %>
        <jsp:include page="pannel.jsp"></jsp:include>
            <form action="BillController" method="POST">
                <div class="col-sm-12 col-xl-6">
                    <div class="bg-light rounded h-100 p-4">
                        <h6 class="mb-4">Detail</h6>
                        <div class="form-floating mb-3">
                            <input readonly type="text" class="form-control" id=""
                                   name="OrderID" placeholder="OrderID" value="<%=ord.getOrderID()%>">
                        <label for="floatingInput">OrderID</label>
                    </div>
                    <div class="form-floating mb-3">
                        <input readonly type="text" class="form-control" id=""
                               name="EmployeeID" placeholder="EmployeeID" value="<%=ord.getEmployeeId() == 0 ? "0" : ord.getEmployeeId()%>">
                        <label for="floatingInput">EmployeeID</label>
                    </div>
                    <div class="form-floating mb-3">
                        <select class="form-select" id="floatingSelect"
                                aria-label="Floating label select example"
                                name="status">
                            <option value="wait" <%=ord.getStatus().equals("wait") ? "selected" : ""%>>Wait</option>
                            <option value="process" <%=ord.getStatus().equals("process") ? "selected" : ""%>>Process</option>
                            <option value="done" <%=ord.getStatus().equals("done") ? "selected" : ""%>>Done</option>
                        </select>
                        <label for="floatingSelect">Status</label>
                    </div>
                    <div class="form-floating mb-3">
                        <input type="date" class="form-control" id=""
                               name="OrderDate" placeholder="OrderDate"
                               value="<%=ord.getOrderDate()%>">
                        <label for="floatingInput">OrderDate</label>
                    </div>
                    <div class="form-floating mb-3">
                        <input type="text" class="form-control" id=""
                               name="ShippedDate" placeholder="ShippedDate"
                               value="<%=ord.getShippedDate()%>">
                        <label for="floatingInput">ShippedDate</label>
                    </div>
                    <div class="form-floating mb-3">
                        <input type="text" class="form-control" id=""
                               name="ShipName" placeholder="ShipName"
                               value="<%=ord.getShipName()%>">
                        <label for="floatingInput">ShipName</label>
                    </div>
                    <div class="form-floating mb-3">
                        <input type="text" class="form-control" id=""
                               name="ShipAddress" placeholder="ShipAddress"
                               value="<%=ord.getShipAddress()%>">
                        <label for="floatingInput">ShipAddress</label>
                    </div>
                    <div class="form-floating mb-3">
                        <input type="text" class="form-control" id=""
                               name="ShipCity" placeholder="ShipCity"
                               value="<%=ord.getShipCity()%>">
                        <label for="floatingInput">ShipCity</label>
                    </div>
                    <input type="submit" name="submit" value="update">
                    <input type="hidden" name="go" value="updateOrder">
                </div>
            </div>
        </form>
        <jsp:include page="footer.jsp"></jsp:include>
        <!-- JavaScript Libraries -->
        <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
        <script src="lib2/chart/chart.min.js"></script>
        <script src="lib2/easing/easing.min.js"></script>
        <script src="lib2/waypoints/waypoints.min.js"></script>
        <script src="lib2/owlcarousel/owl.carousel.min.js"></script>
        <script src="lib2/tempusdominus/js/moment.min.js"></script>
        <script src="lib2/tempusdominus/js/moment-timezone.min.js"></script>
        <script src="lib2/tempusdominus/js/tempusdominus-bootstrap-4.min.js"></script>

        <!-- Template Javascript -->
        <script src="js2/main.js"></script>
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

