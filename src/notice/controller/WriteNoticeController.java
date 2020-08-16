package notice.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import freeboard.dao.Dao_impl;
import model.BoardVO;
import notice.service.NoticeService;
import notice.service.NoticeServiceImpl;
import sun.reflect.ReflectionFactory.GetReflectionFactoryAction;
import freeboard.service.ServiceImpl;
import freeboard.service.nService;

/**
 * Servlet implementation class WriteController_free
 */
@WebServlet("/WriteNoticeController")
public class WriteNoticeController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public WriteNoticeController() {
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
		NoticeService service= new NoticeServiceImpl();
		HttpSession session =request.getSession();
		
		String writer = (String)session.getAttribute("id");
		String title= request.getParameter("title");
		String content =request.getParameter("content");
		
		BoardVO b=new BoardVO();
		b.setTitle(title);
		b.setContent(content);
		b.setWriter(writer);
		
		service.writerBoard(b);
		response.sendRedirect("/Project_semi/NoticeListController");
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
