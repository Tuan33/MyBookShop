/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.BookDAO;
import entity.Book;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.ResultSet;
import java.util.Vector;

/**
 *
 * @author tranh
 */
public class CartController extends HttpServlet {

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
            String service = request.getParameter("go");
            HttpSession session = request.getSession();
            BookDAO daoBook = new BookDAO();
            if (service == null) {
                service = "showcart";
            }
            if (service.equals("showcart")) {
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
                RequestDispatcher disp
                        = request.getRequestDispatcher("cart.jsp");
                disp.forward(request, response);
            }
            if (service.equals("add2Cart")) {
                String id = request.getParameter("bookid");
                Book book = (Book) session.getAttribute(id);
//                Book book = (Book) session.getAttribute(id);
                if (book == null) {
                    book = daoBook.findByID(Integer.parseInt(id));
                    book.setQuantityInStock(1);
                    session.setAttribute(id, book);
                } else {
                    book.setQuantityInStock(book.getQuantityInStock() + 1);
                    session.setAttribute(id, book);
                }
                response.sendRedirect("HomeController");
            }

            if (service.equals("remove")) {
                String id = request.getParameter("bookid");
                session.removeAttribute(id);
                response.sendRedirect("CartController");
            }

            if (service.equals("update")) {
                String[] quantity = request.getParameterValues("quantity");//get nhie'u
                String[] updateid = request.getParameterValues("updateid");
                for (int i = 0; i < updateid.length; i++) {
                    Book book = (Book) session.getAttribute(updateid[i]);
                    book.setQuantityInStock(Integer.parseInt(quantity[i]));
                    session.setAttribute(updateid[i], book);
                }
                response.sendRedirect("CartController");
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

//if (service.equals("removeAll")) {
//                java.util.Enumeration em = session.getAttributeNames();
//                while (em.hasMoreElements()) {
//                    String id = em.nextElement().toString();
//                    if (!id.equals("username") && !id.equals("permission")
//                            && !id.equals("name") && !id.equals("cusid") && !id.equals("empid")) {
//                        session.removeAttribute(id);
//                    }
//                }
//                response.sendRedirect("CartController");
//            }
