/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.CustomerDAO;
import dao.EmployeeDAO;
import entity.Customer;
import entity.Employee;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 *
 * @author tranh
 */
@WebServlet(name = "LoginController", urlPatterns = {"/LoginController"})
public class LoginController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            dao.CustomerDAO daoCus = new CustomerDAO();
            dao.EmployeeDAO daoEmp = new EmployeeDAO();
            String submit = request.getParameter("submit");
            if (submit == null) {
                RequestDispatcher disp
                        = request.getRequestDispatcher("login.jsp");
                disp.forward(request, response);
            } else {
                String permission = request.getParameter("permission");
                String username = request.getParameter("username");
                String password = request.getParameter("password");
                HttpSession session = request.getSession();
                session.setAttribute("username", username);
                session.setAttribute("permission", permission);
                if (permission.equals("Customer")) {
                    if (daoCus.checkLogin(username, password)) {
                        Customer cus = daoCus.findByUserName(username);
                        session.setAttribute("cusid", cus.getCustomerID());
                        session.setAttribute("name", cus.getName());
                        response.sendRedirect("HomeController");
                    } else {
                        String loginFail = "Username or password is wrong";
                        request.setAttribute("loginFail", loginFail);
                        request.getRequestDispatcher("login.jsp").forward(request, response);
                    }
                }
                if (permission.equals("Employee")) {
                    if (daoEmp.checkLogin(username, password)) {
                        Employee emp = daoEmp.findByUserName(username);
                        if(emp.getRole().equals("Admin")){
                            session.setAttribute("permission", "Admin");
                        }
                        session.setAttribute("empid", emp.getEmployeeID());
                        session.setAttribute("name", emp.getName());
                        response.sendRedirect("HomeController");
                    } else {
                        String loginFail = "Username or password is wrong";
                        request.setAttribute("loginFail", loginFail);
                        request.getRequestDispatcher("login.jsp").forward(request, response);
                    }
                }
            }

//        Customer cus = daoCus.login(user, pass);
//        if (cus == null) {
//            request.getRequestDispatcher("login.jsp").forward(request, response);
//        } else {
////            request.getRequestDispatcher("HomeController")
////                    .forward(request, response);//chuyen trang can du lieu      
//            response.sendRedirect("HomeController");// chi can chuyen trang ko can du lieu
//        }
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
