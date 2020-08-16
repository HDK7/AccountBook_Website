package navernews.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONObject;

import model.newsVO;

/**
 * Servlet implementation class NaverNewsApiController
 */
@WebServlet("/NaverNewsApiController")
public class NaverNewsApiController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NaverNewsApiController() {
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
		
		PrintWriter out = response.getWriter();
		String clientId = "wpbgpDY3tJAXPm6Of7u_";//애플리케이션 클라이언트 아이디값";
        String clientSecret = "jjPHib2iww";//애플리케이션 클라이언트 시크릿값";
        try {
            String text = URLEncoder.encode("경제", "UTF-8"); //검색어";
            String apiURL = "https://openapi.naver.com/v1/search/news.json?query="+ text + "&display=10&start=1&sort=date"; // 뉴스의 json 결과
            //String apiURL = "https://openapi.naver.com/v1/search/news.xml?query="+ text; // 뉴스의 xml 결과 
            URL url = new URL(apiURL);
            HttpURLConnection con = (HttpURLConnection)url.openConnection();
            con.setRequestMethod("GET");
            con.setRequestProperty("X-Naver-Client-Id", clientId);
            con.setRequestProperty("X-Naver-Client-Secret", clientSecret);
            int responseCode = con.getResponseCode();
            BufferedReader br;
            if(responseCode==200) { // 정상 호출
                br = new BufferedReader(new InputStreamReader(con.getInputStream()));
            } else {  // 에러 발생
                br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
            }
            String inputLine;
            StringBuffer responseBuffer = new StringBuffer();
            while ((inputLine = br.readLine()) != null) {
                responseBuffer.append(inputLine);
            }
            br.close();
            //System.out.println(responseBuffer.toString());
            //out.println(responseBuffer.toString());
            
            ArrayList<newsVO> news = new ArrayList<newsVO>();
            
            JSONObject jObject = new JSONObject(responseBuffer.toString());
            
            JSONArray contents = jObject.getJSONArray("items"); // "items"의 value는 배열값이다. (각각의 기사들이 배열의 요소로 들어감)
            
     
            
            for (int i = 0; i < contents.length(); i++) {
            	JSONObject obj = contents.getJSONObject(i);	// obj에는 기사 하나(title,등)가 담긴다
            	//System.out.println(obj.toString());
            	//out.println(obj.toString()); // 출력확인
            	//out.println("-----------------");
            	
            	String originallink = obj.getString("originallink");
            	String link = obj.getString("link");
            	String description = obj.getString("description");
            	String title = obj.getString("title");
            	//System.out.println("*****");
            	//System.out.println(title);
            	//System.out.println("------");
            	title = title.replaceAll("<(/)?([a-zA-Z]*)(\\s[a-zA-Z]*=[^>]*)?(\\s)*(/)?>", ""); // 정규화식
            	title = title.replace("&quot;",""); // 추가한 식
            	//System.out.println(title);
            	if (title.length() > 25) {
            		title = title.substring(0,25) + "....";
            	}
            	String pubDate = obj.getString("pubDate").substring(0, 16); // 어차피 안씀
            	
            	//System.out.println(pubDate.substring(0,16));
            	
            	//out.println(link); 확인!
            	
            	news.add(new newsVO(originallink, link, description, title, pubDate));
            }
            
            request.setAttribute("news", news); // ArrayList형태로 news로 저장
            
            RequestDispatcher dispatcher = request.getRequestDispatcher("/view/newsForm.jsp");
            
            if (dispatcher != null) {
            	dispatcher.forward(request, response);
            }
            //out.println(contents.toString());
        } catch (Exception e) {
            System.out.println(e);
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
