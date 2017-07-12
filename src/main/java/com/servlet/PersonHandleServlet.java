package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.action.PersonAction;
import com.vo.Person;

public class PersonHandleServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public PersonHandleServlet() {
		super();
	}

	/**
	 * Destruction of the servlet. <br>
	 */
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doPost(request, response);
	}

	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setCharacterEncoding("utf-8");
		
		if (request.getRequestURI().endsWith("/viewPerson")) {
			request.getRequestDispatcher("viewperson.jsp").forward(request, response);
		}else if (request.getRequestURI().endsWith("/addPerson")) {
			doAddPerson(request, response);
		}else if (request.getRequestURI().endsWith("/updatePerson")) {
			doUpdatePerson(request, response);
		}else if (request.getRequestURI().endsWith("/deletePerson")) {
			doDeletePerson(request, response);
		}
	}

	/**
	 * Initialization of the servlet. <br>
	 *
	 * @throws ServletException if an error occurs
	 */
	public void init() throws ServletException {
		// Put your code here
	}
	
	private void doAddPerson(HttpServletRequest request, HttpServletResponse response)
		throws ServletException, IOException{
		
		Person person = new Person();
		
		person.setName(request.getParameter("name"));
		person.setAge(new Integer(request.getParameter("age")));
		person.setSex(new Integer(request.getParameter("sex")));
		person.setMajor(request.getParameter("major"));
		person.setCollege(request.getParameter("college"));
		person.setIntroduction(request.getParameter("introduction"));
		
		PersonAction.addPerson(person);
		
		response.sendRedirect("index.jsp");
	}
	
	
	private void doUpdatePerson(HttpServletRequest request, HttpServletResponse response)
		throws ServletException, IOException{
		
		Person person = new Person();

		person.setId(new Integer(request.getParameter("id")));
		person.setName(request.getParameter("name"));
		person.setAge(Integer.parseInt(request.getParameter("age")));
		person.setSex(new Integer(request.getParameter("sex")));
		person.setMajor(request.getParameter("major"));
		person.setCollege(request.getParameter("college"));
		person.setIntroduction(request.getParameter("introduction"));

		PersonAction.updatePerson(person);
		
		response.sendRedirect("index.jsp");
	}
	
	private void doDeletePerson(HttpServletRequest request, HttpServletResponse response)
		throws ServletException, IOException{
		
		int id = new Integer(request.getParameter("id"));
		
		PersonAction.deletePerson(id);
		
		response.sendRedirect("index.jsp");
	}

}
