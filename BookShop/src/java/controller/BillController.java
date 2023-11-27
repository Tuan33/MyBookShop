/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.OrderDAO;
import dao.OrderDetailDAO;
import entity.Order;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.ResultSet;

/**
 *
 * @author tranh
 */
public class BillController extends HttpServlet {

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
            OrderDAO daoOr = new OrderDAO();
            OrderDetailDAO daoOrD = new OrderDetailDAO();
            String service = request.getParameter("go");
            if (service == null) {
                service = "show";
            }
            if (service.equals("show")) {
                ResultSet rs = daoOr.getAllOrder();
                request.setAttribute("rsOrder", rs);
                request.getRequestDispatcher("billmanager.jsp").forward(request, response);
            }
            if (service.equals("showOrderDetail")) {
                String status = request.getParameter("statusD");
                if (status.equals("done")) {
                    String oid = request.getParameter("oid");
                    ResultSet rs = daoOrD.getAllOrderDetailByOid(oid);
                    request.setAttribute("statusD", status);
                    request.setAttribute("rsOrderDetail", rs);
                    request.getRequestDispatcher("showDetail.jsp").forward(request, response);
                } else {
                    String oid = request.getParameter("oid");
                    ResultSet rs = daoOrD.getAllOrderDetailByOid(oid);
                    request.setAttribute("statusD", status);
                    request.setAttribute("rsOrderDetail", rs);
                    request.getRequestDispatcher("showDetail.jsp").forward(request, response);
                }
            }
            if (service.equals("updateOrderDetail")) {
                int oid = Integer.parseInt(request.getParameter("oid"));
                String[] bid = request.getParameterValues("bid");
                String[] quantity = request.getParameterValues("quantity");
                String[] price = request.getParameterValues("price");

                for (int i = 0; i < bid.length; i++) {
                    daoOrD.updateOrderDetail(
                            Integer.parseInt(quantity[i]),
                            Double.parseDouble(price[i]),
                            oid,
                            Integer.parseInt(bid[i]));
                }
                response.sendRedirect("BillController?go=showOrderDetail&oid=" + oid);
            }
            if (service.equals("removeOrderDetail")) {
                int oid = Integer.parseInt(request.getParameter("oid"));
                int bid = Integer.parseInt(request.getParameter("bid"));
                daoOrD.removeOrderDetail(oid, bid);
                response.sendRedirect("BillController?go=showOrderDetail&oid=" + oid);
            }
            if (service.equals("updateOrder")) {
                String submit = request.getParameter("submit");
                if (submit == null) {
                    int id = Integer.parseInt(request.getParameter("oid"));
                    Order ord = daoOr.findByOID(id);

                    request.setAttribute("ord", ord);
                    request.getRequestDispatcher("showOrder.jsp").forward(request, response);
                } else {
                    HttpSession session = request.getSession();
                    int oid = Integer.parseInt(request.getParameter("OrderID"));
                    int eid = (Integer) session.getAttribute("empid");
                    String status = request.getParameter("status");
                    String OrderDate = request.getParameter("OrderDate");
                    String ShippedDate = request.getParameter("ShippedDate");
                    String ShipName = request.getParameter("ShipName");
                    String ShipAddress = request.getParameter("ShipAddress");
                    String ShipCity = request.getParameter("ShipCity");
                    int n = daoOr.updateOrder(oid, eid, status, OrderDate,
                            ShippedDate, ShipName, ShipAddress, ShipCity);
                    System.out.println(n);
                    response.sendRedirect("BillController");
                }
            }

            if (service.equals("statusFilter")) {
                String status = request.getParameter("statusf");
                ResultSet rs = daoOr.findByStatus(status);
                request.setAttribute("rsOrder", rs);
                request.getRequestDispatcher("billmanager.jsp").forward(request, response);
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

//String message = "Error while insert your order detail";
//String redirectURL = "show-cart";
//String script = "<script>alert('" + message + "');window.location.href='" + redirectURL + "';</script>";
//response.getWriter().println(script);
