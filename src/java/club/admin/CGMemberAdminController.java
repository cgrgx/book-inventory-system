/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package club.admin;

import club.business.Member;
import club.data.MemberDB;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author chira
 */
public class CGMemberAdminController extends HttpServlet {

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
//            out.println("<title>Servlet CGMemberAdminController</title>");            
//            out.println("</head>");
//            out.println("<body>");
//            out.println("<h1>Servlet CGMemberAdminController at " + request.getContextPath() + "</h1>");
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
        HttpSession session = request.getSession();
        String url = "/CGDisplayMembers.jsp";
        //if action is not defined, set default to display members
        String action = request.getParameter("action");
        if(action==null){
            action = "displayMembers";
        }
        //display members
        if(action.equals("displayMembers")){
            //get list of members
            ArrayList<Member> members = MemberDB.selectMembers();
            //set as a request attribute
            request.setAttribute("members", members);
        
        }
        //perform CRUD actions to members administration
        if(action.equals("addMember")){

            //forwards to add member page
            url="/CGAddMember.jsp";
            
        } else if(action.equals("editMember")){
            //handle updateMember action
            String emailAddress = request.getParameter("email");
            Member member = MemberDB.selectMember(emailAddress);
            request.setAttribute("member", member);
            session.setAttribute("member", member);
            System.out.println("email: " + emailAddress);
            url="/CGEditMember.jsp";
        }
        else if(action.equals("removeMember")){
            //find the existing record
            String emailAddress = request.getParameter("email");
            Member member = MemberDB.selectMember(emailAddress);
            session.setAttribute("member", member);
            url = "/CGRemoveMember.jsp";
        }
        getServletContext()
                .getRequestDispatcher(url)
                .forward(request, response);
        
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

        String url = "/CGDisplayMembers.jsp";
        //if action is not defined, set default to display members
        String action = request.getParameter("action");
        String dbOperation = request.getParameter("db_operation");
        HttpSession session = request.getSession();
        if(action==null){
            action = "displayMembers";
        }
        
        //perform CRUD actions to members administration


       
        if(action.equals("saveMember")){
            
            url = saveMember(request,response);

        }
        else if(action.equals("updateMember")&& dbOperation.equals("update")){
            String fullName = request.getParameter("fullName");
            String programName = request.getParameter("programName");
            String phoneNumber = request.getParameter("phoneNumber");
            String yearLevel =request.getParameter("yearLevel");
            // Perform server-side validation
            ArrayList<String> errorMessage = new ArrayList<>();
            if(fullName == null || fullName.trim().isEmpty()){
                errorMessage.add("Please provide full name.");
            }
            else if(fullName.length() < 3){
                errorMessage.add("Cannot update record. Please provide a valid name (at least 3 char long).");
            }
            if(!errorMessage.isEmpty()){
                request.setAttribute("errorMessage",errorMessage);
                url = "/CGEditMember.jsp"; 
            }else{

                Member member = (Member) session.getAttribute("member");
                
                member.setFullName(fullName);
                member.setPhoneNumber(phoneNumber);
                member.setProgramName(programName);
                member.setYearLevel(Integer.parseInt(yearLevel));

                MemberDB.update(member);

                ArrayList<Member> members = MemberDB.selectMembers();
                request.setAttribute("members", members);
                url = "/CGDisplayMembers.jsp";
                
            }
        }
        else if(action.equals("deleteMember")){
            Member member = (Member) session.getAttribute("member");
            //delete memeber
            MemberDB.delete(member);
            //updated lists of members
            ArrayList<Member> members = MemberDB.selectMembers();
            request.setAttribute("members", members);
            url = "/CGDisplayMembers.jsp";
        }
        getServletContext()
                .getRequestDispatcher(url)
                .forward(request, response);       
        
    }
// 
private String saveMember(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    String url = "/CGDisplayMembers.jsp";

        //get member data from request parameters
       String emailAddress = request.getParameter("emailAddress");
       String fullName = request.getParameter("fullName");
       String programName = request.getParameter("programName");
       String phoneNumber = request.getParameter("phoneNumber");
       String yearLevel =request.getParameter("yearLevel");


           //store full name and emailaddress with constructor
           Member member = new Member(fullName,emailAddress);
           member.setPhoneNumber(phoneNumber);
           member.setProgramName(programName);
           member.setYearLevel(Integer.parseInt(yearLevel));
           if (!member.isValid()) {
               //error message in add member page
               request.setAttribute("errorMessage", "Cannot insert a new record. Please provide a valida name and/or email. ");
               url = "/CGAddMember.jsp";
               return url;
           }else{
               // Check if email already exists in database
               boolean exists = MemberDB.emailExists(emailAddress);
               if (exists) {
               MemberDB.update(member);      
               } else {
               // Insert new member record
               MemberDB.insert(member);
               }
        }
    
    // Redirect to displayMembers action to show updated member list
    ArrayList<Member> members = MemberDB.selectMembers();
    request.setAttribute("members", members);
    return url;
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
