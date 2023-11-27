<%-- 
    Document   : login
    Created on : Jul 8, 2023, 10:51:15 PM
    Author     : tranh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!-- Coding By CodingNepal - codingnepalweb.com -->
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>Login & Registration Form</title>
        <!---Custom CSS File--->
        <!--<link rel="stylesheet" href="style.css">-->
        <style>
            /* Import Google font - Poppins */
            @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@200;300;400;500;600;700&display=swap');
            *{
                margin: 0;
                padding: 0;
                box-sizing: border-box;
                font-family: 'Poppins', sans-serif;
            }
            body{
                min-height: 100vh;
                width: 100%;
                background: #D19C97;
            }
            .container{
                position: absolute;
                top: 50%;
                left: 50%;
                transform: translate(-50%,-50%);
                max-width: 430px;
                width: 100%;
                background: #fff;
                border-radius: 7px;
                box-shadow: 0 5px 10px rgba(0,0,0,0.3);
            }
            .container .registration{
                display: none;
            }
            #check:checked ~ .registration{
                display: block;
            }
            #check:checked ~ .login{
                display: none;
            }
            #check{
                display: none;
            }
            .container .form{
                padding: 2rem;
            }
            .form header{
                font-size: 2rem;
                font-weight: 500;
                text-align: center;
                margin-bottom: 1.5rem;
            }
            .form input{
                height: 60px;
                width: 100%;
                padding: 0 15px;
                font-size: 17px;
                margin-bottom: 1.3rem;
                border: 1px solid #ddd;
                border-radius: 6px;
                outline: none;
            }
            .form input:focus{
                box-shadow: 0 1px 0 rgba(0,0,0,0.2);
            }
            .form a{
                font-size: 16px;
                color: #D19C97;
                text-decoration: none;
            }
            .form a:hover{
                text-decoration: underline;
            }
            .form input.button{
                color: #fff;
                background: #D19C97;
                font-size: 1.2rem;
                font-weight: 500;
                letter-spacing: 1px;
                margin-top: 1.7rem;
                cursor: pointer;
                transition: 0.4s;
            }
            .form input.button:hover{
                background: #b26d67;
            }
            .signup{
                font-size: 17px;
                text-align: center;
            }
            .signup label{
                color: #D19C97;
                cursor: pointer;
            }
            .signup label:hover{
                text-decoration: underline;
            }
            /* Custom select style */
            .form select {
                height: 60px;
                width: 100%;
                padding: 0 15px;
                font-size: 17px;
                margin-bottom: 1.3rem;
                border: 1px solid #ddd;
                border-radius: 6px;
                outline: none;
                background-position: right center;
                background-repeat: no-repeat;
                background-size: 20px;
                background-color: #fff; /* Set custom background color */
            }

            /* Style the dropdown arrow */
            .form select::-ms-expand {
                display: none; /* Remove IE default arrow */
            }

        </style>    
    </head>
    <body>
        <div class="container">
            <div class="login form">
                <header>Login</header>
                <form action="LoginController" method="post">

                    <select name="permission" id="" >
                        <option value="Employee">Employee</option>
                        <option value="Customer">Customer</option>
                    </select>
                    <%if(request.getAttribute("loginFail") != null){%>
                    <p style="color: red">Wrong username or password</p>
                    <%}%>

                    <input type="text" name="username" placeholder="Username">

                    <input type="password" name="password" placeholder="Password">

                    <input type="submit" class="button" value="Login" name="submit">                 
                </form>
                <div class="signup">
                    <span class="signup">Don't have an account?
                        <a href="SignupController"> Sign Up </a>
                    </span>
                </div>
            </div>
        </div>
    </body>
</html>