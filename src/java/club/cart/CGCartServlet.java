/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package club.cart;

import club.business.Book;
import club.business.ECart;
import club.business.ELoan;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author chira
 */
public class CGCartServlet extends HttpServlet {

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
        //access the loanitems object stored in the servlet context
        ServletContext sc = getServletContext();
        ArrayList<Book> loanitems = (ArrayList<Book>) sc.getAttribute("loanitems");
        
        //create/save loan cart object in the session
        HttpSession session = request.getSession();
        ECart eCart = (ECart) session.getAttribute("eCart");
        if (eCart == null){
            eCart = new ECart();
            session.setAttribute("eCart", eCart);
            
        }
        //check for the action parameters
        String action = request.getParameter("action");
        if(action!=null && action.equals("reserve")){
            String code = request.getParameter("code");
            if(code!=null){
                 // Get details of the loan item (i.e., Book object)
                Book book = ELoan.findItem(loanitems, code);
                // Add the item to the cart
                eCart.addItem(book);
                
                // Reduce the loan item's QOH by 1
                ELoan.subtractFromQOH(loanitems, code, 1);
            }
        }
        //forward the request to CGECart.jsp
        //request.getRequestDispatcher("/CGECart.jsp").forward(request, response);
        response.sendRedirect("CGECart.jsp");
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
