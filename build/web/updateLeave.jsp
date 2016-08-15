<%-- 
    Document   : updateLeave
    Created on : May 6, 2016, 4:21:22 AM
    Author     : asyraf
--%>

<%@page import="java.text.DateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.*"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>

<%
        String staffID = request.getParameter("staffID");
        String startLeave= request.getParameter("start_leave");
        String endLeave = request.getParameter("end_leave"); 
        String leaveReason = request.getParameter("leave_reason");
        String hfc = (String)session.getAttribute("HEALTH_FACILITY_CODE");
        String startLeaveBefore = request.getParameter("startLeaveBefore");
//        out.print(state_code);
//        out.print(holiday_date);
        
        String sqlGetHFCCode = "SELECT Detail_Ref_code from lookup_detail WHERE Master_Ref_code = '0081' AND Description = '"+hfc+"'";
        ArrayList<ArrayList<String>> dataGetHFCCode = Conn.getData(sqlGetHFCCode);
        String dataHFCCode = dataGetHFCCode.get(0).get(0);

        String sqlgetHoliday2 = "SELECT day_cd, discipline_cd, subdiscipline_cd, hfc_cd FROM pms_clinic_day WHERE hfc_cd = '"+dataHFCCode+"'";
        ArrayList<ArrayList<String>> dataGetStates = Conn.getData(sqlgetHoliday2);
        String dataDiscipline = dataGetStates.get(0).get(1);
        String dataSubdiscipline = dataGetStates.get(0).get(2);
        
        String sqlStaffID = "SELECT USER_ID FROM adm_user WHERE USER_NAME = '"+staffID+"'";
        ArrayList<ArrayList<String>> dataGetStaffID = Conn.getData(sqlStaffID);
        String dataStaffID = dataGetStaffID.get(0).get(0);
        
        String sqlLatestPreviousEndDate = "SELECT user_id, start_leave_date, end_leave_date, status "
                + "FROM pms_staff_leave "
                + "WHERE user_id = '"+dataStaffID+"' AND status = 'approve'"
                + "ORDER BY end_leave_date DESC";
        ArrayList<ArrayList<String>> dataLatestPreviousEndDate  = Conn.getData(sqlLatestPreviousEndDate);
        String dataLatestEndDate = dataLatestPreviousEndDate.get(0).get(2);
        
//        RMIConnector rmic = new RMIConnector();
        String sqlCheckProcessStatus = "SELECT user_id, start_leave_date, end_leave_date, status "
                + "FROM pms_staff_leave "
                + "WHERE user_id = '"+dataStaffID+"' AND status = 'process'";
        ArrayList<ArrayList<String>> dataProcessStatus  = Conn.getData(sqlCheckProcessStatus);
        
//        boolean isSelect = rmic.setQuerySQL(Conn.HOST, Conn.PORT, sqlCheckProcessStatus);
        String dataProcessEndDate = dataProcessStatus.get(0).get(2);
        
//        out.print(sqlCheckProcessStatus);
//        out.print(isSelect);

        String sql2 = "SELECT user_id, status FROM pms_staff_leave WHERE user_id = '"+dataStaffID+"'  AND '"+startLeave+"' <= '"+dataProcessEndDate+"'";
        ArrayList<ArrayList<String>> dataGetStatus = Conn.getData(sql2);


        if(dataGetStatus.size()> 0)
        {
            RMIConnector rmic = new RMIConnector();
            String sqlUpdate = "UPDATE pms_staff_leave "
                    + "SET start_leave_date='" + startLeave + "',end_leave_date='" + endLeave + "',leave_reason='" + leaveReason + "' "
                    + "WHERE hfc_cd='" + dataHFCCode + "' AND user_id='" + dataStaffID + "' AND start_leave_date='" + startLeaveBefore + "'";

            boolean isUpdate = rmic.setQuerySQL(Conn.HOST, Conn.PORT, sqlUpdate);

            if (isUpdate) 
            {
                response.sendRedirect("medicalStaff.jsp");
            }   
        }
        else
        {%>
            <script language='javascript'>
                alert('The start date you edited is exceed your end leave date. Please choose the date before it'); 
                window.location= 'medicalStaff.jsp?e24=<%=startLeave%>&e25=<%=endLeave%>&e26=<%=leaveReason%>';
            </script>
      <% // //}   
%>
