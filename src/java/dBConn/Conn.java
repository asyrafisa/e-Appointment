/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dBConn;

import Config.Config;
import java.util.ArrayList;
import main.RMIConnector;

/**
 *
 * @author user
 */
public class Conn 
{
    public final static String HOST = "10.73.32.200";
    public final static int PORT = 1099;
    
    public static ArrayList<ArrayList<String>> getData(String query) 
    {
        RMIConnector rmic = new RMIConnector();

//        String host_db = Config.url_server;
        String host_db = Conn.HOST;
        
        ArrayList<ArrayList<String>> data = rmic.getQuerySQL(host_db, Conn.PORT, query);
        
        return data;
    }
}
