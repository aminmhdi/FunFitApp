package com.funfit.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.util.List;
import java.util.stream.Collectors;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.google.gson.Gson;

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
		hs.setAttribute("batches", new BatchService().list());
		if (id == null || id.isEmpty()) {
			String name = request.getParameter("name");
			String phone = request.getParameter("phone");
			String bid = request.getParameter("bid");
			List<Participants> listOfParticipants = new ParticipantsService().list(name, phone, bid);
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
			// hs.setAttribute("batch", new ParticipantsService().get(idInt));
			request.setAttribute("title", "Detail");
			String delete = request.getParameter("d");
			hs.setAttribute("participant", new ParticipantsService().get(idInt));
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
		BufferedReader br = new BufferedReader(new InputStreamReader(request.getInputStream()));
		String json = br.lines().collect(Collectors.joining("\n"));
		Participants participant = new Gson().fromJson(json, Participants.class);
		RequestDispatcher rd = request.getRequestDispatcher("addParticipants.jsp");
		String result = new ParticipantsService().create(participant);
		if (result == "") {
			response.sendRedirect("Participant");
			return;
		} else {
			pw.println(result);
			rd.include(request, response);
		}
	}

	@Override
	protected void doPut(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		PrintWriter pw = response.getWriter();
		response.setContentType("text/html");

		RequestDispatcher rd = request.getRequestDispatcher("participantUpdate.jsp");
		BufferedReader br = new BufferedReader(new InputStreamReader(request.getInputStream()));
		String json = br.lines().collect(Collectors.joining("\n"));
		Participants participant = new Gson().fromJson(json, Participants.class);
		String result = new ParticipantsService().update(participant);
		if (result == "") {
			return;
		} else {
			pw.println(result);
			rd.include(request, response);
		}
	}

	@Override
	protected void doDelete(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		PrintWriter pw = response.getWriter();
		response.setContentType("text/html");
		String id = request.getParameter("id");
		RequestDispatcher rd = request.getRequestDispatcher("participantDeletejsp");
		if (id == null) {
			rd.include(request, response);
			return;
		} else {
			String result = new ParticipantsService().delete(Integer.parseInt(id));
			if (result == "") {
				return;
			} else {
				pw.println(result);
				rd.include(request, response);
				return;
			}
		}
	}
}
