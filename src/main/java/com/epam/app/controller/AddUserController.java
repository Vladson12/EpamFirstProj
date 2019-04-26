package com.epam.app.controller;


import com.epam.app.model.User;
import com.epam.app.model.enums.Role;
import com.epam.app.service.UserService;
import org.passay.CharacterData;
import org.passay.CharacterRule;
import org.passay.EnglishCharacterData;
import org.passay.PasswordGenerator;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Properties;

public class AddUserController extends HttpServlet {

    private static final PasswordGenerator gen = new PasswordGenerator();
    private static final CharacterData alphabeticals = EnglishCharacterData.Alphabetical;
    private static final CharacterData numerics = EnglishCharacterData.Digit;
    private static final CharacterRule AlphabeticalRule = new CharacterRule(alphabeticals);
    private static final CharacterRule NumericRule = new CharacterRule(numerics);

    private static Properties mailServerProperties;
    private static Session getMailSession;
    private static MimeMessage generateMailMessage;

    private static String name;
    private static String login;
    private static String password;

    static {
        AlphabeticalRule.setNumberOfCharacters(3);
        NumericRule.setNumberOfCharacters(3);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        HttpServlet servlet = (HttpServlet) getServletContext().getServlet("com.epam.app.controller.RegisterUserController");
//        servlet.service(request, response);

// Copying all the input parameters in to local variables
        name = request.getParameter("name");
        login = request.getParameter("login");
        password = gen.generatePassword(6, AlphabeticalRule, NumericRule);

        User user = new User(name, Role.READER, login, password);

        boolean isUserRegistered = UserService.create(user);

        if (!isUserRegistered) {
            request.setAttribute("errMessage", "This email already exists!");
            request.getRequestDispatcher("/view/addUser.jsp").forward(request, response);
        } else {
//            try {
//                sendEmail(login);
//            } catch (MessagingException e) {
//                e.printStackTrace();
//            }
            request.getRequestDispatcher("index.jsp").forward(request, response);
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("view/addUser.jsp").forward(req, resp);
    }

    public static void sendEmail(String userEmail) throws AddressException, MessagingException {

        // Step1
        System.out.println("\n 1st ===> setup Mail Server Properties..");
        mailServerProperties = System.getProperties();
        mailServerProperties.put("mail.smtp.port", "587");
        mailServerProperties.put("mail.smtp.auth", "true");
        mailServerProperties.put("mail.smtp.starttls.enable", "true");
        System.out.println("Mail Server Properties have been setup successfully..");

        // Step2
        System.out.println("\n\n 2nd ===> get Mail Session..");
        getMailSession = Session.getDefaultInstance(mailServerProperties, null);
        generateMailMessage = new MimeMessage(getMailSession);
        generateMailMessage.addRecipient(Message.RecipientType.CC, new InternetAddress(userEmail));
        generateMailMessage.setSubject("Library: new Account details");
        String emailBody = "You was successfully added to the library base.\n"+
                "Email: " + login +
                "Password: " + password +
                "\nYou can change it in your Personal Cabinet." +
                "<br><br> Regards, <br>Library Administration";
        generateMailMessage.setContent(emailBody, "text/html");
        System.out.println("Mail Session has been created successfully..");

//        // Step3
        System.out.println("\n\n 3rd ===> Get Session and Send mail");
        Transport transport = getMailSession.getTransport("smtp");

        // Enter your correct gmail UserID and Password
        // if you have 2FA enabled then provide App Specific Password
        transport.connect("smtp.gmail.com", "<----- Your GMAIL ID ----->", "<----- Your GMAIL PASSWORD ----->");
        transport.sendMessage(generateMailMessage, generateMailMessage.getAllRecipients());
        transport.close();
    }
}
