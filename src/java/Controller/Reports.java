/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Business.Categories;
import Business.County;
import Business.Item;
import Business.ShoppingCart;
import Data.CategoryDB;
import Data.ConnectionPool;
import Data.CustomerDB;
import Data.ItemDB;
import Utils.JasperReports;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
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
import net.sf.jasperreports.engine.export.ooxml.JRDocxExporter;
import net.sf.jasperreports.engine.export.JRHtmlExporterParameter;
import net.sf.jasperreports.engine.export.JRXlsExporter;
import net.sf.jasperreports.engine.export.JRXlsExporterParameter;
import net.sf.jasperreports.engine.export.ooxml.JRDocxExporter;

/**
 *
 * @author xmore mmohz
 */
@WebServlet(name = "Reports", urlPatterns = 
        //provide url to jsp 
        {"/LoadOrderReports","/loadInvoiceSummary","/LoadSales","/LoadInvoiceReport","/LoadCustomerReport","/LoadGeneralReports",
            "/LoadApprovedOrders","/LoadDeliveredOrders","/LoadSalesByDateReport",
    
    //reports file
   "/CustomerReport","/OrderedProductReport","/InvoiceReports" ,"/InvoiceSummary","/SalesReport","/ApprovedOrderReport","/DeliveredOrderReport"})

