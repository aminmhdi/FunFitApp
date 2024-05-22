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

import com.funfit.bean.Batch;
import com.funfit.bean.Participants;
import com.funfit.service.BatchService;
import com.funfit.service.ParticipantsService;

/**
 * Servlet implementation class ParticipantsController
 */
@WebServlet("/Participant")
public class ParticipantController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ParticipantController() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession hs = request.getSession();
		String id = request.getParameter("id");
		if (id == null || id.isEmpty()) {
			List<Participants> listOfParticipants = new ParticipantsService().viewAllParticipants();
			hs.setAttribute("participants", listOfParticipants);
			request.setAttribute("title", "Participant List");
			response.sendRedirect("participantList.jsp");
			return;
		}
		

		int idInt = Integer.parseInt(id);

		if (idInt == 0) {
			request.setAttribute("title", "Participant Create");
			response.sendRedirect("participantCreate.jsp");
			return;
		}

		else {
			//hs.setAttribute("batch", new ParticipantsService().get(idInt));
			request.setAttribute("title", "Detail");
			String delete = request.getParameter("d");
			if (delete != null)
				response.sendRedirect("participantDelete.jsp");
			else
				response.sendRedirect("participantUpdate.jsp");
			return;
		}
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

		String result = new ParticipantsService().addParticipants(pp);
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
