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
import com.funfit.service.BatchService;

/**
 * Servlet implementation class BatchController
 */
@WebServlet("/Batch")
public class BatchController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public BatchController() {
		super();
	}

	// view purpose
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession hs = request.getSession();
		String id = request.getParameter("id");
		if (id == null || id.isEmpty()) {
			List<Batch> listOfBatch = new BatchService().list();
			hs.setAttribute("batches", listOfBatch);
			request.setAttribute("title", "Batch List");
			response.sendRedirect("batchList.jsp");
			return;
		}

		int idInt = Integer.parseInt(id);

		if (idInt == 0) {
			request.setAttribute("title", "Batch Create");
			response.sendRedirect("batchCreate.jsp");
			return;
		}

		else {
			hs.setAttribute("batch", new BatchService().get(idInt));
			request.setAttribute("title", "Detail");
			response.sendRedirect("batchDetail.jsp");
			return;
		}
	}

	// store or insert
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		PrintWriter pw = response.getWriter();
		response.setContentType("text/html");
		String typeofbatch = request.getParameter("typeofbatch");
		String time = request.getParameter("time");
		RequestDispatcher rd = request.getRequestDispatcher("batchCreate.jsp");
		Batch bb = new Batch();
		bb.setTypeofbatch(typeofbatch);
		bb.setTime(time);
		String result = new BatchService().create(bb);
		if (result == "") {
			response.sendRedirect("Batch");
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
		String typeofbatch = request.getParameter("typeofbatch");
		String time = request.getParameter("time");
		String id = request.getParameter("id");
		RequestDispatcher rd = request.getRequestDispatcher("batchUpdate.jsp");
		Batch bb = new Batch();
		bb.setTypeofbatch(typeofbatch);
		bb.setTime(time);
		bb.setBid(Integer.parseInt(id));
		String result = new BatchService().update(bb);
		if (result == "") {
			response.sendRedirect("Batch");
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
		RequestDispatcher rd = request.getRequestDispatcher("batchDeletejsp");
		String result = new BatchService().delete(Integer.parseInt(id));
		if (result == "") {
			response.sendRedirect("Batch");
			return;
		} else {
			pw.println(result);
			rd.include(request, response);
		}
	}
}
