package notice.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.BoardVO;
import notice.service.NoticeService;
import notice.service.NoticeServiceImpl;

/**
 * Servlet implementation class MainNoticeListController
 */
@WebServlet("/MainNoticeListController")
public class MainNoticeListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MainNoticeListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		NoticeService service= new NoticeServiceImpl();
		ArrayList<BoardVO> temp= (ArrayList<BoardVO>) service.getAll();// 모든 공지사항
		
		ArrayList<BoardVO> list = new ArrayList<BoardVO>(); // 메인에 표시할 공지사항을 담는 arraylist
		
		int cnt = 0;
		
		for (BoardVO one:temp) {
			cnt += 1;
			list.add(one);
			if (cnt==3) { // 3개만 뜨게함 (메인)
				break;
			}
		}
		
		/*
		for (BoardVO one:list) {
			System.out.println(one);
		}
		*/
		
		request.setAttribute("notice", list); // 3개의 공지사항을 저장한 arraylist를 request에 저장
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("/view/Main_notice.jsp");
		
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
