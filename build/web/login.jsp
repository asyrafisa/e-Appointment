<%-- 
    Document   : login
    Created on : Mar 28, 2016, 8:05:22 PM
    Author     : user
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>

<!DOCTYPE html>
<html>
    <title>Login page</title>
    <%@include file="header.jsp"%>
    <body class="bodyAuthenticate">
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-4 col-md-offset-4 col-sm-12  col-xs-12 login_area"> 
                    <img src="image/oldutemlogo.png" class="img-responsive center-block" alt="Responsive image" ><hr><hr>
                    <h3>Login</h3>
                    <hr>
                    <form role="form" method="post" action="login_process.jsp">
                        <div class="form-group">
                            <label for="ic_no">Login Id</label>
                            <input type="text" class="form-control"  name="username" placeholder="Username" required>
                        </div>
                        <div class="form-group">
                            <label for="username">Password</label> 
                            <input type="password" class="form-control" name="password" placeholder="Password" required>
                        </div>
                        <p style="padding-bottom: 2%"><a href="register.jsp">You have no account?</a></p>
                        <button type="submit" class="btn btn-success">Login</button>
                        <button type="reset" class="btn btn-success ">Reset</button>
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>
