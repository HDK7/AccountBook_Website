package member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.dao.memberDAO;
import member.dao.memberDAOImpl;
import model.memberVO;

/**
 * Servlet implementation class MemberSearchController
 */
@WebServlet("/MemberSearchController")
public class MemberSearchController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberSearchController() {
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
	      //
	      //기능을 제공할 서비스 객체 생성
	      memberDAO dao = new memberDAOImpl();
	      //ServiceInterface service = new JoinServiceImpl();
	      
	      boolean flag = false;
	      
	      // 세션 생성
	      HttpSession session = request.getSession();
	      
	      // 
	      String id = (String)session.getAttribute("id");	// 회원정보를 확인하기 위한 id
	      
	      // id로 멤버 검색
	      memberVO m = dao.select(id);
	      
	      request.setAttribute("m", m); // m저장
	      
	      RequestDispatcher dispatcher = request.getRequestDispatcher("/view/memberInfo.jsp");
	      
	      if (dispatcher != null) {
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
