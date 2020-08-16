package freeboard.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.BoardReplyVO;
import model.BoardVO;
import reply.dao.Dao;
import freeboard.service.ServiceImpl;
import freeboard.service.nService;


/**
 * Servlet implementation class ListController
 */
@WebServlet("/FreeListController")
public class FreeListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FreeListController() {
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
		
		nService service= new ServiceImpl();
		Dao dao= new Dao();
		ArrayList<BoardVO> temp=(ArrayList<BoardVO>)service.getAll();//총갯수 데이터
		
		ArrayList<BoardReplyVO> list=(ArrayList<BoardReplyVO>)dao.count();
		
		//(추가)
		
		/*\\
		int pagenum=1;
		pagenum=Integer.parseInt(request.getParameter("pagenum")); // 페이징 넘버
		int totalpage = 0;

		int page = 10 * (pagenum - 1); //페이징당 시작 글 넘버
		int last=page +10; //페이지당 마지막글 넘버
		if(page + 10 > temp.size()) {
			last = temp.size();
		}
		for(int i=page;i<last;i++) {
			list1.add(temp.get(i));
		}
			
		if(temp.size() %10 ==0){
			totalpage=temp.size()/10; // 페이징에 보여질 최대 숫자
		}
		else{
			totalpage=temp.size()/10+1;
		}
		*/
		request.setAttribute("list1", temp);
		request.setAttribute("list", list);
		
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("Board/List_free_designTest.jsp");
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
