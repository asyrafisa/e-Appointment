<%-- 
    Document   : insert_register
    Created on : Mar 21, 2016, 9:36:49 PM
    Author     : asyraf
--%>

<%@page import="java.util.ArrayList"%>;
<%@page import="java.sql.*"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>

<%
    
            //Check The Existance of Data in DB.
            //out.print(data.size()); 
            //if (true) { return; }

        String ic_no = request.getParameter("ic_no");
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String email = request.getParameter("email");
        String mobile_no = request.getParameter("mobile_no");
//        String name = request.getParameter("name");
//        String birth_date = request.getParameter("birth_date");
//        String idtype = request.getParameter("idtype");
//        String idno = request.getParameter("idno");
//        String sex_code = request.getParameter("sex_code");
//        String mobile_no = request.getParameter("mobile_no");

        
        String sql = "SELECT biodata.PATIENT_NAME "
                + "FROM pms_patient_biodata biodata "
                + "WHERE biodata.NEW_IC_NO = '" + ic_no + "'";
        ArrayList<ArrayList<String>> data = Conn.getData(sql);
        
//        out.print("|"+sql+"|");
//        if (true) { return; }
            
        if (data.size() > 0) 
        { 
            String sql1 = "SELECT st.ic_no "
                    + "FROM signup_tbl st "
                    + "WHERE st.ic_no = '" + ic_no + "'";
            ArrayList<ArrayList<String>> data1 = Conn.getData(sql1);
            
            //already registered
            if (data1.size() > 0) 
            {
                //out.print(data); 
                response.sendRedirect("registered_user.jsp");
            } 
            else 
            {
                String sql2 = "SELECT st.ic_no "
                         + "FROM signup_tbl st "
                         + "WHERE st.username = '" + username + "'";
                ArrayList<ArrayList<String>> data2 = Conn.getData(sql2);

                //username exist
                if (data2.size() > 0) 
                {
                    //out.print(data); 
                    response.sendRedirect("usernameExist.jsp");
                }
                else
                {
                    RMIConnector rmic = new RMIConnector();
                    String sqlInsertSgt = "INSERT INTO signup_tbl (ic_no, username,password, email, mobile_no) "
                            + "VALUES ('" + ic_no + "' , '" + username + "','" + password + "','" + email + "','"+mobile_no+"')";

                    boolean isInsertSgt = rmic.setQuerySQL(Conn.HOST, Conn.PORT, sqlInsertSgt);
                    
                    String sqlInsertPb = "UPDATE pms_patient_biodata "
                            + "SET MOBILE_PHONE = '"+mobile_no+"', EMAIL_ADDRESS = '"+email+"' "
                            + "WHERE NEW_IC_NO = '"+ic_no+"'";

                    boolean isInsertPb = rmic.setQuerySQL(Conn.HOST, Conn.PORT, sqlInsertPb);
                   
                    if(isInsertSgt) 
                    {
                        response.sendRedirect("registerSuccess.jsp");
                    } 
                    else 
                    {
                        response.sendRedirect("registerFail.jsp");
                    }
                }
            }
        } 
        else   
        {
            response.sendRedirect("no_registration.jsp");
        }
%>   


