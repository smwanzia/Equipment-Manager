/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Utils;

import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 *
 * @author xmore mmohz
 */
@MultipartConfig
public class FileUpload extends HttpServlet {
    
    private void UploadFile(HttpServletRequest request,HttpServletResponse response)
            throws ServletException ,IOException{
        
        for(Part part : request.getParts()){
            String name=part.getName();
            InputStream is=request.getPart(name).getInputStream();
            String fileName = getUploadedFileName(part);
            FileOutputStream fos=new FileOutputStream("c:/upload/"+fileName);
            int data=0;
            while((data= is.read())!= -1){
                fos.write(data);
            }
            fos.close();
            is.close();
            
            
        }
    }
    
    /**
	 * Method used to get uploaded file name.
	 * This will parse following string and get filename 
	 * Content-Disposition: form-data; name="content"; filename="a.txt"
	 **/
    private String getUploadedFileName(Part p){
        String file = "";
        String header="Content-Disposition";
        String[] strArray = p.getHeader(header).split(",");
        for(String split:strArray){
           if(split.trim().startsWith("filename")){
               file=split.substring(split.indexOf('=')+1);
               file = file.trim().replace("\"","");
               System.out.println("File name : "+file);
           }
        }
        return file;
    }
    
}
