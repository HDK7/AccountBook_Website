package household.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import household.dao.hhDao;
import model.hhVO;

/**
 * Servlet implementation class hhSelectMonthController2
 */
@WebServlet("/hhSelectMonthController2")
public class hhSelectMonthController2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public hhSelectMonthController2() {
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
		
		ArrayList<hhVO> h = new ArrayList<hhVO>();		
		HttpSession session = request.getSession();		
		hhDao dao = new hhDao();
		
		h = dao.select((String) session.getAttribute("id")); // 자신의 아이디에 대한 가계부만 확인		
		
		ArrayList<hhVO> m = new ArrayList<hhVO>();		
						
		if(h.size() != 0) {
			m.add(h.get(0));
			m.get(0).setContent(m.get(0).getDate().substring(5,7)); //월로사용
			m.get(0).setDate(m.get(0).getDate().substring(0,4)); // 연도		
			if(m.get(0).getType() == 3){
				m.get(0).setKey(0);
			}
			else {
				m.get(0).setKey(1);
			}
		}
		
		int i = 0;		
		for(int j = 1; j < h.size(); j ++) {
			if(h.get(j).getDate().substring(0, 4).equals(m.get(i).getDate())
			&& h.get(j).getDate().substring(5,7).equals(m.get(i).getContent())) {
				if(h.get(j).getType() != 3) {
				m.get(i).setKey(m.get(i).getKey() + 1);
				continue;
				}
			}
			
			else {
				m.add(h.get(j));		
				i++;				
				m.get(i).setContent(m.get(i).getDate().substring(5,7)); //월로사용
				m.get(i).setDate(m.get(i).getDate().substring(0,4)); // 연도설정		
				if(h.get(j).getType() != 3) {
					m.get(i).setKey(1);
				}
				else {
					m.get(i).setKey(0);
				}
			}
		}	
		
		
		request.setAttribute("m", m);		
		
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("/household/HouseholdMonthView2_designTest.jsp");
		
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
