<%-- 
    Document   : checkout
    Created on : Jul 5, 2023, 6:53:28 PM
    Author     : tranh
--%>
<%@page import="entity.Book , java.util.Vector , java.text.DecimalFormat" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

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

            <!-- Checkout Start -->
            <form action="CheckoutController" method="post">
                <div class="container-fluid pt-5">
                    <div class="row px-xl-5">
                        <div class="col-lg-8">
                            <div class="mb-4">
                                <h4 class="font-weight-semi-bold mb-4">Billing Address</h4>
                                <div class="row">
                                    <div class="col-md-12 form-group">
                                        <label>Ship name</label>
                                        <input name="shipname" class="form-control" type="text">
                                    </div>
                                    <div class="col-md-12 form-group">
                                        <label>Ship address</label>
                                        <input name="shipaddress" class="form-control" type="text">
                                    </div>
                                    <div class="col-md-12 form-group">
                                        <label>Ship city</label>
                                        <input name="shipcity" class="form-control" type="text">
                                    </div>
                                </div>
                            </div>
                        </div>
                    <%
                        double total = 0;
                        DecimalFormat decimalFormat = new DecimalFormat("#.00");
                        Vector<Book> listBook = (Vector<Book>) request.getAttribute("listBook");
                    %>
                    <div class="col-lg-4">
                        <div class="card border-secondary mb-5">
                            <div class="card-header bg-secondary border-0">
                                <h4 class="font-weight-semi-bold m-0">Order Total</h4>
                            </div>
                            <div class="card-body">
                                <h5 class="font-weight-medium mb-3">Products</h5>
                                <%   
                                for (Book book : listBook){
                                %>
                                <div class="d-flex justify-content-between">
                                    <p><%=book.getTitle()%> x<%=book.getQuantityInStock()%></p>
                                    <p>$<%=book.getPrice()*book.getQuantityInStock()%></p>
                                </div>
                                <%total+=book.getPrice()*book.getQuantityInStock();%>
                                <%}%>
                                <hr class="mt-0">
                                <div class="d-flex justify-content-between mb-3 pt-1">
                                    <h6 class="font-weight-medium">Subtotal</h6>
                                    <h6 class="font-weight-medium">$<%=decimalFormat.format(total)%></h6>
                                </div>
                                <div class="d-flex justify-content-between">
                                    <h6 class="font-weight-medium">Shipping</h6>
                                    <h6 class="font-weight-medium">$5</h6>
                                </div>

                            </div>
                            <div class="card-footer border-secondary bg-transparent">
                                <div class="d-flex justify-content-between mt-2">
                                    <h5 class="font-weight-bold">Total</h5>
                                    <h5 class="font-weight-bold">$<%=decimalFormat.format(total+5)%></h5>
                                </div>
                            </div>

                        </div>
                        <div class="card-footer border-secondary bg-transparent">
                            <input type="hidden" name="go" value="order">
                            <input type="submit" value="Order" class="btn btn-lg btn-block btn-primary font-weight-bold my-3 py-3">
                        </div>
                    </div>
                </div>
            </div>
        </form>
        <!-- Checkout End -->


        <jsp:include page="footer.jsp"></jsp:include>


        <!-- Back to Top -->
        <a href="#" class="btn btn-primary back-to-top"><i class="fa fa-angle-double-up"></i></a>


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
