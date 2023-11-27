<%-- 
    Document   : Header
    Created on : Jul 8, 2023, 9:15:10 PM
    Author     : tranh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!-- Topbar Start -->
<div class="container-fluid ">
    <div class="row bg-secondary py-2 px-xl-5">
        <div class="col-lg-4 d-none d-lg-block">
            <div class="d-inline-flex align-items-center">
                <a class="text-dark" href="">FAQs</a>
                <span class="text-muted px-2">|</span>
                <a class="text-dark" href="">Help</a>
                <span class="text-muted px-2">|</span>
                <a class="text-dark" href="">Support</a>
            </div>
        </div>
        <div class="col-lg-4 d-none d-lg-block">
            <div class="d-inline-flex align-items-center">
                <a class="text-dark" href="">HE172693</a>
                <span class="text-muted px-2">|</span>
                <a class="text-dark" href="">Tran Huy Tuan</a>
            </div>
        </div>
        <div class="col-lg-4 text-center text-lg-right">
            <div class="d-inline-flex align-items-center">
                <a class="text-dark px-2" href="">
                    <i class="fab fa-facebook-f"></i>
                </a>
                <a class="text-dark px-2" href="">
                    <i class="fab fa-twitter"></i>
                </a>
                <a class="text-dark px-2" href="">
                    <i class="fab fa-linkedin-in"></i>
                </a>
                <a class="text-dark px-2" href="">
                    <i class="fab fa-instagram"></i>
                </a>
                <a class="text-dark pl-2" href="">
                    <i class="fab fa-youtube"></i>
                </a>
            </div>
        </div>
    </div>
    <div class="row align-items-center py-3 px-xl-5">
        <div class="col-lg-3 d-none d-lg-block">    
            <a href="HomeController" class="text-decoration-none">
                <h1 class="m-0 display-5 font-weight-semi-bold"><span class="text-primary font-weight-bold border px-3 mr-1">E</span>Shopper</h1>
            </a>
        </div>
        <div class="col-lg-6 col-6 text-left">
            <form action="SearchController" method="post">
                <div class="input-group">
                    <input name="searchBook" type="text" class="form-control" placeholder="Search for products">
                    <div class="input-group-append">
                        <button type="submit" class="btn btn-primary input-group-text bg-transparent text-primary">
                            <i class="fa fa-search"></i>
                        </button>
                    </div>
                </div>
            </form>

        </div>

        <div class="col-lg-3 col-6 text-right">
            <a href="" class="btn border">
                <i class="fas fa-heart text-primary"></i>
                <span class="badge">0</span>
            </a>
            <a href="" class="btn border">
                <i class="fas fa-shopping-cart text-primary"></i>
                <span class="badge">0</span>
            </a>
        </div>
        <!--navbar start-->
        <div class="container-fluid px-0">
            <nav class="navbar navbar-expand-lg bg-light navbar-light py-3 py-lg-0 px-0">
                <a href="" class="text-decoration-none d-block d-lg-none">
                    <h1 class="m-0 display-5 font-weight-semi-bold"><span class="text-primary font-weight-bold border px-3 mr-1">Reader</span>Shop</h1>
                </a>
                <div class="collapse navbar-collapse justify-content-between" id="navbarCollapse">
                    <div class="navbar-nav mr-auto py-0">
                        <a href="HomeController" class="nav-item nav-link active">Home</a>
                        <%if(session.getAttribute("permission")!=null){%>
                        <%if(!session.getAttribute("permission").toString().equals("Admin")){%>
                        <a href="CartController" class="nav-item nav-link">Shopping Cart</a>
                        <a href="CheckoutController" class="nav-item nav-link">Checkout</a>
                        <%}%>
                        <%}else{%>
                        <a href="CartController" class="nav-item nav-link">Shopping Cart</a>
                        <a href="CheckoutController" class="nav-item nav-link">Checkout</a>
                        <%}%>
                        <%if(session.getAttribute("permission")!=null){%>
                        <%if(session.getAttribute("permission").toString().equals("Admin")){%>
                        <a href="" class="nav-item nav-link">Customer Manager</a>
                        <a href="" class="nav-item nav-link">Product manager</a>
                        <a href="BillController" class="nav-item nav-link">Bill Manager</a>
                        <%}%>
                        <%}%>
                    </div>
                    <div class="navbar-nav ml-auto py-0">
                        <%if(session.getAttribute("username") == null){%>
                        <a href="LoginController" class="nav-item nav-link">Login</a>
                        <a href="SignupController" class="nav-item nav-link">Signup</a>
                        <%} else {%>
                        <a class="nav-item nav-link" style="pointer-events: none;">
                            Welcome <%=session.getAttribute("name")%>
                        </a>
                        <a href="LogoutController" class="nav-item nav-link">Logout</a>
                        <%}%>
                    </div>
                </div>
            </nav>
        </div>
        <!--navbar end-->
    </div>
</div>
<!-- Topbar End -->


