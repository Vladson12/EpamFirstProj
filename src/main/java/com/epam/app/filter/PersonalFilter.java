package com.epam.app.filter;

import com.epam.app.model.User;
import com.epam.app.model.enums.Role;
import org.apache.log4j.Logger;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebFilter("/PersonalFilter")
public class PersonalFilter implements Filter {
    private static final Logger log = Logger.getLogger(PersonalFilter.class);

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;
        HttpSession session = req.getSession();
        User curUser;

        if ((session != null && (curUser = (User) session.getAttribute("loggedInUser")) != null) &&
                !((curUser.getRole() == Role.LIBRARIAN) || (curUser.getRole() == Role.ADMINISTRATOR))) {
            res.sendRedirect("/exception");
            log.info("Unauthorized access request");
        } else {
            chain.doFilter(request, response);
        }
    }
}

