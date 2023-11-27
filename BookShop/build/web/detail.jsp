<%-- 
    Document   : detail
    Created on : Jul 5, 2023, 6:53:41 PM
    Author     : tranh
--%>
<%@page import="entity.Book,java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charsBooket="utf-8">
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
    <%
            ResultSet rsBook = (ResultSet) request.getAttribute("bookdetail");
    %> 

    <body>
        <jsp:include page="pannel.jsp"></jsp:include>
            <!-- Shop Detail Start -->
        <%while(rsBook.next()){%>
        <div class="container-fluid py-5">
            <div class="row px-xl-5">
                <div class="col-lg-5 pb-5">
                    <div class="card-header product-img position-relative overflow-hidden bg-transparent border p-0">
                        <!--Book image--> 
                        <img class="img-fluid w-100" style="height: 700px;" src="<%=rsBook. getString(10)%>" alt="">
                    </div>
                </div>

                <div class="col-lg-7 pb-5">
                    <h3 class="font-weight-semi-bold"><%=rsBook.getString(2)%></h3>
                    <div class="d-flex mb-3">

                    </div>
                    <h3 class="font-weight-semi-bold mb-4">$<%=rsBook.getString(5)%></h3>
                    <p class="mb-4"><%=rsBook.getString(4)%></p>
                    <div class="d-flex mb-3">
                        <p class="text-dark font-weight-medium mb-0 mr-3"></p>
                    </div>
                    <div class="d-flex mb-4">
                        <p class="text-dark font-weight-medium mb-0 mr-3">Author: <%=rsBook.getString(3)%></p>
                    </div>
                    <div class="d-flex mb-4">
                        <p class="text-dark font-weight-medium mb-0 mr-3" style="margin-right: 4px !important">Category: </p>
                        <a href="HomeController?go=displayCate&cateid=<%=rsBook.getString(11)%>" class="text-dark font-weight-medium mb-0 mr-3"> <%=rsBook.getString(9)%></a>
                    </div>
                    <div class="d-flex mb-4">
                        <p class="text-dark font-weight-medium mb-0 mr-3">Publication date: <%=rsBook.getString(6)%></p>
                    </div>
                    <div class="d-flex mb-4">
                        <p class="text-dark font-weight-medium mb-0 mr-3">Publisher: <%=rsBook.getString(7)%></p>
                    </div>
                    <div class="d-flex mb-4">
                        <p class="text-dark font-weight-medium mb-0 mr-3">Quantity: <%=rsBook.getString(8)%></p>
                    </div>
                    <div class="d-flex align-items-center mb-4 pt-2">
                        <div class="input-group quantity mr-3" style="width: 130px;">
                            <div class="input-group-btn">
                                <button class="btn btn-primary btn-minus" >
                                    <i class="fa fa-minus"></i>
                                </button>
                            </div>
                            <input type="text" class="form-control bg-secondary text-center" value="1">
                            <div class="input-group-btn">
                                <button class="btn btn-primary btn-plus">
                                    <i class="fa fa-plus"></i>
                                </button>
                            </div>
                        </div>
                        <a href="CartController?go=add2Cart&bookid=<%=rsBook.getString(1)%>"
                           class="btn btn-primary px-3"><i class="fa fa-shopping-cart mr-1"></i>Add To Cart</a>
                    </div>
                </div>
            </div>
            <%}%>

        </div>
        <!-- Shop Detail End -->


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