public class Reports extends HttpServlet {

    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
       
    }

   
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
        
         JasperReports reportObj=new JasperReports();
         ServletContext sc = this.getServletConfig().getServletContext();
        
         //generate reports  details of one invoice including customer information
        if(userpath.equals("/InvoiceReports")){
            
            ConnectionPool Pool=null;
            Connection connection=null;
            java.util.Date timestamp = new java.util.Date();
            DateFormat df = new SimpleDateFormat("yyyyMMddHHmmss");
            String title = "Invoice Report" + df.format(timestamp);
            //get parameter from user
            String invoiceid = request.getParameter("invoiceid");
            String type=request.getParameter("type");
           // type="word";
             // ArrayList<Item> items=ItemDB.SelectOrderedItemByInvoiceId(invoiceid);
              //select all item of the invoice no above
            ShoppingCart cart = new ShoppingCart();

            Item itemobj=new Item();

            ArrayList<Item> items=ItemDB.SelectOrderedItemByInvoiceId(invoiceid);
            double subtotal=0.0;
             //loop through each item in the iterator and add to cart
            for(Iterator it=items.iterator(); it.hasNext();){
                    //go to the next item
                   itemobj=(Item)it.next();
                   //add items to cart
                  cart.addItem(itemobj);
                 // subtotal=itemobj.getTotal();
                 
                 }
             //ShoppingCart cart2=(ShoppingCart)session.getAttribute("cartitems");
            for(Item myitem:items){
                subtotal=myitem.getTotal();
            }
           
             
             session.setAttribute("total", cart.getInvoiceTotals());
             double totalamount=cart.getInvoiceTotals();
            
            
             
            String filename = "/Reports/InvoiceDetails.jrxml";

            String jasperReport = filename;
            
        
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
                  parameters.put("invoice_id", invoiceid);
                  parameters.put("TotalAmount",totalamount);
                  parameters.put("subtotal",subtotal);
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
                  String reportFileName = JasperCompileManager.compileReportToFile(sc.getRealPath(jasperReport));
                  File ReportFile = new File(reportFileName);
                  java.util.Map parameters = new java.util.HashMap();
                  Map<String,Object> parameter=new HashMap<>();
                  parameters.put("invoice_id", invoiceid);
                  parameters.put("TotalAmount",totalamount);
                  parameters.put("subtotal",subtotal);
                  
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
        
         
        
        //generate reports for most ordered items 
        else if(userpath.equals("/SalesReport")){
                String filepath="/Reports/AllSales.jrxml";
                String title="Sales Report";
                reportObj.GeneratePdf(response, filepath,title, sc);
           }
        
        //generate summary of invoice orders
        else if(userpath.equals("/InvoiceSummary")){
            String filepath="/Reports/InvoiceSummary.jrxml";
            String title="Order Summary";
            reportObj.GeneratePdf(response, filepath,title, sc);
            
        }
        else if(userpath.equals("/CustomerReport")){
            String filepath="/Reports/CustomerReport.jrxml";
            String title="Order Summary";
            reportObj.GeneratePdf(response, filepath,title, sc);
        }
         else if(userpath.equals("/ApprovedOrderReport")){
            String filepath="/Reports/ApprovedItems.jrxml";
            String title="Approved Orders";
            reportObj.GeneratePdf(response, filepath,title, sc);
        }
        else if(userpath.equals("/DeliveredOrderReport")){
            String filepath="/Reports/DeliveredOrders.jrxml";
            String title="Delivered Orders";
            reportObj.GeneratePdf(response, filepath,title, sc);
        }
        
        
        
        //direct or load the  reports to specified jsp page
        else if(userpath.equals("/loadInvoiceSummary")){
            url="InvoiceSummary.jsp";
            request.getRequestDispatcher("/WEB-INF/Admin/reports/"+url).forward(request, response);
        }
        else if(userpath.equals("/LoadSales")){
            //load city
            ArrayList<County> city=CustomerDB.selectCities();
            session.setAttribute("city",city);
            //load categories
            ArrayList<Categories> category=CategoryDB.selectCategories();
             session.setAttribute("categories", category);
            url="SalesReport.jsp";
            request.getRequestDispatcher("/WEB-INF/Admin/reports/"+url).forward(request, response);
           }
        
        else if(userpath.equals("/LoadOrderReports")){
            String invoiceid=request.getParameter("invoiceid");
            getServletContext().setAttribute("invoiceno",invoiceid);
            url="OrderedDetailsReportPdf.jsp";
        
            request.getRequestDispatcher("/WEB-INF/Admin/reports/"+url).forward(request, response);
        }
        else if(userpath.equals("/LoadInvoiceReport")){
                String invoiceid=request.getParameter("invoiceid");
                String type=request.getParameter("type");
                getServletContext().setAttribute("invoiceid",invoiceid);
                 getServletContext().setAttribute("type",type);
                url="InvoiceReports.jsp";
                request.getRequestDispatcher("/WEB-INF/Admin/reports/"+url).forward(request, response);
        }
         else if(userpath.equals("/LoadCustomerReport")){
                 url="CustomerReport.jsp";
                request.getRequestDispatcher("/WEB-INF/Admin/reports/"+url).forward(request, response);
        }
         else if(userpath.equals("/LoadGeneralReports")){
              url="GeneralReports.jsp";
              request.getRequestDispatcher("/WEB-INF/Admin/reports/"+url).forward(request, response);
         }
        else if(userpath.equals("/LoadApprovedOrders")){
              url="ApprovedOrders.jsp";
              request.getRequestDispatcher("/WEB-INF/Admin/reports/"+url).forward(request, response);
         }
        else if(userpath.equals("/LoadDeliveredOrders")){
              url="DeliveredOrders.jsp";
              request.getRequestDispatcher("/WEB-INF/Admin/reports/"+url).forward(request, response);
         }
        else if(userpath.equals("/LoadSalesByDateReport")){
              //get parameter from user
                String end_date = request.getParameter("enddate");
                String start_date = request.getParameter("startdate");
                String type=request.getParameter("type");
                getServletContext().setAttribute("enddate",end_date);
                getServletContext().setAttribute("startdate",start_date);
                getServletContext().setAttribute("type",type);
                
                url="SalesByDate.jsp";
                request.getRequestDispatcher("/WEB-INF/Admin/reports/"+url).forward(request, response);
         }
        else if(userpath.equals("/LoadSalesByCityRegion")){
              url="CityReport.jsp";
              request.getRequestDispatcher("/WEB-INF/Admin/reports/"+url).forward(request, response);
         }
        
    }

   

}
