<%-- 
    Document   : register
    Created on : Mar 18, 2016, 2:46:31 PM
    Author     : asyraf
--%>

<%@page import="java.util.Date"%>
<%@page import="java.util.*"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>
<%

    String username = (String)session.getAttribute("username");
    String hfc = (String)session.getAttribute("HEALTH_FACILITY_CODE");
    String name = (String)session.getAttribute("USER_NAME");
    String title = (String)session.getAttribute("OCCUPATION_CODE");
    
    
//    String dateAppointmentBefore= request.getParameter("dateAppointmentBefore");

        
//    out.print(hfc);
      
    String sqlUsername = "SELECT ic_no "
            + "FROM signup_tbl "
            + "WHERE username = '"+username+"'";
    ArrayList<ArrayList<String>> dataICNO = Conn.getData(sqlUsername);
    
    String dataIC;
        
    if(dataICNO.size() > 0)
    {
        dataIC = dataICNO.get(0).get(0);
    }
    else
    {
        dataIC = null;
    }

    String sqlIC =  "SELECT PMI_NO, PATIENT_NAME "
            + "FROM pms_patient_biodata "
            + "WHERE NEW_IC_NO = '"+dataIC+"'";                               
    ArrayList<ArrayList<String>> dataPMINo = Conn.getData(sqlIC);
    
    String dataPMI;
        
    if(dataPMINo.size() > 0)
    {
        dataPMI = dataPMINo.get(0).get(0);
    }
    else
    {
        dataPMI = null;
    }
    
    String sqlDisSub =  "SELECT * FROM pms_duty_roster "
            + "WHERE user_id = '01221'";                               
    ArrayList<ArrayList<String>> dataDisSub = Conn.getData(sqlDisSub);
    
    String sqlAppointment = "SELECT lookSub.appointment_date, lookSub.start_time, lookSub.pmi_no, lookSub.patient_name, "
            + "lookSub.staff_name ,lookSub.discipline_name, lds.Description AS subdipline_name, lookSub.appointment_type, lookSub.ID_NO, lookSub.status "
            + "FROM lookup_detail lds, "
            + "(SELECT lookDis.appointment_date, lookDis.start_time, lookDis.pmi_no, lookDis.PATIENT_NAME AS patient_name, "
            + "lookDis.USER_NAME AS staff_name ,ld.Description AS discipline_name, lookDis.subdiscipline, lookDis.appointment_type, lookDis.ID_NO, lookDis.status "
            + "FROM lookup_detail ld, "
            + "(SELECT DATE(pa.appointment_date) AS appointment_date, TIME(pa.start_time) AS start_time, pa.pmi_no, pb.PATIENT_NAME, au.USER_NAME, pa.discipline, pa.subdiscipline, pa.appointment_type, pb.ID_NO, pa.status "
            + "FROM pms_appointment pa, pms_patient_biodata pb, adm_user au "
            + "WHERE pa.pmi_no = pb.PMI_NO AND pa.userid = au.USER_ID AND pa.pmi_no = '"+dataPMI+"' "
            + "ORDER BY pa.appointment_date DESC) lookDis "
            + "WHERE lookDis.discipline=ld.Detail_Ref_code "
            + "AND ld.Master_Ref_code = '0072') lookSub "
            + "WHERE lds.Master_Ref_code = '0071' "
            + "AND lookSub.subdiscipline=lds.Detail_Ref_code";
    ArrayList<ArrayList<String>> dataAppointment = Conn.getData(sqlAppointment); 
    
