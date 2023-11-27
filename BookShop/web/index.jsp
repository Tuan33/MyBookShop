<%-- 
    Document   : Home
    Created on : Jul 5, 2023, 5:45:21 PM
    Author     : tranh
--%>
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

            <!-- Content Start -->
            <div class="container-fluid mb-5">
                <div class="row border-top px-xl-5">
                    <!--menu-->
                <jsp:include page="menu.jsp"></jsp:include>
                    <!--menu-->
                    <div class="col-lg-9">
                        <div id="header-carousel" class="carousel slide" data-ride="carousel">
                            <!-- Products Start -->
                            <div class="container-fluid">
                                <div class="text-center mb-4">
                                    <h2 class="section-title px-5"><span class="px-2">Trandy Products</span></h2>
                                </div>
                            <jsp:include page="content.jsp"></jsp:include>    
                        </div>                    
                        <!-- Products End -->
                    </div>
                </div>
            </div>
        </div>
        <!-- Content End -->



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