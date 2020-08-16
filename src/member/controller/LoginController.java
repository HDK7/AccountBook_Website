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
 * Servlet implementation class LoginController
 */
@WebServlet("/LoginController")
public class LoginController extends HttpServlet {
   private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginController() {
        super();
        // TODO Auto-generated constructor stub
    }

   /**
    * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
    */
   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      // TODO Auto-generated method stub
      // 요청, 응답 인코딩 설정
      request.setCharacterEncoding("utf-8");
      response.setContentType("text/html;charset=utf-8");
      response.setCharacterEncoding("utf-8");
      //
      //기능을 제공할 서비스 객체 생성
      memberDAO dao = new memberDAOImpl();
      //ServiceInterface service = new JoinServiceImpl();
      
      boolean flag = false;
      boolean flag2 = false;//홍석추가
      // 세션 생성
      HttpSession session = request.getSession();
      
      
      // 로그인에 필요한 요청 파라메터를 읽는다.
      String id = request.getParameter("id");
      String pwd = request.getParameter("pwd");
      
      //System.out.println(id); // test
      //System.out.println(pwd); // test
      
      // id로 멤버 검색
      memberVO m = dao.select(id);
      
      //System.out.println(m); // test
      
      // id가 동일한 멤버가 있고 비밀번호도 동일하면 로그인 성공
      if (m!=null && pwd.equals(m.getPassword())) {
         // 로그인 성공한 id를 세션에 저장
    	 String cls = m.getCls();
         session.setAttribute("id", id);
         session.setAttribute("cls", cls);
         // 로그인 성공 체크
         flag = true;
         flag2 = true; //홍석추가
         // 상태 변경
         dao.update_status("온라인", id); // 온라인으로 상태 변경
      }
      
      session.setAttribute("flag",flag); // 로그인 성공 여부 저장
      request.setAttribute("flag2", flag2); //홍석 추가
      String path = "/view/Login.jsp"; // 로그인 실패 시 로그인 창으로
      
      if (flag) { // 로그인 성공 시  main으로
    	  path = "/view/main.jsp";
      }
      RequestDispatcher dispatcher = request.getRequestDispatcher(path);
      
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