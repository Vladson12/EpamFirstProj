package com.epam.app.filter;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebFilter("/AuthenticationFilter")
public class AuthenticationFilter implements Filter {

    private String pathToBeIgnored;
    private String pathToBeIgnored2;
    private String pathToBeIgnored3;
    private String pathToBeIgnored4;
    private List<String> init;
    private ServletContext context;

    public void init(FilterConfig fConfig) throws ServletException {
        pathToBeIgnored = fConfig.getInitParameter("pathToBeIgnored");
        pathToBeIgnored2 = fConfig.getInitParameter("pathToBeIgnored2");
        pathToBeIgnored3 = fConfig.getInitParameter("pathToBeIgnored3");
        pathToBeIgnored4 = fConfig.getInitParameter("pathToBeIgnored4");
        this.context = fConfig.getServletContext();
        this.context.log("AuthenticationFilter initialized");
    }

    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {

        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;

        String uri = req.getRequestURI();
        this.context.log("Requested Resource::" + uri);

        HttpSession session = req.getSession(false);

//        if ((session == null || session.getAttribute("loggedInUser") == null) &&
//                !(uri.equals("/") || (uri.equals("/login"))) &&
//                !(uri.equals("/registration") || (uri.equals("/logout"))) &&
//                !(uri.equals("/passwordRecovery"))) {
//            this.context.log("Unauthorized access request");
//            res.sendRedirect(req.getContextPath() + "/login");

        if ((session == null || session.getAttribute("loggedInUser") == null) &&
                !(uri.equals(pathToBeIgnored) || (uri.equals(pathToBeIgnored2))) &&
                !(uri.equals(pathToBeIgnored3) || (uri.equals(pathToBeIgnored4)))) {
            this.context.log("Unauthorized access request");
            res.sendRedirect(req.getContextPath() + "/login");
        } else {
            chain.doFilter(request, response);
        }
    }


    public void destroy() {
        //close any resources here
    }

}

