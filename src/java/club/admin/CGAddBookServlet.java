/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package club.admin;

import club.business.Book;
import club.data.BookIO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author chira
 */
public class CGAddBookServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
//    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        response.setContentType("text/html;charset=UTF-8");
//        try (PrintWriter out = response.getWriter()) {
//            /* TODO output your page here. You may use following sample code. */
//            out.println("<!DOCTYPE html>");
//            out.println("<html>");
//            out.println("<head>");
//            out.println("<title>Servlet CGAddBookServlet</title>");            
//            out.println("</head>");
//            out.println("<body>");
//            out.println("<h1>Servlet CGAddBookServlet at " + request.getContextPath() + "</h1>");
//            out.println("</body>");
//            out.println("</html>");
//        }
//    }

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
        doPost(request, response);
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
        
        String url="/CGIndex.jsp";
        // get current action
        String action = request.getParameter("action");
        if (action == null) {
            action = "CGAddBook";  // default action
        }
        if (action.equals("CGAddBook")){
        //get input parameters 
        String code=request.getParameter("code");
        String  description=request.getParameter("description");
        String quantityString=request.getParameter("quantity");
        
        int quantity;
        
        //if the quantity is blank, default to 0
        if (quantityString == null || quantityString.trim().isEmpty()) {
            quantity = 0;
        } 
        else {
              quantity = Integer.parseInt(quantityString);
        }
         
        Book book = new Book(code,description,quantity); //book object
        
        //server-side input validation
        List<String> errors = new ArrayList<String>(); //list to store error messages
        if(code == null || code.trim().isBlank() || code.trim().isEmpty()){
            errors.add("Book code is required.");
        }
        if(description == null || description.trim().length() < 3){
            errors.add("Description must have at least 3 characters.");
        }
        if(quantity <=0){
            errors.add("Quantity must be a positive number.");
        }
        //If there are errors, use the request implicit object to store the Book object and the error messages
        if(!errors.isEmpty()){
            request.setAttribute("book",book);
            request.setAttribute("errors",errors);
            //then forward to CGAddBook.jsp page
            request.getRequestDispatcher("CGAddBook.jsp").forward(request, response);
            
        }else{
            // If input fields are valid, add the book to the text file
            String filePath = getServletContext().getRealPath("/WEB-INF/books.txt");
            BookIO.insert(book, filePath);
            //forward to CGDisplayBooks to display newly added book list
            request.getRequestDispatcher("CGDisplayBooks").forward(request,response);
        }

        }
        
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