//    out.print(dataAppointment);
    
   String pmi;
   String patientName;
   String idPatient;
        
    if(dataAppointment.size() > 0)
    {
        pmi = dataAppointment.get(0).get(2);
        patientName = dataAppointment.get(0).get(3);
        idPatient = dataAppointment.get(0).get(8);
    }
    else
    {
        pmi = null;
        patientName = null;
        idPatient = null;
    }
    
    String e27 = null;
    String e28 = null;
    String e29 = null;
    String e30 = null;
    String e31 = null;
    String e32 = null;
    String e33 = null;
    String e34 = null;
    String e35 = null;
    String disciplineCodeApp = null;
    String e36 = null;
    String subDisciplineCodeApp = null;
    String e37 = null;
    String e38 = null;
    String e39 = null;
    String e40 = null;
    String e41 = null;
    String e42 = null;
    String e43 = null;
    String e44 = null;
    String e45 = null;
    String e46 = null;
    String e47 = null;

    e27 = request.getParameter("e27");
    e30 = request.getParameter("e30");
    e31 = request.getParameter("e31");
    e32 = request.getParameter("e32");
    e33 = request.getParameter("e33");
    e34 = request.getParameter("e34");
    e35 = request.getParameter("e35");
    e36 = request.getParameter("e36");
    e37 = request.getParameter("e37");
    e38 = request.getParameter("e38");
    e39 = request.getParameter("e39");
    e40 = request.getParameter("e40");
    e41 = request.getParameter("e41");
    e42 = request.getParameter("e42");
    e43 = request.getParameter("e43");
    e44 = request.getParameter("e44");
    e45 = request.getParameter("e45");
    e46 = request.getParameter("e46");
    e47 = request.getParameter("e47");


%>
<!DOCTYPE html>
<html>
    <title>Patient Page</title>
    <%@include file="header.jsp"%>
<body>
<div class="container-fluid">
    <div class="row">
        <div class="col-md-12 col-sm-12 col-xs-12 col_image">
            <img src="image/oldutemlogo.png" class="img-responsive center-block" alt="Responsive image" id="UTeMImage">
        </div>
    </div> 
    <div class="row" id="rowSignInUp">
        <div class="col-md-5 col-md-offset-1 col-sm-6 col-xs-6" id="left_column">
            <h3><em>E-Health Appointment</em></h3>
        </div>
        <div class="col-md-2 col-md-offset-3 col-sm-6 col-xs-6" id="right_column_signinup">
            <ul id="menu">
                <li style="margin-right: 4%; color: white;">Hello <%=username%></li> 
            <!--<button class="btn btn-info buttonAuthenticate"> </button>-->
            <li><button class="btn btn-info buttonAuthenticate" onclick="window.location.href='index.jsp'">Log out</button></li>
            </ul>
        </div>
            <div class="col-md-3"></div>
    </div>  
    <div class="row">
        <div class="col-md-8 col-md-offset-1 col-sm-12 col-xs-12 bodyContent">
            <div class="tab-content">
            <div id="home" class="tab-pane active">
                <h3 class="headerTitle">Welcome to E-Health Appointment System</h3>
                <p style="text-align: justify"><strong>Web Bases Patient Appointment Management System  is used to manage patient record the appointment data patient,
                            doctor choose by  patient, appointment date, treatment package by using web based. Laptop and  mobile or any electronic system
                            that contain web-browser software also can open  the e-health of website, so that it is take convenience to user for book  appointment.
                            User can use internet by web browser go to the website for booking  appointment with sign in user first. User can choose the doctor
                            which user may  want to meet and the system will let user to choose the available booking time  and date. After the user has choose 
                            the time and date, the information of data  will record into database and it may wont lost. This system save a lot time of 
                            the appointment process and it is secure.
                </strong></p>
                <h3 class="headerTitle">Objective</h3>
                <p><strong>1)	To provide a fast, reliable and convenient way in keeping track of patients make appointments.</strong></p>
                <p><strong>2)	To reduce time-taken for staffs and dentists to check on their patients book appointments and treatments to perform on a particular patient. </strong></p>
                <p><strong>3)	To record of type of treatment that given to the patients all the appointments.</strong></p>
                <p><strong>4)	To provide the backup and recovery mechanism when the system is down on all database. By using this system, it allow user to make a copy of data. It can help user to protecting the files that make up on database from crash.</strong></p>
                <h3 class="headerTitle">Our Location</h3>

                <div class="google_map">
                <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d15946.294237778036!2d102.32034365!3d2.3109037500000005!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31d1
                        e46c6eaa869b%3A0xb8935957e3536888!2sUniversiti+Teknikal+Malaysia+Melaka!5e0!3m2!1sen!2s!4v1433745195746" width="700" height="450" frameborder="0"></iframe></div>
                View <a href="https://www.google.com/maps/place/Universiti+Teknikal+Malaysia+Melaka/@2.313859,102.3190038,17z/data=!3m1!4b1!4m2!3m1!1s0x31d1e46c6eaa869b:0xb8935957e3536888" class="large_map">Utem Clinic</a> in a larger map        
            </div>
            <div id="applyAppointment" class="tab-pane fade">
                <h3 class="headerTitle">Make Appointment</h3>
                <p><b>PMI No : </b><% out.print(pmi);%> </p>
                <p><b>ID No : </b><% out.print(idPatient); %></p>
                <p><b>Patient Name : </b><% out.print(patientName); %></p>
                <%
