package com.filter;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class AuthFilter implements Filter {

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        // Initialization code, if needed
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {
        
        HttpServletRequest httpRequest = (HttpServletRequest) request;
        HttpServletResponse httpResponse = (HttpServletResponse) response;
        HttpSession session = httpRequest.getSession(false); // Get existing session without creating a new one
        
        String requestURI = httpRequest.getRequestURI();
        
        // List of URLs that are allowed without authentication
        if (requestURI.endsWith("/login") || requestURI.endsWith("/login.jsp")) {
            chain.doFilter(request, response); // Allow access to login pages
            return;
        }

        // Check if the user is logged in
        if (session != null && session.getAttribute("username") != null) {
            String role = (String) session.getAttribute("role");
            if (requestURI.startsWith("/dashboard.jsp") && "driver".equals(role)) {
                chain.doFilter(request, response); // Allow access to driver dashboard if role is driver
                return;
            }
            // Add additional checks for other roles and pages if needed
            // Example:
            // if (requestURI.startsWith("/manager-dashboard.jsp") && "manager".equals(role)) {
            //     chain.doFilter(request, response); // Allow access to manager dashboard if role is manager
            //     return;
            // }
        }

        // Redirect to login if not authenticated
        httpResponse.sendRedirect(httpRequest.getContextPath() + "/login.jsp?error=not_authenticated");
    }

    @Override
    public void destroy() {
        // Cleanup code, if needed
    }
}
