package com.epam.app.filter;

import com.epam.app.model.User;
import org.apache.log4j.Logger;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebFilter("/AuthenticationFilter")
public class AuthenticationFilter implements Filter {

    static final Logger log = Logger.getLogger(AuthenticationFilter.class);

    private String pathToBeIgnored;
    private String pathToBeIgnored2;
    private String pathToBeIgnored3;
    private String pathToBeIgnored4;

    public void init(FilterConfig fConfig) throws ServletException {
        pathToBeIgnored = fConfig.getInitParameter("pathToBeIgnored");
        pathToBeIgnored2 = fConfig.getInitParameter("pathToBeIgnored2");
        pathToBeIgnored3 = fConfig.getInitParameter("pathToBeIgnored3");
        pathToBeIgnored4 = fConfig.getInitParameter("pathToBeIgnored4");
        log.info("AuthenticationFilter initialized");
    }

    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {

        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;

        String uri = req.getRequestURI();

        HttpSession session = req.getSession(false);
        User user = (User) session.getAttribute("loggedInUser");

        if ((session == null || user == null) &&
                !(uri.equals(pathToBeIgnored) || (uri.equals(pathToBeIgnored2))) &&
                !(uri.equals(pathToBeIgnored3) || (uri.equals(pathToBeIgnored4)))) {
            res.sendRedirect(req.getContextPath() + "/login");
            log.info("Unauthorized access request");
        } else {
            chain.doFilter(request, response);
        }
    }


    public void destroy() {
        //close any resources here
    }

}

