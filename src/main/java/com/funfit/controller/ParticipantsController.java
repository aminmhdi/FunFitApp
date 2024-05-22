package com.funfit.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.funfit.bean.Participants;
import com.funfit.service.ParticipantsService;

/**
 * Servlet implementation class ParticipantsController
 */
@WebServlet("/Participants")
public class ParticipantsController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	ParticipantsService ps = new ParticipantsService();

	public ParticipantsController() {
		super();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		PrintWriter pw = response.getWriter();
		HttpSession hs = request.getSession();
		List<Participants> listOfParticipants = ps.viewAllParticipants();
		hs.setAttribute("participants", listOfParticipants);
		response.sendRedirect("viewParticipants.jsp");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		PrintWriter pw = response.getWriter();
		response.setContentType("text/html");
		String fname = request.getParameter("fname");
		int age = Integer.parseInt(request.getParameter("age"));
		String phonenumber = request.getParameter("phonenumber");
		int bid = Integer.parseInt(request.getParameter("bid"));
		RequestDispatcher rd = request.getRequestDispatcher("addParticipants.jsp");
		Participants pp = new Participants();
		pp.setFname(fname);
		pp.setAge(age);
		pp.setPhonenumber(phonenumber);
		pp.setBid(bid);

		String result = ps.addParticipants(pp);
		pw.print(result);
		rd.include(request, response);
	}

	@Override
	protected void doPut(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

	}

	@Override
	protected void doDelete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

	}
}
