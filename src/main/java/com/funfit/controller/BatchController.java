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
			String delete = request.getParameter("d");
			if (delete != null)
				response.sendRedirect("batchDelete.jsp");
			else
				response.sendRedirect("batchUpdate.jsp");
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
		
		RequestDispatcher rd = request.getRequestDispatcher("batchUpdate.jsp");
		BufferedReader br = new BufferedReader(new InputStreamReader(request.getInputStream()));
		String json = br.lines().collect(Collectors.joining("\n"));;
		Batch batch = new Gson().fromJson(json, Batch.class);
		String result = new BatchService().update(batch);
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
		RequestDispatcher rd = request.getRequestDispatcher("batchDeletejsp");
		if(id == null) {
			rd.include(request, response);
			return;
		}
		else {
			
			String result = new BatchService().delete(Integer.parseInt(id));
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
