/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Business.Item;
import Business.ShoppingCart;
import Data.ConnectionPool;
import Data.ItemDB;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import net.sf.jasperreports.engine.JRExporterParameter;
import net.sf.jasperreports.engine.JRRuntimeException;
import net.sf.jasperreports.engine.JasperCompileManager;
import net.sf.jasperreports.engine.JasperExportManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.export.JRHtmlExporter;
import net.sf.jasperreports.engine.export.JRHtmlExporterParameter;
import net.sf.jasperreports.engine.export.JRXlsExporterParameter;
import net.sf.jasperreports.engine.export.ooxml.JRDocxExporter;

/**
 *
 * @author DE_XMORE
 */
public class SalesByDateReport extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            HttpSession session=request.getSession();
            String userpath=request.getServletPath();
            String url="";
             ConnectionPool Pool=null;
            Connection connection=null;
            java.util.Date timestamp = new java.util.Date();
            DateFormat df = new SimpleDateFormat("yyyyMMddHHmmss");
            String title = "Sales Report" + df.format(timestamp);
            //get parameter from user
            String end_date = request.getParameter("enddate");
            String start_date = request.getParameter("startdate");
            String type=request.getParameter("type");
            
            String filename = "/Reports/SalesByDate.jrxml";

            String jasperReport = filename;
            ServletContext sc = this.getServletConfig().getServletContext();
            
        
               //get real path of the file
              //ServletContext sc = this.getServletConfig().getServletContext();
               
                  Pool = ConnectionPool.getInstance();
                  connection = Pool.getConnection();
                 
              try {
                  
                if(type.equals("pdf")){
                  String reportFileName = JasperCompileManager.compileReportToFile(sc.getRealPath(jasperReport));
                  File ReportFile = new File(reportFileName);
                  java.util.Map parameters = new java.util.HashMap();
                  Map<String,Object> parameter=new HashMap<>();
                  parameters.put("startDate", start_date);
                  parameters.put("EndDate",end_date);
                  //parameters.put("subtotal",subtotal);
                  if (!ReportFile.exists()) {
                      throw new JRRuntimeException("File WebappReport.jasper not. found The report design must be compiled first.");
                  }
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
                  
              }
                if(type.equals("word")) {
                  String reportFileName = JasperCompileManager.compileReportToFile(sc.getRealPath(filename));
                  File ReportFile = new File(reportFileName);
                  java.util.Map parameters = new java.util.HashMap();
                  Map<String,Object> parameter=new HashMap<>();
                  parameters.put("startDate", start_date);
                  parameters.put("EndDate",end_date);
               
                  
                 JasperPrint jasperprint = JasperFillManager.fillReport(reportFileName, parameters, connection);
                    //Maintaining request.----
                JRHtmlExporter exporter = new JRHtmlExporter();
                exporter.setParameter(JRExporterParameter.JASPER_PRINT, jasperprint);
                HashMap fontMap = new HashMap();
                exporter.setParameter(JRHtmlExporterParameter.IS_WHITE_PAGE_BACKGROUND, Boolean.FALSE);
                exporter.setParameter(JRHtmlExporterParameter.IS_USING_IMAGES_TO_ALIGN, Boolean.FALSE);
                exporter.setParameter(JRHtmlExporterParameter.IS_REMOVE_EMPTY_SPACE_BETWEEN_ROWS, Boolean.TRUE);
                exporter.setParameter(JRHtmlExporterParameter.IS_WRAP_BREAK_WORD, Boolean.TRUE);

                request.setAttribute("exportObject", exporter);
                if (!ReportFile.exists()) {
                      throw new JRRuntimeException("File WebappReport.jasper not. found The report design must be compiled first.");
                  }
              
                JRDocxExporter exporterDOCX = new JRDocxExporter();
                exporterDOCX.setParameter(JRXlsExporterParameter.JASPER_PRINT, jasperprint);
                exporterDOCX.setParameter(JRXlsExporterParameter.IS_ONE_PAGE_PER_SHEET, Boolean.TRUE);
                exporterDOCX.setParameter(JRXlsExporterParameter.IS_DETECT_CELL_TYPE, Boolean.TRUE);
                exporterDOCX.setParameter(JRXlsExporterParameter.IS_WHITE_PAGE_BACKGROUND, Boolean.FALSE);
                exporterDOCX.setParameter(JRXlsExporterParameter.IS_REMOVE_EMPTY_SPACE_BETWEEN_ROWS, Boolean.TRUE);
                exporterDOCX.setParameter(JRExporterParameter.OUTPUT_FILE_NAME, sc.getRealPath("/Reports") + "/" + title + ".doc");
                exporterDOCX.exportReport();
                File f = new File(sc.getRealPath("/Reports") + "/" + title + ".doc");
                FileInputStream fin = new FileInputStream(f);
                ServletOutputStream outStream = response.getOutputStream();
                // SET THE MIME TYPE.
                response.setContentType("application/vnd.openxmlformats-officedocument.wordprocessingml.document");
                // set content dispostion to attachment in with file name.
                // case the open/save dialog needs to appear.
                response.setHeader("Content-Disposition", "attachment;filename=" + title + ".docx");

                byte[] buffer = new byte[1024];
                int n = 0;
                while ((n = fin.read(buffer)) != -1) {
                    outStream.write(buffer, 0, n);
                }

                outStream.flush();
                fin.close();
                outStream.close();
                      
                  }
              } catch (Exception e) {
                  e.printStackTrace(System.err);
              } finally {
                  if (Pool != null) {
                      Pool.freeConnection(connection);
                  }
              }
    }

   

}
