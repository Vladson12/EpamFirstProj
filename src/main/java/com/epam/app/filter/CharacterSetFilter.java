package com.epam.app.filter;

import javax.servlet.*;
import java.io.IOException;
import java.util.logging.LogRecord;

/**
 * Created by vladd on 08.05.2019
 */
public class CharacterSetFilter implements Filter {

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    public void doFilter(ServletRequest request, ServletResponse response, FilterChain next) throws IOException, ServletException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        response.setCharacterEncoding("UTF-8");
        next.doFilter(request, response);
    }

    @Override
    public void destroy() {

    }
}
