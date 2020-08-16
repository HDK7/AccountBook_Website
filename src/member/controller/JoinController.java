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
 * Servlet implementation class JoinController
 */
@WebServlet("/JoinController")
public class JoinController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public JoinController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		  // TODO Auto-generated method stub
	      request.setCharacterEncoding("utf-8");
	      response.setContentType("text/html;charset=utf-8");
	      response.setCharacterEncoding("utf-8");
	      
	      
	      memberDAO dao = new memberDAOImpl();
	      //ServiceInterface service = new JoinServiceImpl();
	      
	      String id = request.getParameter("id");
	      String pw = request.getParameter("pwd");
	      String name = request.getParameter("name");
	      String email = request.getParameter("email");
	      String address = request.getParameter("address");
	      
	      //System.out.println("아이디" + id);
	      //System.out.println("비밀번호" + pw);
	      //System.out.println("이름" + name);
	      //System.out.println("이메일" + email);
	      //System.out.println("주소" + address);	// 여기까지 정상출력
	      
	      memberVO m = new memberVO(id,name,email,pw,address,"오프라인","일반 회원",0); // 가입할 땐 '오프라인', 로그인 할 때 '온라인', 일반회원 (회원가입시 무조건 일반회원), 스코어 0
	      
	      dao.insert(m); // 위에서 저장한 객체값 회원가입
	      
	      RequestDispatcher dispatcher = request.getRequestDispatcher("view/Login.jsp");
	      
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
