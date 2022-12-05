/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package utils;

import java.io.IOException;
import java.io.InputStream;
import java.io.Serializable;
import java.sql.Timestamp;
import java.util.Properties;
import javax.servlet.ServletContext;


/**
 *
 * @author LamVo
 */
public class Helper implements Serializable{
    public static void getSiteMaps(ServletContext contextScope)
            throws IOException {
        // Get siteMaps file path
        String siteMapsFilePath = contextScope.getInitParameter("SITEMAPS_FILE_PATH");
        InputStream is = null;
        Properties siteMaps= null;
        try {
            // Get file siteMaps properties as stream
            is = contextScope.getResourceAsStream(siteMapsFilePath);
            // Load siteMaps properties file
            siteMaps=new Properties();
            siteMaps.load(is);
            // Set siteMaps as attribute in contextScope
            contextScope.setAttribute("SITEMAPS", siteMaps);
        } finally {
            if (is != null) {
                is.close();
            }
        }

    }
    public static String formatMoney(Integer money)
    {
        StringBuilder sb = new StringBuilder(money.toString());
        int j=0;
        for (int i = sb.length() - 1; i >= 0; i--) {
            if(++j%3==0&& j!=money.toString().length()){
                sb.insert(i, '.');
            }
        }
        return sb.toString();
    }

    public static String ToDateSeperator (Timestamp orderDate) {
        String day = "Th\u1ee9 " + (orderDate.getDay() + 1);
        if (orderDate.getDay() == 0)
            day = "Ch\u1ee7 Nh\u1eadt";
        return day + ", " + orderDate.getDate() + "-" + orderDate.getMonth() + "-" + (orderDate.getYear() + 1900);
    }
}
