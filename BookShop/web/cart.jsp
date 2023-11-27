<%-- 
    Document   : cart
    Created on : Jul 5, 2023, 6:53:21 PM
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
            <!-- Cart Start -->
            <div class="container-fluid pt-5">
                <div class="row px-xl-5">
                    <div class="col-lg-8 table-responsive mb-5">
                        <form action="CartController">
                            <table class="table table-bordered text-center mb-0">
                                <thead class="bg-secondary text-dark">
                                    <tr>
                                        <th>Book</th>
                                        <th>Price</th>
                                        <th>Quantity</th>
                                        <th>Total</th>
                                        <th>Remove</th>
                                    </tr>
                                </thead>
                                <tbody class="align-middle">
                                <%
                                    double total = 0;
                                    DecimalFormat decimalFormat = new DecimalFormat("#.00");
                                    Vector<Book> listBook = (Vector<Book>) request.getAttribute("listBook");
                                    if(listBook!=null){
                                    for (Book book : listBook) {
                                %>
                                <tr>
                                    <td class="align-middle"><img src="" alt="" style="width: 50px;"><%=book.getTitle()%></td>
                                    <td class="align-middle">$<%=book.getPrice()%></td>
                                    <td class="align-middle">
                                        <div class="input-group quantity mx-auto" style="width: 100px;">
                                            <!--                                        <div class="input-group-btn">
                                                                                        <button class="btn btn-sm btn-primary btn-minus" >
                                                                                            <i class="fa fa-minus"></i>
                                                                                        </button>
                                                                                    </div>-->
                                            <input type="hidden" value="<%=book.getBookID()%>" name="updateid">
                                            <input type="text" min="1" name="quantity" class="form-control form-control-sm bg-secondary text-center" value="<%=book.getQuantityInStock()%>">
                                            <!--                                    <div class="input-group-btn">
                                                                                        <button href="" class="btn btn-sm btn-primary btn-plus">
                                                                                            <i class="fa fa-plus"></i>
                                                                                        </button>
                                                                                    </div>-->
                                        </div>
                                    </td>
                                    <td class="align-middle">$<%=book.getPrice()*book.getQuantityInStock()%></td>
                                    <td class="align-middle">
                                        <a class="btn btn-sm btn-primary" href="CartController?go=remove&bookid=<%=book.getBookID()%>">
                                            <i class="fa fa-times"></i>
                                        </a>
                                    </td>
                                </tr>
                                <%total+=book.getPrice()*book.getQuantityInStock();%>
                                <%}%>
                                <%}%>
                            </tbody>
                            <tr style="border: none">
                                <td><input type="submit" value="update">
                                    <input type="hidden" name="go" value="update"></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td>
                                    <!--<a href="CartController?go=removeAll">Remove All</a>-->
                                </td>
                            </tr>
                        </table>
                    </form>
                </div>
                <div class="col-lg-4">
                    <div class="card border-secondary mb-5">
                        <div class="card-header bg-secondary border-0">
                            <h4 class="font-weight-semi-bold m-0">Cart Summary</h4>
                        </div>
                        <div class="card-body">
                            <div class="d-flex justify-content-between mb-3 pt-1">
                                <h6 class="font-weight-medium">Subtotal</h6>
                                <h6 class="font-weight-medium"><%=decimalFormat.format(total)%></h6>
                            </div>
                            <div class="d-flex justify-content-between">
                                <h6 class="font-weight-medium">Shipping</h6>
                                <h6 class="font-weight-medium"><%=decimalFormat.format(total*5/100) %></h6>
                            </div>
                        </div>
                        <div class="card-footer border-secondary bg-transparent">
                            <div class="d-flex justify-content-between mt-2">
                                <h5 class="font-weight-bold">Total</h5>
                                <h5 class="font-weight-bold">$<%=decimalFormat.format(total+total*5/100)%></h5>
                            </div>
                            <%if(total != 0){%>
                            <%if(session.getAttribute("permission") == null){%>
                            <a href="LoginController" class="btn btn-block btn-primary my-3 py-3">Proceed To Checkout</a>
                            <%}else{%> 
                            <a href="CheckoutController" class="btn btn-block btn-primary my-3 py-3">Proceed To Checkout</a>
                            <%}%>
                            <%}%>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Cart End -->



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
