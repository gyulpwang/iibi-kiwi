package service.controller;

import java.util.Properties;

import javax.mail.Address;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import service.model.QnaVO;



@Controller
public class QnaController {

   /*@RequestMapping("/service/qnaListView.do")
   public void showIndex(){
      
   }*/
   
   @RequestMapping("/service/qnaEmailView.do")
   public void qnaEmailView(){
      
   }
   
   @RequestMapping("/service/send.do")
   public void send(){
      
      
   }
 
   
   @RequestMapping(value = "service/qnaSendEnd.do",
         method = {RequestMethod.GET, RequestMethod.POST})
   public String qnaSendEnd(Model model,
         HttpServletRequest req,
         @RequestParam(defaultValue = "") String title,
         @RequestParam(defaultValue = "") String category,
         @RequestParam(defaultValue = "") String contents,
         @RequestParam(defaultValue = "") String from,
         @RequestParam(defaultValue = "") String useremail
      ){
      
    
      
      Properties p = new Properties();
      p.put("mail.smtp.user", "horukaya@gmail.com");
      p.put("mail.smtp.host", "smtp.gmail.com");
      p.put("mail.smtp.port", "465");
      p.put("mail.smtp.starttls.enable", "true");
      p.put("mail.smtp.auth", "true");
      p.put("mail.smtp.debug", "true");
      p.put("mail.smtp.socketFactory.port", "465");
      p.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
      p.put("mail.smtp.socketFactory.fallback", "false");

      try {
         Authenticator auth = new SMTPAuthenticator();
         Session session = Session.getInstance(p, auth);
         session.setDebug(true);

         MimeMessage msg = new MimeMessage(session);
         String message = contents;
         
         msg.setSubject(category+title);
         
         Address fromAddr = new InternetAddress(from);
         
         msg.setFrom(fromAddr);
         
         
         
         
         Address toAddr = new InternetAddress("horukaya@gmail.com");
         msg.addRecipient(Message.RecipientType.TO, toAddr);
         msg.setContent(message, "text/plain;charset=KSC5601");
         
         Transport.send(msg);
         
      } catch (Exception mex) {
         
         mex.printStackTrace();
      }

      return "service/qnaSendEnd";
   }

   private static class SMTPAuthenticator extends javax.mail.Authenticator {

      public PasswordAuthentication getPasswordAuthentication() {
         return new PasswordAuthentication("horukaya@gmail.com", "abcd!1234");
      }
      }
   
   
}