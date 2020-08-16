package notice.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sun.xml.internal.ws.wsdl.writer.document.Service;

import freeboard.service.ServiceImpl;
import freeboard.service.nService;
import notice.service.NoticeService;
import notice.service.NoticeServiceImpl;

/**
 * Servlet implementation class RecController
 */
@WebServlet("/RecNoticeController")
public class RecNoticeController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RecNoticeController() {
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
		int num=Integer.parseInt(request.getParameter("sequence"));
		service.recupdate(num);
		
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("/notice/List_notice.jsp?pagenum=1");
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
