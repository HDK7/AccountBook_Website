package notice.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sound.midi.Sequence;

import model.BoardVO;
import notice.service.NoticeService;
import notice.service.NoticeServiceImpl;
import freeboard.service.ServiceImpl;
import freeboard.service.nService;


/**
 * Servlet implementation class ReadController
 */
@WebServlet("/ReadNoticeController")
public class ReadNoticeController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReadNoticeController() {
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
		int seq =Integer.parseInt(request.getParameter("seq"));
		
		BoardVO b=service.getBoard(seq);
		service.countupdate(b);
		b.setViewcount(b.getViewcount()+1);
		request.setAttribute("b", b);
		RequestDispatcher dispatcher = request.getRequestDispatcher("/notice/contents_notice.jsp");
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
