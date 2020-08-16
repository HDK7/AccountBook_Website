package household.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Calendar;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import household.dao.hhYearDao;
import model.hhYearVO;

/**
 * Servlet implementation class householdYearGraphController
 */
@WebServlet("/householdYearGraphController")
public class householdYearGraphController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public householdYearGraphController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		hhYearDao dao = new hhYearDao();
		
		HttpSession session = request.getSession();
		
		//System.out.println(session.getAttribute("id"));
		//System.out.println((String)session.getAttribute("id"));
		String id = request.getParameter("id");
		
		Calendar cal = Calendar.getInstance();
		
		String year =  Integer.toString(cal.get(Calendar.YEAR));
		
		//System.out.println(id);
		//System.out.println(year);
		
		ArrayList<hhYearVO> res = new ArrayList<hhYearVO>();
		
		int type = Integer.parseInt(request.getParameter("type")); // 넘겨줄 때 type값 읽어서 넘긴다.(수입:1, 지출 :0)
		//int type = 1;
		
		/*
		System.out.println("----");
		System.out.println(id); // 이 부분이 안읽힌다.
		System.out.println(year);
		System.out.println(type);
		System.out.println("----");
		*/
		
		res = dao.select_by_id(id,year,type);// 아이디에 대한 정보를 (월) (지출or수입의 합) 형태로 출력 (hhYearVO 객체로 저장)
		
		/*
		for (hhYearVO one:res) {
			System.out.println(one);
		}
		*/
		request.setAttribute("res", res);
		request.setAttribute("type", Integer.toString(type));
		request.setAttribute("id", id);
		
		/*
		for (hhYearVO one:res) {
			System.out.println(one);
		}
		*/
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("/household/HouseholdGraphView1.jsp");
		
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
