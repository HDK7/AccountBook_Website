package member.controller;

import java.io.IOException;
import java.util.Calendar;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.dao.memberDAO;
import member.dao.memberDAOImpl;

/**
 * Servlet implementation class MemberAttendanceController
 */
@WebServlet("/MemberAttendanceController")
public class MemberAttendanceController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberAttendanceController() {
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
		
		Calendar cal = Calendar.getInstance();
		//현재 년도, 월, 일
		int year = cal.get ( cal.YEAR );
		int month = cal.get ( cal.MONTH ) + 1 ;
		int date = cal.get ( cal.DATE ) ;
		//System.out.println(year);
		//System.out.println(month);
		//System.out.println(date);
		//setLPad( strContext, 10, "*" );
		String s_year =  Integer.toString(year);
		String s_month = Integer.toString(month);
		String s_date =  Integer.toString(date);
		
		s_year = s_year.substring(2,4);	// 년도 뒤의 두자리만 고려한다. 어차피 sysdate를 사용하기에 1900년도는 고려할필요 없음
		if (s_month.length()==1) {
			s_month = "0" + s_month;
		}
		if (s_date.length()==1) {
			s_date = "0" + s_date;
		}
		String d_result = s_year+"/"+s_month+"/"+s_date;
		//System.out.println(d_result);
		
		
		memberDAO dao = new memberDAOImpl();
		
		HttpSession session = request.getSession();
		
		String id = (String) session.getAttribute("id");
		
		//임시값설정
		//String id = "dolly0920";
		
		boolean Attendance_flag = dao.select_attendance(id,d_result); // 이미 출석했는지 안했는지 파악
		
		//System.out.println(d_result);
		//System.out.println(Attendance_flag);
		
		if (Attendance_flag) { // 이미 출석한 경우
			request.setAttribute("Attendance_flag", Attendance_flag); // 출석한 경우 true
		} else { // 출석하지 않은 경우
			request.setAttribute("Attendance_flag", Attendance_flag); // 아직안한 경우 false
			dao.check_attendance(id,d_result);
			dao.update_attendance_score(id); // 해당 아이디의 점수 update
			// 점수 추가 sql써야함.
		}
		
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("/view/Attendance.jsp");
		
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
