package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.util.ArrayList;
import dBConn.Conn;
import main.RMIConnector;
import Config.Config;

public final class index_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.ArrayList<String>(2);
    _jspx_dependants.add("/header.jsp");
    _jspx_dependants.add("/clock.jsp");
  }

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <title>Main Page</title>\n");
      out.write("    ");
      out.write("\n");
      out.write("<head>\n");
      out.write("        <title>E-Health Appointment</title>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\n");
      out.write("        <link rel=\"stylesheet\" href=\"");
      out.print(Config.getBase_url(request) );
      out.write("bootstrap-3.3.6-dist/css/bootstrap.min.css\" />\n");
      out.write("        <script src=\"");
      out.print(Config.getBase_url(request) );
      out.write("bootstrap-3.3.6-dist/js/jquery.min.js\"></script>\n");
      out.write("        <script src=\"");
      out.print(Config.getBase_url(request) );
      out.write("bootstrap-3.3.6-dist/js/bootstrap.min.js\"></script>\n");
      out.write("        <link href=\"");
      out.print(Config.getBase_url(request) );
      out.write("default.css\" rel=\"stylesheet\" type=\"text/css\" />\n");
      out.write("        <link href=\"");
      out.print(Config.getBase_url(request) );
      out.write("authenticate.css\" rel=\"stylesheet\" type=\"text/css\" />\n");
      out.write("        \n");
      out.write("\n");
      out.write("        \n");
      out.write("         <!--<script src=\"bootstrap-3.3.6-dist/js/bootstrap.min.tab.js\"></script>-->\n");
      out.write("         \n");
      out.write("        <!--<link rel=\"stylesheet\" href=\"http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css\">-->\n");
      out.write("        <!--<script src=\"https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js\"></script>-->\n");
      out.write("\n");
      out.write("          \n");
      out.write("        \n");
      out.write("        <script src=\"");
      out.print(Config.getBase_url(request) );
      out.write("js/jquery.bootpag.js\"></script>\n");
      out.write("        <script src=\"");
      out.print(Config.getBase_url(request) );
      out.write("js/login.js\"></script>\n");
      out.write("\n");
      out.write("        \n");
      out.write("        \n");
      out.write("        <!--for calendar js-->\n");
      out.write("<!--        <link rel=\"stylesheet\" href=\"//code.jquery.com/ui/1.11.2/themes/smoothness/jquery-ui.css\">\n");
      out.write("        <script src=\"//code.jquery.com/jquery-1.10.2.js\"></script>\n");
      out.write("        <script src=\"//code.jquery.com/ui/1.11.2/jquery-ui.js\"></script>-->\n");
      out.write("        <!--<script src=\"js/datepicker.js\"></script>-->\n");
      out.write("</head>");
      out.write("\n");
      out.write("<body>\n");
      out.write("<div class=\"container-fluid\">\n");
      out.write("    <div class=\"row\">\n");
      out.write("        <div class=\"col-md-12 col-sm-12 col-xs-12 col_image\">\n");
      out.write("            <img src=\"image/oldutemlogo.png\" class=\"img-responsive center-block\" alt=\"Responsive image\" id=\"UTeMImage\">\n");
      out.write("        </div>\n");
      out.write("    </div>\n");
      out.write("    <div class=\"row\" id=\"rowSignInUp\">\n");
      out.write("        <div class=\"col-md-5 col-md-offset-1 col-sm-6 col-xs-6\" id=\"left_column\">\n");
      out.write("            <h3><em>E-Appointment</em></h3>\n");
      out.write("        </div>\n");
      out.write("        <div class=\"col-md-2 col-md-offset-3 col-sm-6 col-xs-6\" id=\"right_column_signinup\">\n");
      out.write("            <button class=\"btn btn-info buttonAuthenticate\" onclick=\"window.location.href='login.jsp'\">Sign In</button>\n");
      out.write("            <button class=\"btn btn-info buttonAuthenticate\" onclick=\"window.location.href='register.jsp'\">Sign Up</button>\n");
      out.write("        </div>\n");
      out.write("    </div>  \n");
      out.write("    <div class=\"row\">\n");
      out.write("        <div class=\"col-md-2 col-md-offset-1 col-sm-12 col-xs-12 bodyContent\">\n");
      out.write("            <h3 class=\"headerTitle\">Categories</h3>\n");
      out.write("            <ul class=\"headerUL\">\n");
      out.write("                <li><a href=\"login.jsp\" onClick=\"login();\" class=\"bodyUL\"> Maintain Holiday </a><hr></li>\n");
      out.write("                <li><a href=\"login.jsp\" onClick=\"login();\" class=\"bodyUL\"> Maintain Clinic Day </a><hr></li>\n");
      out.write("                <li><a href=\"login.jsp\" onClick=\"login();\" class=\"bodyUL\"> Maintain Roster   </a><hr></li>\n");
      out.write("                <li><a href=\"login.jsp\" onClick=\"login();\" class=\"bodyUL\"> Maintain Leave   </a><hr></li>\n");
      out.write("                <li><a href=\"login.jsp\" onClick=\"login();\" class=\"bodyUL\"> Manage Appointment </a></li>\n");
      out.write("            </ul>\n");
      out.write("            <h3 class=\"headerTitle\">Details</h3>\n");
      out.write("            <ul class=\"headerUL\">\n");
      out.write("                <li><a href=\"#\" class=\"bodyUL\">About Us </a><hr></li>\n");
      out.write("                <li><a href=\"#\" class=\"bodyUL\">Contact Us </a><hr></li>\n");
      out.write("                <li><a href=\"#\" class=\"bodyUL\">Our Location </a><hr></li>\n");
      out.write("            </ul>\n");
      out.write("            ");
      out.write("<head>\n");
      out.write("    <script src=\"js/clock.js\"></script>    \n");
      out.write("</head>");
      out.write("\n");
      out.write("            <script type=\"text/javascript\" language=\"JavaScript\">obj=new Object;obj.clockfile=\"5025-white.swf\";obj.TimeZone=\"Malaysia_KualaLumpur\"; obj.width=180;obj.height=180;obj.wmode=\"transparent\";showClock(obj);</script>\n");
      out.write("        </div>\n");
      out.write("        <div class=\"col-md-8 col-sm-12 col-xs-12 bodyContent\">\n");
      out.write("            <h3 class=\"headerTitle\">What is e-Appointment</h3>\n");
      out.write("            <p style=\"text-align: justify\"><strong>e-Appointment is a Web Bases application that is used to manage the patient appointment record by using a web based. \n");
      out.write("                    As this web based application is designed in a responsive form so that it is also will be able to be opened in any mobile devices. User will be using \n");
      out.write("                    a web browser to open the application then perform the booking appointment activities. Before performing an appointment user need to check the doctor \n");
      out.write("                    availability and also view a holiday. First time user need to attend to the clinic in order to use the system but sign up is needed before user can \n");
      out.write("                    proceed to sign in into the system.\n");
      out.write("            </strong></p>\n");
      out.write("            <h3 class=\"headerTitle\" style=\"margin-top: 3%;\">How to use the system ?</h3>\n");
      out.write("            <p><strong>Step 1: Patients need to attend to the clinic/hospital as a First Time User in order to use the system</strong></p>\n");
      out.write("            <p><strong>Step 2: Patients need to Sign Up and fill in the Register Form </strong></p>\n");
      out.write("            <p><strong>Step 3: Patients can use the system by Signing in into the system</strong></p>\n");
      out.write("            <p><strong>Step 4: Patients have option to  check the doctor availability and view holiday before make an appointment or directly make an appointment</strong></p>\n");
      out.write("            <p><strong>Step 5: Patients can view their previous appointment at the View Appointment tab</strong></p>\n");
      out.write("            <h3 class=\"headerTitle\" style=\"margin-top: 3%;\">Our Location</h3>\n");
      out.write("\n");
      out.write("            <div class=\"google_map\">\n");
      out.write("            <iframe src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d15946.294237778036!2d102.32034365!3d2.3109037500000005!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31d1\n");
      out.write("                    e46c6eaa869b%3A0xb8935957e3536888!2sUniversiti+Teknikal+Malaysia+Melaka!5e0!3m2!1sen!2s!4v1433745195746\" width=\"700\" height=\"450\" frameborder=\"0\"></iframe></div>\n");
      out.write("            View <a href=\"https://www.google.com/maps/place/Universiti+Teknikal+Malaysia+Melaka/@2.313859,102.3190038,17z/data=!3m1!4b1!4m2!3m1!1s0x31d1e46c6eaa869b:0xb8935957e3536888\" class=\"large_map\">Utem Clinic</a> in a larger map        \n");
      out.write("        </div>\n");
      out.write("   </div>\n");
      out.write("<div class=\"row\">\n");
      out.write("    <div class=\"col-md-12 col-sm-12 col-xs-12 footer \">\n");
      out.write("            Copyright &copy; BIOCORE 2016\n");
      out.write("    </div>\n");
      out.write("</div>\n");
      out.write("</div>\n");
      out.write("</body>\n");
      out.write("</html>\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
