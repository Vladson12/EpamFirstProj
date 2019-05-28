package com.epam.app.util.mail;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.util.Date;
import java.util.Properties;

public class Mail {
    private Mail() {
    }

    private static Session getSession() {
        final String fromEmail = "technovladson@gmail.com"; //requires valid gmail id
        final String password = "Polina2313"; // correct password for gmail id
        String smtpHostServer = "smtp.gmail.com";

        Properties props = System.getProperties();
        props.put("mail.smtp.user", fromEmail);
        props.put("mail.smtp.host", smtpHostServer); //SMTP Host
        props.put("mail.smtp.port", 465); //TLS Port
        props.put("mail.smtp.starttls.enable", "true"); //enable
        props.put("mail.smtp.auth", "true"); //enable authentication
        props.put("mail.smtp.debug", "true");
        props.put("mail.smtp.socketFactory.port", fromEmail);
        props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
        props.put("mail.smtp.ssl.checkserveridentity", true);
        props.put("mail.smtp.socketFactory.fallback", "false");

        Authenticator auth = new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(fromEmail, password);
            }
        };
        Session session = Session.getInstance(props, auth);
        session.setDebug(true);

        return Session.getInstance(props, auth);
    }

    public static void send(String toEmail, String subject, String body) throws MessagingException {
        MimeMessage msg = new MimeMessage(getSession());

        msg.addHeader("Content-type", "text/HTML; charset=UTF-8");
        msg.addHeader("format", "flowed");
        msg.addHeader("Content-Transfer-Encoding", "8bit");

        msg.setFrom(new InternetAddress("no_reply@example.com"));
        msg.setReplyTo(InternetAddress.parse("no_reply@example.com", false));
        msg.setSubject(subject, "UTF-8");
        msg.setText(body, "UTF-8");
        msg.setSentDate(new Date());

        msg.setRecipients(Message.RecipientType.TO, InternetAddress.parse(toEmail, false));
        Transport.send(msg);
    }
}


