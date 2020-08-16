package member.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.dao.memberDAO;
import member.dao.memberDAOImpl;
import model.memberVO;

/**
 * Servlet implementation class MemberIdCheckController
 */
@WebServlet("/MemberIdCheckController")
public class MemberIdCheckController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberIdCheckController() {
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
	      
	    PrintWriter out = response.getWriter();
	      //기능을 제공할 서비스 객체 생성
	    memberDAO dao = new memberDAOImpl();
	    //ServiceInterface service = new JoinServiceImpl();
	      
	      // 로그인에 필요한 요청 파라메터를 읽는다.
	    String id = request.getParameter("id");
	      //System.out.println(id); // 여기서 null값 출력된다. 라이브러리 부분 확인해야할듯.
	    memberVO m = dao.select(id);
	      
	    if (m!=null) { // 중복 아이디가 없는 경우
	       out.println("0");
	    } else { // 중복 아이디가 있는 경우
	       out.println("1");
	    }
	    out.close();

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
