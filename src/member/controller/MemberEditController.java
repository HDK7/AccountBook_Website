package member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.dao.memberDAO;
import member.dao.memberDAOImpl;
import model.memberVO;

/**
 * Servlet implementation class MemberEditController
 */
@WebServlet("/MemberEditController")
public class MemberEditController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberEditController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		response.setCharacterEncoding("utf-8");
		
		memberDAO dao = new memberDAOImpl();
		
		memberVO m = new memberVO(request.getParameter("id"), request.getParameter("name"), request.getParameter("email"), request.getParameter("pwd"), request.getParameter("address"),
				request.getParameter("status"), request.getParameter("cls"), Integer.parseInt(request.getParameter("score")));
		
		dao.update(m);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("/view/main.jsp");
		
		if (dispatcher!=null) {
			dispatcher.forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
