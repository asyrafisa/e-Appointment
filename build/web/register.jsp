<%-- 
    Document   : register
    Created on : Mar 28, 2016, 8:56:09 PM
    Author     : user
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>

<!DOCTYPE html>
<html>
    <title>Register Form</title>
    <%@include file="header.jsp"%>
    <body class="bodyAuthenticate">
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-4 col-md-offset-4 col-sm-12  col-xs-12 register_header">
                   <h3 style="color: white"><i>Welcome To Join Our Member!</i></h4>
                   <!--<h3 style="color: white"><b>Register Form</b></h3>-->
                </div>
            </div>
        <div class="row">
        <div class="col-md-4 col-md-offset-4 col-sm-12  col-xs-12 register_area">
            <img src="image/oldutemlogo.png" class="img-responsive center-block" alt="Responsive image" ><hr><hr>
            <h3>Register Form</h3>
            <hr>
            <form role="form" method="post" action="register_process.jsp">
                <div class="form-group">
                    <label for="ic_no">IC No / Passport No</label>
                    <input type="text" class="form-control"  name="ic_no" placeholder="Identity No" required>
                </div>
                <div class="form-group">
                    <label for="username">Username</label> 
                    <input type="text" class="form-control" name="username" placeholder="Username" required>
                </div>
                <div class="form-group">
                    <label for="password">Password</label>
                    <input type="password" class="form-control" name="password" placeholder="Password" required>
                </div>
                 <div class="form-group">
                    <label for="submit">Mobile No</label>
                    <input type="number" class="form-control" name="mobile_no" placeholder="Mobile No" required>
                </div>
                <div class="form-group">
                    <label for="email">Email</label>
                    <input type="email" class="form-control" name="email" placeholder="Email" required>
                </div>
                <button type="submit" class="btn btn-success">Submit</button>
                <button type="reset" class="btn btn-success" onclick="window.location.href='index.jsp'">Back</button>
            </form>
        </div>
        </div>
        </div>
    </body>
</html>
