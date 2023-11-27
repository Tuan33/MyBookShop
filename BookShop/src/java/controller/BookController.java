/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.BookDAO;
import dao.CategoryDAO;
import entity.Book;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.ResultSet;
import java.util.Vector;

/**
 *
 * @author tranh
 */
public class BookController extends HttpServlet {

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
//        //set data from dao
//        BookDAO dao = new BookDAO();
//        Vector<Book> list = dao.getAllBook();
//        //set data to jsp
//        request.setAttribute("listBook", list);
//        request.getRequestDispatcher("/index.jsp").forward(request, response);
        try ( PrintWriter out = response.getWriter()) {
            BookDAO dao = new BookDAO();
            CategoryDAO daoCate = new CategoryDAO();
            String service = request.getParameter("go");
            if (service == null) {
                service = "displayAll";
            }
//            if (service.equals("displayAll")) {
//                //get data from dao
//                ResultSet rs = dao.getAllBook();
//                //select view: jsp
//                RequestDispatcher disp = request.getRequestDispatcher("/index.jsp");
//                //set data to jsp
//                request.setAttribute("listBook", rs);
//                //run, call view
//                disp.for"ward(request, response);
//            }
            if (service.equals("update")) {
                String submit = request.getParameter("submit");
                if (submit == null) {
                    String id = request.getParameter("bookid");
                    Book book = dao.findByID(Integer.parseInt(id));
                    request.setAttribute("bookdetail", book);
                    request.getRequestDispatcher("updateBook.jsp").forward(request, response);
                } else {
                    int bid = Integer.parseInt(request.getParameter("bid"));
                    String title = request.getParameter("title");
                    double price = Double.parseDouble(request.getParameter("price"));
                    String descrip = request.getParameter("description");
                    int author = Integer.parseInt(request.getParameter("author"));
                    int cateid = Integer.parseInt(request.getParameter("cate"));
                    String pubdate = request.getParameter("pubdate");
                    String pub = request.getParameter("pub");
                    int quantity = Integer.parseInt(request.getParameter("quantity"));
                    String image = request.getParameter("image");
                    dao.updateBook(bid, title, author, descrip, price, pubdate, pub, quantity, cateid, image);
                    response.sendRedirect("HomeController");
                }
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
