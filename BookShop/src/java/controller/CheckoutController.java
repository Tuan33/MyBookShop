/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.BookDAO;
import dao.CustomerDAO;
import dao.EmployeeDAO;
import dao.OrderDAO;
import dao.OrderDetailDAO;
import entity.Book;
import entity.Order;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.Vector;

/**
 *
 * @author tranh
 */
public class CheckoutController extends HttpServlet {

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
            /* TODO output your page here. You may use following sample code. */
            HttpSession session = request.getSession();
            BookDAO daoBook = new BookDAO();
            EmployeeDAO daoEmp = new EmployeeDAO();
            OrderDAO daoOrd = new OrderDAO();
            OrderDetailDAO daoOrdDe = new OrderDetailDAO();
            CustomerDAO daoCus = new CustomerDAO();
            String service = request.getParameter("go");
            if (service == null) {
                service = "checkout";
            }
            if (service.equals("checkout")) {
                double total = 0;
                java.util.Enumeration em = session.getAttributeNames();
                Vector<Book> vector = new Vector<>();
                while (em.hasMoreElements()) {
                    String id = em.nextElement().toString();
                    if (!id.equals("username") && !id.equals("permission")
                            && !id.equals("name") && !id.equals("cusid") && !id.equals("empid")) {
                        Book book = (Book) session.getAttribute(id);
                        vector.add(book);
                    }
                }
                request.setAttribute("listBook", vector);
                request.getRequestDispatcher("checkout.jsp").forward(request, response);
            }
            if (service.equals("order")) {
                String shipName = request.getParameter("shipname");
                String shipAddress = request.getParameter("shipaddress");
                String shipCity = request.getParameter("shipcity");
                int cusid = (Integer) session.getAttribute("cusid");
                int orderId = daoOrd.addOrders(cusid, "wait", shipName, shipAddress, shipCity);
                if (orderId != 0) {
                    java.util.Enumeration em = session.getAttributeNames();
                    while (em.hasMoreElements()) {
                        String id = em.nextElement().toString();
                        if (!id.equals("username") && !id.equals("permission")
                                && !id.equals("name") && !id.equals("cusid") && !id.equals("empid")) {
                            Book book = (Book) session.getAttribute(id);
                            int nod = daoOrdDe.addOrderDetail(
                                    orderId,
                                    book.getBookID(),
                                    book.getQuantityInStock(),
                                    book.getPrice());
                            if (nod == 0) {
                                String message = "Error order detail";
                                String redirectURL = "show-cart";
                                String script = "<script>alert('" + message + "');window.location.href='" + redirectURL + "';</script>";
                                response.getWriter().println(script);
                            } else {
                                session.removeAttribute(id);
                            }
                        }
                    }
                } else {
                    String message = "Error order";
                    String redirectURL = "show-cart";
                    String script = "<script>alert('" + message + "');window.location.href='" + redirectURL + "';</script>";
                    response.getWriter().println(script);
                }
                response.sendRedirect("HomeController");
            }
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
