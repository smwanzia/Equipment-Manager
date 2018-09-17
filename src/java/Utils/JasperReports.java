/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Utils;

import Data.ConnectionPool;
import java.io.File;
import java.io.FileInputStream;
import java.sql.Connection;
import javax.servlet.ServletContext;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletResponse;
import net.sf.jasperreports.engine.JRRuntimeException;
import net.sf.jasperreports.engine.JasperCompileManager;
import net.sf.jasperreports.engine.JasperExportManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;

/**
 *
 * @author xmore mmohz
 */
public class JasperReports  extends HttpServlet {
    ConnectionPool Pool=null;
    Connection connection=null;
    public JasperReports(){
        
    }
    public void ExportToPdf(String invoiceid,HttpServletResponse response,
            String jasperReportFileName,String title,ServletContext sc,String amount,double subtotal){
          //get real path of the file
        //ServletContext sc = this.getServletConfig().getServletContext();
        try {
            String reportFileName = JasperCompileManager.compileReportToFile(sc.getRealPath(jasperReportFileName));
            File ReportFile = new File(reportFileName);
            java.util.Map parameters = new java.util.HashMap();
            parameters.put("invoice_id", invoiceid);
            parameters.put("TotalAmount",amount);
            parameters.put("subtotal",subtotal);
            if (!ReportFile.exists()) {
                throw new JRRuntimeException("File WebappReport.jasper not. found The report design must be compiled first.");
            }
            Pool = ConnectionPool.getInstance();
            connection = Pool.getConnection();
            JasperPrint jasperprint = JasperFillManager.fillReport(reportFileName, parameters, connection);
            JasperExportManager.exportReportToPdfFile(jasperprint, sc.getRealPath("/Reports") + "/" + title + ".pdf");
            File f = new File(sc.getRealPath("/Reports") + "/" + title + ".pdf");
            FileInputStream fn = new FileInputStream(f);
            ServletOutputStream outstream = response.getOutputStream();

            //set mime type
            response.setContentType("application/pdf");

            //set content disposition to attachment in with file name
            //render on screen
            response.setHeader("Content-Disposition", "inline; filename='" + title + ".pdf");
            byte[] buffer = new byte[1024];
            int n = 0;
            while ((n = fn.read(buffer)) != -1) {
                outstream.write(buffer, 0, n);
            }

            outstream.flush();
            fn.close();
            outstream.close();
        } catch (Exception e) {
            e.printStackTrace(System.err);
        } finally {
            if (Pool != null) {
                Pool.freeConnection(connection);
            }
        }
    }
    
     public void GeneratePdf(HttpServletResponse response,
            String jasperReportFileName,String title,ServletContext sc){
          //get real path of the file
        //ServletContext sc = this.getServletConfig().getServletContext();
        try {
            String reportFileName = JasperCompileManager.compileReportToFile(sc.getRealPath(jasperReportFileName));
            File ReportFile = new File(reportFileName);
            java.util.Map parameters = new java.util.HashMap();
           // parameters.put("invoiceno", parameter1);
           // parameters.put("totalamount",amount);
           // parameters.put("producttotal",total);
            if (!ReportFile.exists()) {
                throw new JRRuntimeException("File WebappReport.jasper not. found The report design must be compiled first.");
            }
            Pool = ConnectionPool.getInstance();
            connection = Pool.getConnection();
            JasperPrint jasperprint = JasperFillManager.fillReport(reportFileName, parameters, connection);
            JasperExportManager.exportReportToPdfFile(jasperprint, sc.getRealPath("/Reports") + "/" + title + ".pdf");
            File f = new File(sc.getRealPath("/Reports") + "/" + title + ".pdf");
            FileInputStream fn = new FileInputStream(f);
            ServletOutputStream outstream = response.getOutputStream();

            //set mime type
            response.setContentType("application/pdf");

            //set content disposition to attachment in with file name
            //render on screen
            response.setHeader("Content-Disposition", "inline; filename='" + title + ".pdf");
            byte[] buffer = new byte[1024];
            int n = 0;
            while ((n = fn.read(buffer)) != -1) {
                outstream.write(buffer, 0, n);
            }

            outstream.flush();
            fn.close();
            outstream.close();
        } catch (Exception e) {
            e.printStackTrace(System.err);
        } finally {
            if (Pool != null) {
                Pool.freeConnection(connection);
            }
        }
    }
}
