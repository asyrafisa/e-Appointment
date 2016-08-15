package Config;

import javax.servlet.http.HttpServletRequest;

public class Config {

    public static String url_server = "10.73.32.200";

    public static String getBase_url(HttpServletRequest request) {
        Config.url_server = request.getServerName();
        return "http://" + request.getServerName() + ":" + request.getServerPort() + "" + request.getContextPath() + "/";
    }
}
