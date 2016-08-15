<%-- 
    Document   : login_process
    Created on : Mar 28, 2016, 10:46:43 PM
    Author     : user
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.*"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>

<%
    String username = request.getParameter("username");
    String password = request.getParameter("password");
//    String icno = request.getParameter("icno");
//    String icno = request.getParameter("ic_no");
        
    String sql1 ="SELECT st.* "
            + "FROM signup_tbl st "
            + "WHERE st.username = '"+username+"' "
            + "AND st.password = '"+password+"' ";
    ArrayList<ArrayList<String>> dataPatient = Conn.getData(sql1);
    
    
    String sql2 = "SELECT adUser.* "
            + "FROM adm_user adUser "                                              
            + "WHERE adUser.USER_ID= '" + username + "' "
            + "AND adUser.PASSWORD = '" + password + "'";

    ArrayList<ArrayList<String>> dataStaff = Conn.getData(sql2);
 

    if(dataPatient.size() > 0)                                                      //login patient
    { 

        session.setAttribute("username", username);
        String ic = dataPatient.get(0).get(0) ;
        session.setAttribute("ic", ic);
        response.sendRedirect("patientSelectHFC.jsp");
        
    }
    else if(dataStaff.size() > 0)                                                   // login Staff (admin, nurse, doctor)
    {
        for(int i=0; i<dataStaff.size(); i++)
        {          
            if(dataStaff.get(i).get(4).equals("DOCTOR"))                            //doctor
            {   
                session.setAttribute("username", username);
                String hfc = dataStaff.get(0).get(1) ;
                session.setAttribute("HEALTH_FACILITY_CODE", hfc);
                String name = dataStaff.get(0).get(3) ;
                session.setAttribute("USER_NAME", name);
                String title = dataStaff.get(0).get(4) ;
                session.setAttribute("OCCUPATION_CODE", title);                  
                response.sendRedirect("medicalStaffDoctor.jsp");
            }
            else if(dataStaff.get(i).get(4).equals("SYSTEM ADMINISTRATOR"))         //admin
            {
                session.setAttribute("username", username);
                String hfc = dataStaff.get(0).get(1) ;
                session.setAttribute("HEALTH_FACILITY_CODE", hfc);
                response.sendRedirect("adminAppointment.jsp");
            }
            else                                                                    //nurse
            {
                session.setAttribute("username", username);
                String name = dataStaff.get(0).get(3) ;
                session.setAttribute("USER_NAME", name);
                String hfc = dataStaff.get(0).get(1) ;
                session.setAttribute("HEALTH_FACILITY_CODE", hfc);
                String title = dataStaff.get(0).get(4) ;
                session.setAttribute("OCCUPATION_CODE", title);
                response.sendRedirect("medicalStaffNurse.jsp");
            }
        }
    }
    else
    {
         response.sendRedirect("loginFail.jsp");
    }
%>
