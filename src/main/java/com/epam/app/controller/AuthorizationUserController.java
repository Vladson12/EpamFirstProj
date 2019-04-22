
package com.epam.app.controller;

import com.epam.app.model.User;
import com.epam.app.service.UserService;
import lombok.NoArgsConstructor;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@NoArgsConstructor
public class AuthorizationUserController extends HttpServlet {


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(true);
        String login = request.getParameter("login");
        String password = request.getParameter("password");

        User userAccount = UserService.findUser(login, password);

        if (UserService.isAllowedUser(login, password)) {
            if (userAccount != null) {
                session.setAttribute("loggedInUser", userAccount);
                request.getRequestDispatcher("/view/index.jsp").forward(request, response);
            }
        } else {
            String errMessage = "Incorrect Username or password!";
            request.setAttribute("errMessage", errMessage);
            request.getRequestDispatcher("/view/authorization.jsp").forward(request, response);
        }

    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        RequestDispatcher requestDispatcher = req.getRequestDispatcher("view/authorization.jsp");
        requestDispatcher.forward(req, resp);
    }
}





    //    @Override
//    protected void doPost(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        HttpSession session = request.getSession(true);
//        String login = request.getParameter("login");
//        String password = request.getParameter("password");
//        User userAccount = UserService.findUser(login, password);
//        AppUtils.storeLoginedUser(session, userAccount);
//
//        if (UserService.isAllowedUser(login, password)) {
//
//            if (userAccount.getRole() == Role.READER) {
//                List<User> users = new UserService().getAllUsers();
//                if (users != null) {
//                    session.setAttribute("reader", users);
//                } else {
//                    System.out.println("Users is null");
//                }
//                request.getRequestDispatcher("/view/indexReader.jsp").forward(request, response);
//
//
//            } else if (userAccount.getRole() == Role.LIBRARIAN) {
//                List<User> users = new UserService().getAllUsers();
//                if (users != null) {
//                    session.setAttribute("librarian", users);
//                } else {
//                    System.out.println("Users is null");
//                }
//                request.getRequestDispatcher("/view/index.jsp").forward(request, response);
//            } else {
//                List<User> users = new UserService().getAllUsers();
//                if (users != null) {
//                    session.setAttribute("admin", users);
//                }
//
//                request.getRequestDispatcher("/view/index.jsp").forward(request, response);
//            }
//
//        } else {
//            String errMessage = "Incorrect Username or password!";
//            request.setAttribute("errMessage", errMessage);
//            request.getRequestDispatcher("/view/authorization.jsp").forward(request, response);
//        }
//
//    }
//
//    @Override
//    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//        RequestDispatcher requestDispatcher = req.getRequestDispatcher("view/authorization.jsp");
//        requestDispatcher.forward(req, resp);
//    }
//}
//package com.epam.app.controller;
//
//import com.epam.app.model.User;
//import com.epam.app.service.UserService;
//import com.epam.app.util.AppUtils;
//import lombok.NoArgsConstructor;
//
//import javax.servlet.ServletException;
//import javax.servlet.http.HttpServlet;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//import java.io.IOException;
//import java.util.HashMap;
//import java.util.Map;
//
//@NoArgsConstructor
//public class AuthorizationUserController extends HttpServlet {
//    @Override
//    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        request.getRequestDispatcher("view/authorization.jsp").forward(request, response);
//    }
//
//    @Override
//    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        String login = request.getParameter("login");
//        String password = request.getParameter("password");
//        Map<String, String> messages = new HashMap<>();
//
//        if (login == null || login.isEmpty()) {
//            messages.put("username", "Please enter username");
//        }
//
//        if (password == null || password.isEmpty()) {
//            messages.put("password", "Please enter password");
//        }
//
//        if (messages.isEmpty()) {
//            User user = UserService.findUser(login, password);
//
//            if (user != null) {
//                AppUtils.storeLoginedUser(request.getSession(), user);
//                request.getSession().setAttribute("user", user);
//                response.sendRedirect(request.getContextPath() + "/homePage");
//                return;
//            } else {
//                messages.put("login", "Unknown login, please try again");
//            }
//        }
//
//        request.setAttribute("messages", messages);
//        request.getRequestDispatcher("view/index.jsp").forward(request, response);
//    }
//}
//
//
