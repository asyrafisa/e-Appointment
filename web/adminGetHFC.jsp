<%-- 
    Document   : adminGetHFC
    Created on : Aug 5, 2016, 9:21:30 AM
    Author     : user
--%>

<%@page import="dBConn.Conn"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    
    <select class="form-control" id="test_drop" name="test_drop" required>
        <option></option>
        <% 
      
        String stateCode=request.getParameter("state");
        
        String hfcCode = " SELECT * FROM lookup_detail "
                + "WHERE Master_Ref_code = '0081' AND Detail_Ref_code like '"+stateCode+"%'";
        ArrayList<ArrayList<String>> dataHFC = Conn.getData(hfcCode);  
       
        out.print(hfcCode);
        
        if(dataHFC.size() > 0)
        {
            for(int i = 0; i < dataHFC.size(); i++)
            {%>
                <option><%=dataHFC.get(i).get(2)%></option> <%
            }
        } 
        else 
        {%>
            <option>No HFC can be select</option>
        <%}

     
        %>
    </select>
</html>
