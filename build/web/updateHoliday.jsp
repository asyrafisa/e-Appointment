<%-- 
    Document   : updateHoliday
    Created on : Apr 6, 2016, 11:00:26 PM
    Author     : user
--%>

<%@page import="java.util.ArrayList"%>;
<%@page import="java.sql.*"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>

<%
        String state_code = request.getParameter("state_code");
        String holiday_date = request.getParameter("holiday_date");
        String holiday_desc = request.getParameter("holiday_desc");
        String holiday_type = request.getParameter("holiday_type");
        String status = request.getParameter("status");
        String stateBefore = request.getParameter("stateBefore");
        String dateBefore = request.getParameter("dateBefore");
        String username = (String)session.getAttribute("username");
        
//        out.print(state_code);
//        out.print("******");
//        out.print(holiday_date);
//        out.print("******");
//        out.print(stateBefore);
//        out.print("******");
//        out.print(dateBefore);
        
        RMIConnector rmic = new RMIConnector();
        String sqlInsert = "UPDATE pms_holiday "
                + "SET state_code='" + state_code + "',holiday_date='" + holiday_date + "',holiday_desc='" + holiday_desc + "',holiday_type='" + holiday_type + "',status='" + status + "', created_by='" + username + "', created_date= now() "
                + "WHERE state_code='" + stateBefore + "' AND holiday_date='" + dateBefore + "';";

        boolean isInsert = rmic.setQuerySQL(Conn.HOST, Conn.PORT, sqlInsert);

        
//                 out.print(sqlInsert);
//                  out.print("|"+isInsert+"|");
//                  if (true) { return; }
        if (isInsert) 
        {
//             response.sendRedirect("adminAppointment.jsp");
            %>
                <script language='javascript'>
                window.location= 'adminAppointment.jsp?error=Update holiday succesful';
                </script> 
            <%
        } else 
        {
            response.sendRedirect("data not update");
        }

        
%>
