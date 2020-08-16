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
import model.ChartData;

/**
 * Servlet implementation class hhGetGraphData
 */
@WebServlet("/hhGetGraphData")
public class hhGetGraphData extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public hhGetGraphData() {
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

		HttpSession session = request.getSession();
		ArrayList<ChartData> in = new ArrayList<ChartData>();
		ArrayList<ChartData> out = new ArrayList<ChartData>();
		ArrayList<String> incolors = new ArrayList<String>();
		ArrayList<String> outcolors = new ArrayList<String>();
		
		hhDao dao = new hhDao();
		
		String year = request.getParameter("year");
		String month = request.getParameter("month");
		String color[] = {"#E6E6FA","#AFEEEE", "#FFE4E1", "#FFE4C4",  "#98FB98",  "#FFD700", "#90EE90", "#B0E0E6", "#FFC0CB", "#F0F8FF" };		
		
		in = dao.selectcategory((String)session.getAttribute("id"), year + "-" + month, 1);
		//in = dao.selectcategory("abc", "2020-08", 0); //test
		out = dao.selectcategory((String)session.getAttribute("id"), year + "-" + month, 0);
		//out = dao.selectcategory("abc", "2020-08", 1);
		//추가
		ChartData insum = new ChartData(0,"총계");
		ChartData outsum = new ChartData(0,"총계");
		
		for(int i = 0; i < in.size(); i ++) {
			incolors.add(color[i % color.length]);
			insum.setPrice(insum.getPrice()+in.get(i).getPrice());
		}
		
		for(int i = 0; i < out.size(); i ++) {
			outcolors.add(color[i % color.length]);
			outsum.setPrice(outsum.getPrice()+out.get(i).getPrice());
		}
		
		request.setAttribute("insum", insum);
		request.setAttribute("outsum", outsum);
		request.setAttribute("in", in);
		request.setAttribute("out", out);
		request.setAttribute("incolors", incolors);
		request.setAttribute("outcolors", outcolors);
		request.setAttribute("year", year);
		request.setAttribute("month", month);
						
		RequestDispatcher dispatcher = request.getRequestDispatcher("/household/HouseholdanalyticsView_designTest.jsp");
		
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
