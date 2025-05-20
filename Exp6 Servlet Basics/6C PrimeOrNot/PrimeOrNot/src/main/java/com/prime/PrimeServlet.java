/*
 * 6c. Build a servlet program to check the given number is prime number or not using HTML with step
by step procedure.
 */


package com.prime;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class PrimeServlet extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        
        // Get number from request
        String numStr = request.getParameter("number");
        
        try {
            int num = Integer.parseInt(numStr);
            boolean isPrime = true;

            if (num <= 1) {
                isPrime = false;
            } else {
                for (int i = 2; i <= Math.sqrt(num); i++) {
                    if (num % i == 0) {
                        isPrime = false;
                        break;
                    }
                }
            }

            // Output result
            out.println("<html><body>");
            out.println("<h2>Result:</h2>");
            if (isPrime)
                out.println("<p>" + num + " is a <strong>Prime</strong> number.</p>");
            else
                out.println("<p>" + num + " is <strong>Not Prime</strong>.</p>");
            out.println("</body></html>");

        } catch (NumberFormatException e) {
            out.println("<p>Invalid number!</p>");
        }
    }
}
