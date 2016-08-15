<%-- 
    Document   : sendReminder
    Created on : May 30, 2016, 10:45:03 AM
    Author     : Asyraf
--%>

<%@page import="main.SMSService"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.*"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>

<%
    String hfc = (String)session.getAttribute("HEALTH_FACILITY_CODE");
    
    String hfcCode = "SELECT Detail_Ref_code "
            + "FROM lookup_detail "
            + "WHERE Master_Ref_code = '0081' AND Description = '"+hfc+"'";
    ArrayList<ArrayList<String>> dataHFC = Conn.getData(hfcCode);  

    String hfcCD;
    if(dataHFC.size() > 0)
    {
        hfcCD = dataHFC.get(0).get(0);
    }
    else
    {
        hfcCD = null;
    }
    
    String pmi_no = null;
    String hfc_cd = null;
    String patientName = null;
    String phone_no = null;
    String message = null;
    String appDate = null;
    String startTime = null;
    
    String sql = "SELECT w.*,ld.Description AS state_name "
            + "FROM lookup_detail ld,"
            + "(SELECT t.*"
            + "FROM "
            + "(SELECT pa.pmi_no, pa.hfc_cd, DATE(pa.appointment_date) AS appDate, TIME(pa.start_time) AS start_time, "
            + "pb.MOBILE_PHONE, DATEDIFF(pa.appointment_date, NOW()) as DiffDate, pb.PATIENT_NAME "
            + "FROM pms_appointment pa, pms_patient_biodata pb "
            + "WHERE pa.pmi_no = pb.PMI_NO AND pa.status = 'active' AND (DATEDIFF(pa.appointment_date, NOW())>1 ))t "
            + "WHERE t.DiffDate<3)w "
            + "WHERE w.hfc_cd = ld.Detail_Ref_code AND ld.Master_Ref_code = '0081'  AND w.hfc_cd= '"+hfcCD+"'";
    ArrayList<ArrayList<String>> data = Conn.getData(sql); 

//    out.print(data);
    
    if(data.size() > 0)
    {
        for(int i = 0; i < data.size(); i++)
        {
            pmi_no = data.get(i).get(0);
            hfc_cd = data.get(i).get(7);
            patientName = data.get(i).get(6);
            appDate = data.get(i).get(2);
            startTime = data.get(i).get(3);
            phone_no = data.get(i).get(4);
            String phone = "+6" + phone_no;
            
            Date today = new Date();
            String expectedPattern = "yyyy-MM-dd";
            SimpleDateFormat formatter = new SimpleDateFormat(expectedPattern);
            String appDateFromDB = data.get(i).get(2);
            Date dateFromDB = formatter.parse(appDateFromDB);
                                    
            SimpleDateFormat DATE_FORMAT = new SimpleDateFormat("dd/MM/yyyy");
            String appointmentDate = DATE_FORMAT.format(dateFromDB);
            

            
            message = "Hello "+patientName+"\nThis is MOH customer service. \nYou will have an appointment on below details : \nYour Clinic/Hospital : "+ hfc_cd +" "
                    + "\nYour Appointment Date : "+ appointmentDate +" \nYour Appointment Time : "+ startTime;
            
            SMSService smss = new SMSService(phone, message, Conn.HOST);
            
            %><script language='javascript'>
                alert('Reminder has been sent'); 
                window.location= 'adminAppointment.jsp';
            </script> <%
        }
    }
    else
    {
        %><script language='javascript'>
            alert('There is no reminder to be delivered'); 
             window.location= 'adminAppointment.jsp';
        </script> <%
    }
%>
