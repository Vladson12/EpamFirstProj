package com.epam.app.filter;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;


public class SecurityFilter implements Filter {
    private String pathToBeIgnored;

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        System.out.println("Filter worked");
    }

    @Override
    public void doFilter(ServletRequest req, ServletResponse res, FilterChain chain) throws IOException, ServletException {
        HttpServletRequest request = (HttpServletRequest) req;
        HttpServletResponse response = (HttpServletResponse) res;
        HttpSession session = request.getSession(false);
        String path = request.getRequestURI();


        if (!((path.equals("/") || path.equals("/registration")) || (path.equals("/logout") || path.equals("/login")))
                && (session == null || session.getAttribute("loggedInUser") == null)) {
            response.sendRedirect(request.getContextPath() + "/login");
        } else {
            chain.doFilter(request, response);
        }
    }
//        if (!(requestURL.equals("http://localhost:8080/") || requestURL.equals("http://localhost:8080/login"))
//                && (session == null || session.getAttribute("loggedInUser") == null)) {
//        String requestURL = ((HttpServletRequest) req).getRequestURL().toString();
//    @Override
//    public void doFilter(ServletRequest req, ServletResponse res, FilterChain chain) throws IOException, ServletException {
//        HttpServletRequest request = (HttpServletRequest) req;
//        HttpServletResponse response = (HttpServletResponse) res;
//        HttpSession session = request.getSession(true);
//
//        if (session == null || session.getAttribute("reader") == null || session.getAttribute("admin") == null || session.getAttribute("librarian") == null) {
//            response.sendRedirect(request.getContextPath() + "/login"); // No logged-in user found, so redirect to login page.
////            request.getRequestDispatcher("/view/authorization.jsp").forward(request, response);
//        } else {
//            chain.doFilter(req, res); // Logged-in user found, so just continue request.
//        }
//    }

    @Override
    public void destroy() {
        // If you have assigned any expensive resources as field of
        // this Filter class, then you could clean/close them here.
    }
}