//                    String pmi= request.getParameter("dateAppointmentBefore");
                    session.setAttribute("pmiToBeUsed", pmi); 
                    session.setAttribute("idPatientToBeUsed", idPatient); 
                    session.setAttribute("patientNameToBeUsed", patientName); 
                %>
                    <form class="form-horizontal" role="form" method="post" action="updateAppointment.jsp">
                        <%    
                        
                            String sql = "SELECT * "
                                    + "FROM pms_patient_biodata "
                                    + "WHERE PMI_NO='"+e27+"' OR NEW_IC_NO = '"+e28+"' OR ID_TYPE = '"+e29+"' OR ID_NO = '"+e30+"'";
                            ArrayList<ArrayList<String>> dataPatient = Conn.getData(sql);
                            
                            String sqlPatientApp = "SELECT * "
                                    + "FROM pms_appointment";
                            ArrayList<ArrayList<String>> dataPatientApp = Conn.getData(sqlPatientApp);
                            
                        %>
                    <div class="row">
                    <div class="col-md-8 col-md-offset-2 col-sm-12 col-xs-12" style="background-color: #f2f2f2; padding-top: 2%; padding-bottom: 1%; margin-bottom: 1%">
                    <div class="form-group">
                        <label class="control-label col-sm-2" for="appDoc">*Doctor : </label>  
                        <div class="col-sm-10">   
                         <select class="form-control" id="doctorApp" name="appDoc" required>
                        <option></option>
                            <%  
                                String sqlDoc = "SELECT * "
                                        + "FROM adm_user "
                                        + "WHERE HEALTH_FACILITY_CODE = '"+hfc+"' AND OCCUPATION_CODE = 'DOCTOR'";
                                ArrayList<ArrayList<String>> dataDoctor = Conn.getData(sqlDoc);
                                
                                if(e34 == null)
                                {
                                    if (dataDoctor.size() > 0) 
                                    {
                                        for (int i = 0; i < dataDoctor.size(); i++) 
                                        {%>
                                                <option value="<%=dataDoctor.get(i).get(3)%>"><%=dataDoctor.get(i).get(3)%></option>
                                      <% }
                                    }
                                }
                                else
                                {
                                    for (int i = 0; i < dataDoctor.size(); i++) 
                                    {
                                        if(e34.equals(dataDoctor.get(i).get(3)))
                                        {%>
                                            <option value="<%= e34 %>" selected><%=dataDoctor.get(i).get(3)%></option>
                                        <%}
                                        else
                                        {%>
                                            <option value="<%= dataDoctor.get(i).get(3) %>"><%=dataDoctor.get(i).get(3)%></option> <%
                                        }
                                    }
                                       
                                }%>
                        </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-2" for="appDate">*Appointment Date : </label>  
                        <div class="col-sm-10">   
                            <%if(e32 == null)
                            {%>
                                <input  name="appDate" type="date" id="datepicker"  class="form-control" required>
                            <%}
                            else
                            {%>
                                <input name="appDate" value="<%= e32 %>" type="date" id="datepicker" class="form-control" required>
                            <%}%>
                        </div>
                    </div>
                    <script>
                            var today = new Date().toISOString().split('T')[0];
                            document.getElementsByName("appDate")[0].setAttribute('min', today);
                    </script>
                    <div class="form-group">
                        <label class="control-label col-sm-2" for="appTime">*Appointment Time : </label>  
                        <div class="col-sm-10">   
                        <select class="form-control" id="doctorApp" name="appTime" required>
                            <option></option>
                            <%if(e33 == null)
                            {%>
                                <option value="09:00:00"><%out.print("09:00:00");%></option>
                                <option value="09:15:00"><%out.print("09:15:00");%></option>
                                <option value="09:30:00"><%out.print("09:30:00");%></option>
                                <option value="09:45:00"><%out.print("09:45:00");%></option>
                                <option value="10:00:00"><%out.print("10:00:00");%></option>
                                <option value="10:15:00"><%out.print("10:15:00");%></option>
                                <option value="10:30:00"><%out.print("10:30:00");%></option>
                                <option value="10:35:00"><%out.print("10:35:00");%></option>
                                <option value="10:40:00"><%out.print("10:40:00");%></option>
                                <option value="10:45:00"><%out.print("10:45:00");%></option>
                                <option value="11:00:00"><%out.print("11:00:00");%></option>
                                <option value="11:15:00"><%out.print("11:15:00");%></option>
                                <option value="11:30:00"><%out.print("11:30:00");%></option>
                                <option value="11:45:00"><%out.print("11:45:00");%></option>
                                <option value="12:00:00"><%out.print("12:00:00");%></option>
                                <option value="12:15:00"><%out.print("12:15:00");%></option>
                                <option value="12:30:00"><%out.print("12:30:00");%></option>
                                <option value="12:45:00"><%out.print("12:45:00");%></option>
                                <option value="13:00:00"><%out.print("13:00:00");%></option>
                                <option value="13:15:00"><%out.print("13:15:00");%></option>
                                <option value="13:30:00"><%out.print("13:30:00");%></option>
                                <option value="13:45:00"><%out.print("13:45:00");%></option>
                                <option value="14:00:00"><%out.print("14:00:00");%></option>
                                <option value="14:15:00"><%out.print("14:15:00");%></option>
                                <option value="14:30:00"><%out.print("14:30:00");%></option>
                                <option value="14:45:00"><%out.print("14:45:00");%></option>
                                <option value="15:00:00"><%out.print("15:00:00");%></option>
                                <option value="15:15:00"><%out.print("15:15:00");%></option>
                                <option value="15:30:00"><%out.print("15:30:00");%></option>
                                <option value="15:45:00"><%out.print("15:45:00");%></option>
                                <option value="16:00:00"><%out.print("16:00:00");%></option>
                                <option value="16:15:00"><%out.print("16:15:00");%></option>
                                <option value="16:30:00"><%out.print("16:30:00");%></option>
                            <%}
                            else
                            {%>
                                <option value="<%= e33 %>"><%out.print("09:00:00");%></option>
                                <option value="<%= e33 %>"><%out.print("09:15:00");%></option>
                                <option value="<%= e33 %>"><%out.print("09:30:00");%></option>
                                <option value="<%= e33 %>"><%out.print("09:45:00");%></option>
                                <option value="<%= e33 %>"><%out.print("10:00:00");%></option>
                                <option value="<%= e33 %>"><%out.print("10:15:00");%></option>
                                <option value="<%= e33 %>"><%out.print("10:30:00");%></option>
                                <option value="<%= e33 %>"><%out.print("10:35:00");%></option>
                                <option value="<%= e33 %>"><%out.print("10:40:00");%></option>
                                <option value="<%= e33 %>"><%out.print("10:45:00");%></option>
                                <option value="<%= e33 %>"><%out.print("11:00:00");%></option>
                                <option value="<%= e33 %>"><%out.print("11:15:00");%></option>
                                <option value="<%= e33 %>"><%out.print("11:30:00");%></option>
                                <option value="<%= e33 %>"><%out.print("11:45:00");%></option>
                                <option value="<%= e33 %>"><%out.print("12:00:00");%></option>
                                <option value="<%= e33 %>"><%out.print("12:15:00");%></option>
                                <option value="<%= e33 %>"><%out.print("12:30:00");%></option>
                                <option value="<%= e33 %>"><%out.print("12:45:00");%></option>
                                <option value="<%= e33 %>"><%out.print("13:00:00");%></option>
                                <option value="<%= e33 %>"><%out.print("13:15:00");%></option>
                                <option value="<%= e33 %>"><%out.print("13:30:00");%></option>
                                <option value="<%= e33 %>"><%out.print("13:45:00");%></option>
                                <option value="<%= e33 %>"><%out.print("14:00:00");%></option>
                                <option value="<%= e33 %>"><%out.print("14:15:00");%></option>
                                <option value="<%= e33 %>"><%out.print("14:30:00");%></option>
                                <option value="<%= e33 %>"><%out.print("14:45:00");%></option>
                                <option value="<%= e33 %>"><%out.print("15:00:00");%></option>
                                <option value="<%= e33 %>"><%out.print("15:15:00");%></option>
                                <option value="<%= e33 %>"><%out.print("15:30:00");%></option>
                                <option value="<%= e33 %>"><%out.print("15:45:00");%></option>
                                <option value="<%= e33 %>"><%out.print("16:00:00");%></option>
                                <option value="<%= e33 %>"><%out.print("16:15:00");%></option>
                                <option value="<%= e33 %>"><%out.print("16:30:00");%></option>
                            <%} %>
                        </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-2" for="disApp">Discipline : </label>  
                        <div class="col-sm-10">  
                            <select class="form-control" id="disApp" name="disApp" required>
                           <option></option>
                            <%  String sqlDic = "SELECT Detail_Ref_code, Description FROM lookup_detail WHERE Master_Ref_code = '0072'";
                                ArrayList<ArrayList<String>> dataDicipApp = Conn.getData(sqlDic);

                                if (e35 == null) 
                                {
                                    if (dataDicipApp.size() > 0) 
                                    {
                                        for (int i = 0; i < dataDicipApp.size(); i++) 
                                        {%>
                                                <option value="<%=dataDicipApp.get(i).get(0)%>"><%=dataDicipApp.get(i).get(1)%></option>
                                      <% }
                                    }
                                } 
                                else 
                                {
                                    String sqlDisciplineCode = "SELECT Detail_Ref_code, Description FROM lookup_detail WHERE Master_Ref_code = '0072' AND  Detail_Ref_code ='"+e35+"'";
                                    ArrayList<ArrayList<String>> dataDisciplineCodeApp = Conn.getData(sqlDisciplineCode);  

                                    disciplineCodeApp = dataDisciplineCodeApp.get(0).get(0);
//                                  out.print(disciplineCodeApp);

                                    for (int i = 0; i < dataDicipApp.size(); i++) 
                                    {
                                        if (e35.equals(dataDicipApp.get(i).get(0))) 
                                        {%> 
                                            <option value="<%=disciplineCodeApp%>" selected><%=dataDicipApp.get(i).get(1)%></option>
                                      <% } 
                                        else 
                                        {%>
                                            <option value="<%=dataDicipApp.get(i).get(0)%>"><%=dataDicipApp.get(i).get(1)%></option>
                                      <% }
                                    }
                                }%>
                       </select>
                        </div>
                    </div>  
                    <div class="form-group">
                        <label class="control-label col-sm-2" for="subDisApp">Subdicipline : </label>  
                        
                        <div class="col-sm-10">   
                        <select class="form-control" id="subDisApp" name="subDisApp" required> 
                           <option></option>
                            <%  String sqlSubDic = "SELECT Detail_Ref_code, Description FROM lookup_detail WHERE Master_Ref_code = '0071'";
                                ArrayList<ArrayList<String>> dataSubDicipApp = Conn.getData(sqlSubDic);
                                if (e36 == null) 
                                {
                                    if (dataSubDicipApp.size() > 0) 
                                    {
                                        for (int i = 0; i < dataSubDicipApp.size(); i++) 
                                        {%>
                                                <option value="<%=dataSubDicipApp.get(i).get(0)%>"><%=dataSubDicipApp.get(i).get(1)%></option>
                                      <% }
                                    }
                                } 
                                else 
                                {
                                    String sqlSubDisciplineCodeApp = "SELECT Detail_Ref_code, Description FROM lookup_detail WHERE Master_Ref_code = '0071' AND  Detail_Ref_code ='"+e36+"'";
                                    ArrayList<ArrayList<String>> dataSubDisciplineCodeApp = Conn.getData(sqlSubDisciplineCodeApp);  

                                    subDisciplineCodeApp = dataSubDisciplineCodeApp.get(0).get(0);

                                    for (int i = 0; i < dataSubDicipApp.size(); i++) 
                                    {
                                        if (subDisciplineCodeApp.equals(dataSubDicipApp.get(i).get(0))) 
                                        {%> 
                                            <option value="<%=subDisciplineCodeApp%>" selected><%=dataSubDicipApp.get(i).get(1)%></option>
                                      <% } 
                                        else 
                                        {%>
                                            <option value="<%=dataSubDicipApp.get(i).get(0)%>"><%=dataSubDicipApp.get(i).get(1)%></option>
                                      <%}
                                    }
                                }%>
                        </select>
                        </div>
                    </div>
                    </div>
                    </div>
                    <div class="row">
                    <div class="col-md-8 col-md-offset-2 col-sm-12 col-xs-12">
                        <button onclick="alertbox()" class="btn btn-xs btn-success" type="button" style="margin-bottom: 6%">Save</button>
                        <button class="btn btn-xs btn-success" type="reset" value="Reset" style="margin-bottom: 6%">Reset</button>
                        <button class="btn btn-xs btn-success" type="submit" formaction="patientCheckAppointment.jsp" value="Check" style="margin-bottom: 6%">Check</button>
                    </div>
                    </div>
                    </form>
            
            </div>
            <script>
                    function alertbox()
                    {
                        alert("You have to fill up all the information and click on Check button to check the availability of appointment date, time and doctor");
                    }
            </script>
            <div id="viewAppointment" class="tab-pane fade">
                <h3 class="headerTitle">View Appointment</h3>
                <p><b>PMI No : </b><% out.print(pmi);%> </p>
                <p><b>ID No : </b><% out.print(idPatient); %></p>
                <p><b>Patient Name : </b><% out.print(patientName); %></p>
                <div class="table-responsive">
                <table class="table table-bordered table-hover">
                    <thead>
                        
                        <tr> 
                            <th><center>No</center></th>
                            <th><center>Appointment Date</center></th>
                            <th><center>Appointment Time </center></th>
                            <th><center>Doctor Name</center></th>
                            <th><center>Discipline</center></th>
                            <th><center>Subdicipline</center></th>
                            <th><center>Appointment Type</center></th>
                            <th><center>Status</center></th>
                            <th><center>Action</center></th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            if (dataAppointment.size() > 0) 
                            {
                                for (int i = 0; i < dataAppointment.size(); i++) 
                                {
                                    Date today = new Date();
                                    String expectedPattern = "yyyy-MM-dd";
                                    SimpleDateFormat formatter = new SimpleDateFormat(expectedPattern);
                                    String appDateFromDB = dataAppointment.get(i).get(0);
                                    Date covertedAppDate = formatter.parse(appDateFromDB);
//                                    String endLeaveDateFromDB = dataAppointment.get(i).get(1);
//                                    Date endLeaveDate = formatter.parse(endLeaveDateFromDB);
                                    
                                    SimpleDateFormat DATE_FORMAT = new SimpleDateFormat("dd/MM/yyyy");
                                    String appointmentDate = DATE_FORMAT.format(covertedAppDate);
                                    %>
                                    <tr>
                                        <td><center>
                                            <%
                                                out.print(i+1);
                                            %>
                                        </center></td>
                                        <td><center><%=appointmentDate%></center></td>
                                        <td><center><%=dataAppointment.get(i).get(1)%></center></td>
                                        <td><center><%=dataAppointment.get(i).get(4)%></center></td>
                                        <td><center><%=dataAppointment.get(i).get(5)%></center></td>
                                        <td><center><%=dataAppointment.get(i).get(6)%></center></td>
                                        <td><center><%=dataAppointment.get(i).get(7)%></center></td>
                                        <td><center><%=dataAppointment.get(i).get(9)%></center></td>
                                        <td>
                                            <center>
                                                <button class="btn btn-xs btn-primary" onClick="location.href=''">Cancel</button>
                                            </center>
                                        </td>
                                    </tr>
                                <%
                                }
                            }%>
                    </tbody>
                </table>
                </div>
            </div>
            <div id="about" class="tab-pane fade">
                    <h3 class="headerTitle">About Us</h3>
            </div>
            <div id="contact" class="tab-pane fade">
                    <h3 class="headerTitle">Contact Us</h3>
            </div>
            <div id="location" class="tab-pane fade">
                    <h3 class="headerTitle">Our Location</h3>
            </div>
            </div>
        </div>
        <div class="col-md-2 col-sm-12 col-xs-12 bodyContent">
            <script>
                $(function() { 
                  $('a[data-toggle="tab"]').on('shown.bs.tab', function () {
                    //save the latest tab; use cookies if you like 'em better:
                    localStorage.setItem('lastTab', $(this).attr('href'));
                   });
                  //go to the latest tab, if it exists:
                  var lastTab = localStorage.getItem('lastTab');
                  if (lastTab) {
                     $('a[href=' + lastTab + ']').tab('show');
                  }
                  else
                  {
                    // Set the first tab if cookie do not exist
                    $('a[data-toggle="tab"]:first').tab('show');
                  }
                });
            </script>
            <script>
                function login()
                {
                    alert("You need to Sign In first , Press OK and Sign In..");
                }
            </script>
            <h3 class="headerTitle">Categories</h3>
            <!--<ul class="headerUL">-->
                
            <ul class="nav navbar-brand"  style="margin-bottom: 110%;" >
                    <li id="tab" class="active"><a data-toggle="tab" class="editTab" href="#home">Home</a></li>
                    <li id="tab"><a data-toggle="tab" class="editTab" href="#applyAppointment">Make Appointment</a></li>
                    <li id="tab"><a data-toggle="tab" class="editTab" href="#viewAppointment">View Appointment</a></li>
<!--                    <li id="tab"><a data-toggle="tab" class="editTab" href="#roster">View Roster</a></li>
                    <li id="tab"><a data-toggle="tab" class="editTab" href="#leave">Apply Leave</a></li>  
                    <li id="tab"><a data-toggle="tab" class="editTab" href="#appointment">Maintain Appointment</a></li> -->
                    <li id="tab"><a data-toggle="tab" class="editTab" href="#about">About Us</a></li>
                    <li id="tab"><a data-toggle="tab" class="editTab" href="#contact">Contact Us</a></li>
                    <li id="tab"><a data-toggle="tab" class="editTab" href="#location">Our Location</a></li>
           </ul> 
        </div>
   </div>
<div class="row">
    <div class="col-md-12 col-sm-12 col-xs-12 footer " >
            Copyright &copy; 2016 FTMK
    </div>
</div>
</div>
</body>
</html>
