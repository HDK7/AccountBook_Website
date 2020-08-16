package freeboard.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.BoardVO;
import model.LikeVO;
import freeboard.dao.Dao;
import freeboard.dao.Dao_impl;
import freeboard.service.ServiceImpl;
import freeboard.service.nService;


/**
 * Servlet implementation class ReadController
 */
@WebServlet("/ReadController")
public class ReadController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReadController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		HttpSession session=request.getSession();
		Dao dao=new Dao_impl();
		nService service =new ServiceImpl();
		int seq =Integer.parseInt(request.getParameter("seq"));
		String id=(String)session.getAttribute("id");
		
		BoardVO b=service.getBoard(seq);
		service.countupdate(b); //조회수 +1
		LikeVO like =dao.likeselect(id,seq); //로그인된 아이디와 들어간 글번호에 해당하는 데이터 가져오기
		request.setAttribute("like", like); //컨텐츠로 받은 데이터 보내기
		
		b.setViewcount(b.getViewcount()+1);
		request.setAttribute("b", b);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("/Board/Contents_designTest.jsp");
		
		
		if(dispatcher != null) {
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
