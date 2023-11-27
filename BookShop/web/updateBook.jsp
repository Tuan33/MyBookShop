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
            Book book = (Book) request.getAttribute("bookdetail");
    %> 

    <body>
        <jsp:include page="pannel.jsp"></jsp:include>
            <!-- Shop Detail Start -->
            <form action="BookController" method="POST">
                <div class="container-fluid py-5">
                    <div class="row px-xl-5">
                        <div class="col-lg-5 pb-5">
                            <div class="card-header product-img position-relative overflow-hidden bg-transparent border p-0">
                                <!-- Book image -->
                                <img class="img-fluid w-100" style="height: 700px;" src="<%=book.getImage()%>" alt="">
                        </div>
                    </div>
                    <div class="col-lg-7 pb-5">
                        <!-- Book Title (Editable) -->
                        <div class="d-flex mb-4">
                            Image Path: <input type="text" name="image" value="<%=book.getImage()%>">
                        </div>
                        <div class="d-flex mb-4">
                            Id: <input type="text" name="bid" value="<%=book.getBookID()%>">
                        </div>
                        <div class="d-flex mb-4">
                            Title: <input type="text" name="title" value="<%=book.getTitle()%>">
                        </div>
                        <div class="d-flex mb-3"></div>

                        <!-- Book Price (Editable) -->
                        <div class="d-flex mb-4">
                            Price: <input type="text" name="price" value="<%=book.getPrice()%>">
                        </div>
                        <!-- Book Description (Editable) -->
                        <div class="d-flex mb-4">
                            Description: <textarea rows="4" name="description"><%=book.getDescription()%></textarea>
                        </div>
                        <!-- Other book information (Editable) -->
                        <div class="d-flex mb-3">
                            <p class="text-dark font-weight-medium mb-0 mr-3">
                                <!-- You can replace this with an input field if needed -->
                            </p>
                        </div>
                        <div class="d-flex mb-4">
                            <p class="text-dark font-weight-medium mb-0 mr-3">
                                AuthorID: <input type="text" name="author" value="<%=book.getAuthor()%>">
                            </p>
                        </div>
                        <div class="d-flex mb-4">
                            <p class="text-dark font-weight-medium mb-0 mr-3" style="margin-right: 4px !important">
                                Category: <input type="text" name="cate" value="<%=book.getCategoryID()%>">
                            </p>
                        </div>
                        <div class="d-flex mb-4">
                            <p class="text-dark font-weight-medium mb-0 mr-3">
                                Publication date: <input type="text" name="pubdate" value="<%=book.getPublicationDate()%>">
                            </p>
                        </div>
                        <div class="d-flex mb-4">
                            <p class="text-dark font-weight-medium mb-0 mr-3">
                                Publisher: <input type="text" name="pub" value="<%=book.getPublisher()%>">
                            </p>
                        </div>
                        <div class="d-flex mb-4">
                            <p class="text-dark font-weight-medium mb-0 mr-3">
                                Quantity: <input type="text" name="quantity" value="<%=book.getQuantityInStock()%>">
                            </p>
                        </div>
                        <input type="submit" name="submit" value="update">
                        <input type="hidden" name="go" value="update">
                    </div>
                </div>
            </div>
        </form>
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
