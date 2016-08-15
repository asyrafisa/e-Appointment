<%-- 
    Document   : updateClinicDay
    Created on : Apr 6, 2016, 11:00:26 PM
    Author     : asyraf
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.*"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>

<%   
        String state_code = request.getParameter("state_code");
        String hfc_code = request.getParameter("hfc_code");
        String discipline = request.getParameter("discipline");
        String subdiscipline = request.getParameter("subdiscipline");
        String day = request.getParameter("day");
        String starttime = request.getParameter("starttime");
        String endtime = request.getParameter("endtime");
        String status = request.getParameter("status");
        String hfcBefore = request.getParameter("hfcBefore");
        String disciplineBefore = request.getParameter("disciplineBefore"); 
        String subdisciplineBefore = request.getParameter("subdisciplineBefore"); 
        String dayBefore = request.getParameter("dayBefore");
        String username = (String)session.getAttribute("username");
                
        RMIConnector rmic = new RMIConnector();
        String sqlInsert = "UPDATE pms_clinic_day "
                + "SET state_code='" + state_code + "',hfc_cd='" + hfc_code + "',discipline_cd='" + discipline + "',subdiscipline_cd='" + subdiscipline + "',day_cd='" + day + "' ,start_time='" + starttime + "',end_time='" + endtime + "',status='" + status + "', created_by='" + username + "', created_date= now() "
                + "WHERE hfc_cd='" + hfcBefore + "' AND discipline_cd='" + disciplineBefore + "' AND subdiscipline_cd='" + subdisciplineBefore + "' AND day_cd='" + dayBefore + "'";

        boolean isInsert = rmic.setQuerySQL(Conn.HOST, Conn.PORT, sqlInsert);
        
//      out.print(sqlInsert);
//      out.print("|"+isInsert+"|");

        if (isInsert) 
        {
             response.sendRedirect("adminAppointment.jsp");
        } else 
        {
            response.sendRedirect("data x update");
        }
       
%>
