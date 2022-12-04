/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package utils;

import java.io.IOException;
import java.io.InputStream;
import java.io.Serializable;
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
            if(++j%3==0){
                sb.insert(i, '.');
            }
        }
        return sb.toString();
    }
}
