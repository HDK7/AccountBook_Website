package member.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;

import member.dao.memberDAO;
import member.dao.memberDAOImpl;

/**
 * Servlet implementation class AttendanceCalendarController
 */
@WebServlet("/AttendanceCalendarController")
public class AttendanceCalendarController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AttendanceCalendarController() {
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
		
		// request.setAttribute로 출력값 저장해야함
		
		ArrayList<String> a_date = new ArrayList<String>(); // 결과값 저장할 공간
		
		memberDAO dao = new memberDAOImpl();
		
		HttpSession session = request.getSession();
		
		//String id = "dolly0920"; // 임시데이터 추가
		String id = (String) session.getAttribute("id");
		JSONObject jsonObject = new JSONObject();
		
		a_date = dao.select_forCalendar(id); // 여기서 String으로 데이터값을 받는다면?
		
		int i = 0;
		for (String one:a_date) {
			String key_name = "data"+ Integer.toString(i);
			//System.out.println(key_name);
			//System.out.println(one);
			jsonObject.put(key_name,one);
			i += 1;
		}
		
		//System.out.println(jsonObject); //여기까지 확인
		
		String test = "abcd";
		
		request.setAttribute("cresult", a_date);
		//request.setAttribute("abcd", test);
		
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("/view/calendar.jsp");
		
		if (dispatcher!=null) {
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
