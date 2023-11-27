/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.BookDAO;
import dao.CategoryDAO;
import entity.Book;
import entity.Category;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.ResultSet;
import java.util.Vector;

/**
 *
 * @author tranh
 */
@WebServlet(name = "HomeController", urlPatterns = {"/HomeController"})
public class HomeController extends HttpServlet {

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

        //set data from dao
//        BookDAO dao = new BookDAO();
//        ResultSet listB = dao.getAllBook();
//        //set data to jsp
//        request.setAttribute("listBook", listB);
////        request.getRequestDispatcher("/index.jsp").forward(request, response);
//        //set data from dao
//        CategoryDAO daoC = new CategoryDAO();
//        Vector<Category> listC = daoC.getAllCategory();
//        //set data to jsp
//        request.setAttribute("listCategory", listC);
//        request.getRequestDispatcher("/index.jsp").forward(request, response);
        try ( PrintWriter out = response.getWriter()) {
            BookDAO daoBook = new BookDAO();
            CategoryDAO daoCate = new CategoryDAO();
            String service = request.getParameter("go");
            if (service == null) {
                service = "displayAll";
            }

            if (service.equals("displayAll")) {
                ResultSet listBook = daoBook.getAllBook();
                ResultSet listCate = daoCate.getAllCategory();

                request.setAttribute("listBook", listBook);
                request.setAttribute("listCate", listCate);
                request.getRequestDispatcher("index.jsp").forward(request, response);
            }
            
            if (service.equals("displayCate")){
                String cateID = request.getParameter("cateid");
                ResultSet listBook = daoBook.getBookByCID(Integer.parseInt(cateID));
                ResultSet listCate = daoCate.getAllCategory();
                
                request.setAttribute("listBook", listBook);
                request.setAttribute("listCate", listCate);
                request.setAttribute("tag", cateID);
                request.getRequestDispatcher("index.jsp").forward(request, response);
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
