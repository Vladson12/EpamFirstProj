package com.epam.app.filter;

import org.apache.log4j.Logger;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;

@WebFilter("/AuthenticationFilter")
public class AuthenticationFilter implements Filter {

    static final Logger log = Logger.getLogger(AuthenticationFilter.class);
    private final static Map<String, String> initValues = new HashMap<>();

    public void init(FilterConfig fConfig) throws ServletException {
        log.info("AuthenticationFilter initialized");

        Enumeration<String> initParameterNames = fConfig.getInitParameterNames();
        while (initParameterNames.hasMoreElements()) {
            String paramName = initParameterNames.nextElement();
            String paramValue = fConfig.getInitParameter(paramName);
            initValues.put(paramName, paramValue);
        }
    }

    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {

        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;
        String uri = req.getRequestURI();
        HttpSession session = req.getSession();

        if ((session == null || session.getAttribute("loggedInUser") == null) &&
                !(initValues.values().stream().anyMatch(s -> s.equals(uri)))) {
            res.sendRedirect(req.getContextPath() + "/login");
        } else {
            chain.doFilter(request, response);
        }
    }



    public void destroy() {
        //close any resources here
    }

}

