package Utils;
import java.io.UnsupportedEncodingException;
import java.util.Properties;
import javax.activation.DataHandler;
import javax.activation.DataSource;
import javax.activation.FileDataSource;
import javax.mail.BodyPart;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.AddressException;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMultipart;

public class MailUtilLocal {

 public static void sendMail(String to, String from, String subject, String body, boolean bodyIsHTML,String fileName)
            throws MessagingException
           {
        final String smtp_host = "smtp.gmail.com";
        final String smtp_username = "simonmumo7@gmail.com";
        final String smtp_password = "mwanzia14601";

        final String toEmail = to;
        final String fromEmail = from;
        final String smtp_connection = "TLS";

        // get a mail session
        Properties props = new Properties();
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", "smtp.gmail.com");//smtp server address
        props.put("mail.smtp.port", "587");//port for the smtp server
      
      
	Session session = Session.getInstance(props,
                new javax.mail.Authenticator() {
                    protected PasswordAuthentication getPasswordAuthentication() {
                        return new PasswordAuthentication(smtp_username, smtp_password);//used to authenticate gmail account
                    }
                });
        try {
            //create a message
            Message message = new MimeMessage(session);
              message.setSubject(subject);
            if(bodyIsHTML){
                message.setContent(body,"text/html");
            }else{
                message.setText(body);
            }
            message.setFrom(new InternetAddress(fromEmail));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(toEmail));
            message.setText("application confirmation");
            message.setContent(body,"text/html");
            
             // Create the message part
         BodyPart messageBodyPart = new MimeBodyPart();
             // Create a multipart message
         Multipart multipart = new MimeMultipart();
         // Now set the actual message
         messageBodyPart.setText(body);
         // Set text message part
         multipart.addBodyPart(messageBodyPart);

         // Part two is attachment
         messageBodyPart = new MimeBodyPart();
         String filename =fileName;
         DataSource source = new FileDataSource(filename);
         messageBodyPart.setDataHandler(new DataHandler(source));
         messageBodyPart.setFileName(filename);
         multipart.addBodyPart(messageBodyPart);

         // Send the complete message parts
         message.setContent(multipart);
         Transport.send(message);//sent the entire message
           
         System.out.println("Email sent successfully...");

        } catch (MessagingException e) {
            throw new RuntimeException(e);
        }
    }
	
}
