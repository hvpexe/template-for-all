/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package utils;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.Serializable;
import java.sql.Timestamp;
import java.util.Properties;
import javax.servlet.ServletContext;
import javax.servlet.http.Part;

/**
 *
 * @author LamVo
 */
public class Helper implements Serializable {

    public static void getSiteMaps (ServletContext contextScope)
            throws IOException {
        // Get siteMaps file path
        String siteMapsFilePath = contextScope.getInitParameter("SITEMAPS_FILE_PATH");
        InputStream is = null;
        Properties siteMaps = null;
        try {
            // Get file siteMaps properties as stream
            is = contextScope.getResourceAsStream(siteMapsFilePath);
            // Load siteMaps properties file
            siteMaps = new Properties();
            siteMaps.load(is);
            // Set siteMaps as attribute in contextScope
            contextScope.setAttribute("SITEMAPS", siteMaps);
        } finally {
            if (is != null) {
                is.close();
            }
        }

    }

    public static String formatMoney (Integer money) {
        StringBuilder sb = new StringBuilder(money.toString());
        int j = 0;
        for (int i = sb.length() - 1; i >= 0; i--) {
            if (++j % 3 == 0 && j != money.toString().length()) {
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

    public static String getFileType (String filename, Part partFile) {
        String submittedFileName = null;
        File f = null;
        submittedFileName = partFile.getSubmittedFileName();

        f = new File(submittedFileName);
        if (submittedFileName.isEmpty())
            return null;
        // refines the fileName in case it is an absolute path
        submittedFileName = f.getName();
        filename += submittedFileName.substring(submittedFileName.indexOf('.'), submittedFileName.length());//get the '.' part
        return filename;

    }

    public static File getFolderUpload (String filePath) {
        File folderUpload = new File(filePath);
        if (!folderUpload.exists())
            folderUpload.mkdirs();
        return folderUpload;
    }

    public static String saveFile (String fileName, Part partFile, ServletContext sc, String filePath) throws IOException {
        InputStream is = null;
        String savedFilePath;
        try {
            is = partFile.getInputStream();
            savedFilePath =  filePath;
            if (fileName == null)
                return null;
            fileName = Helper.getFileType(fileName, partFile);
            String webFilePath = sc.getRealPath(savedFilePath);
            String buildFilePath = webFilePath.
                    replace("\\target\\BakeryRecipe-1.0-SNAPSHOT\\", "\\src\\main\\webapp\\");
            Helper.getFolderUpload(webFilePath);
            //absoluteFilepath = D:\learning in FPT\Ky_5\SWP391\BakeryRecipe\Project\BakeryRecipe\target\BakeryRecipe-1.0-SNAPSHOT\assets\images\avt
            //webFilepath = D:\learning in FPT\Ky_5\SWP391\BakeryRecipe\Project\BakeryRecipe\src\main\webapp\assets\images\avt

            File f = new File(webFilePath);

            f = new File(buildFilePath);
            partFile.write(webFilePath + fileName);
            if (f.exists())
                partFile.write(buildFilePath + fileName);
            System.out.println("path: " + savedFilePath + fileName);

            return fileName;
        } catch (IOException ex) {
            System.out.println("Error Cant Save to " + filePath + fileName + "! " + ex.getMessage());
        } finally {
            if (is != null) {
                is.close();
            }
        }
        return null;
    }
}
