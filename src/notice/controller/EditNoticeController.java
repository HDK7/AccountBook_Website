package notice.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.BoardVO;
import notice.service.NoticeService;
import notice.service.NoticeServiceImpl;
import freeboard.service.ServiceImpl;
import freeboard.service.nService;

/**
 * Servlet implementation class EditBoardController
 */
@WebServlet("/EditNoticeController")
public class EditNoticeController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditNoticeController() {
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

		NoticeService service= new NoticeServiceImpl();
		int num=Integer.parseInt(request.getParameter("sequence"));
		String writer=request.getParameter("writer");
		String title= request.getParameter("title");
		String content = request.getParameter("content");
		BoardVO b=new BoardVO(num,title,writer,content,null,0,0);
	
		service.editBoard(b);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("/NoticeListController");
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
