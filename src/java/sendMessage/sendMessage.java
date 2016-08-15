
package sendMessage;

import java.text.SimpleDateFormat;
import java.text.DateFormat;
import java.text.DecimalFormat;
import java.util.ArrayList;
import dBConn.Conn;
import main.RMIConnector;
import main.SMSService;

/**
 *
 * @author asyraf
 */
public class sendMessage 
{
    private RMIConnector rmic = new RMIConnector();
    
    public static void main(String[] args)
    {   
        String pmi_no = "";
        String hfc_cd = "";
        String phone_no = "";
        String message = "";
        String appDate = "";
        String startTime = "";

     
        try{
            //get appointment date from database
            String sql = "SELECT a.pmi_no, a.hfc_cd, DATE(a.appointment_date) AS appointment_date, TIME(a.start_time) AS start_time, pb.MOBILE_PHONE "
                    + "FROM pms_appointment a, pms_patient_biodata pb "
                    + "WHERE a.pmi_no = pb.PMI_NO AND a.pmi_no = '9304120450710' AND status = 'active'";
            ArrayList<ArrayList<String>> data = Conn.getData(sql);
            
        
            pmi_no = data.get(0).get(0);
            hfc_cd = data.get(0).get(1);
            appDate = data.get(0).get(2);
            startTime = data.get(0).get(3);
            phone_no = data.get(0).get(4);
            String phone = "+6" + phone_no;
            
            message = "Hello...this is MOH customer service. \nYou will have an appointment on below details : \nYour PMI Number is :"+pmi_no +"\nYour Clinic/Hospital : "+ hfc_cd +" "
                    + "\nYour Appointment Date : "+ appDate +" \nYour Start Time : "+ startTime;
            
            SMSService smss = new SMSService(phone, message, "10.73.32.250");
            
//            System.out.println(phone);
            
//            System.out.print(data);
            
            }catch(Exception e){
        
            }
    }
}
    

