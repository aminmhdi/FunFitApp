package com.funfit.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class BatchController
 */
@WebServlet("/About")
public class AboutController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public AboutController() {
		super();
	}

	// view purpose
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.sendRedirect("about.jsp");
	}
}
