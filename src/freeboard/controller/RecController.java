package freeboard.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sun.xml.internal.ws.wsdl.writer.document.Service;

import freeboard.dao.Dao;
import freeboard.dao.Dao_impl;
import freeboard.service.ServiceImpl;
import freeboard.service.nService;
import model.LikeVO;

/**
 * Servlet implementation class RecController
 */
@WebServlet("/RecController")
public class RecController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RecController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		response.setCharacterEncoding("utf-8");
		HttpSession session=request.getSession();
		Dao dao=new Dao_impl();
		
		int num=Integer.parseInt(request.getParameter("sequence"));
		String id=(String)session.getAttribute("id");
		
		nService service=new ServiceImpl();
		LikeVO like =dao.likeselect(id,num); //like 테이블 불러오기
		
		//System.out.println(like.getSequence());
		if(like != null) { 			//좋아요를 눌렀다면 likey에서 삭제하고 추천카운트 -1
			dao.likedelete(id,num); //테이블에서 삭제
			dao.recdelete(num); //추천 카운트 -1
			request.setAttribute("like", like.getLike());
		}
		//if(like.getId() ==null)
		else { //좋아요를 안눌렀다면 likey에 추가와 추천 카운트 +1
			dao.like(id, num); //테이블에서 추가
			dao.recupdate(num); //추천카운트 +1
			
		}
		
		response.sendRedirect(request.getHeader("referer"));
		//RequestDispatcher dispatcher = request.getRequestDispatcher(request.getHeader("referer"));
		//if(dispatcher != null) {
		//dispatcher.forward(request, response);
		//}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
