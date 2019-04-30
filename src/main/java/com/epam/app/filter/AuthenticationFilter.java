package com.epam.app.filter;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebFilter("/AuthenticationFilter")
public class AuthenticationFilter implements Filter {

    private ServletContext context;

    public void init(FilterConfig fConfig) throws ServletException {
        this.context = fConfig.getServletContext();
        this.context.log("AuthenticationFilter initialized");
    }

    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {

        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;

        String uri = req.getRequestURI();
        this.context.log("Requested Resource::" + uri);

        HttpSession session = req.getSession(false);

        if ((session == null || session.getAttribute("loggedInUser") == null) &&
                !(uri.equals("/") || (uri.equals("/login"))) &&
                !(uri.equals("/registration") || (uri.equals("/logout"))) &&
                !(uri.equals("/passwordRecovery"))) {
            this.context.log("Unauthorized access request");
            res.sendRedirect(req.getContextPath() + "/login");


        } else {
            // pass the request along the filter chain
            chain.doFilter(request, response);
        }
    }


    public void destroy() {
        //close any resources here
    }

}

