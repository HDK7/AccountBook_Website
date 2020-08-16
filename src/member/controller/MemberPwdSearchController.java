package member.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Properties;
import java.util.Random;

import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.dao.memberDAO;
import member.dao.memberDAOImpl;
import model.memberVO;

/**
 * Servlet implementation class MemberPwdSearchController
 */
@WebServlet("/MemberPwdSearchController")
public class MemberPwdSearchController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberPwdSearchController() {
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
		
		//String memberId = request.getParameter("memberId");

		// 먼저 아이디로 회원정보를 받아오고 가져온 데이터에서 email값을 비교하여 존재하지 않으면 인증메일 보내지 못함
		/*
		 * Member m = new MemberService().memberLogin(memberId); 
		 * if(m==null || !m.getEmail().equals(email)) { 
		 * req.setAttribute("msg","아이디나 이메일 정보가 맞지 않습니다"); 
		 * req.setAttribute("loc", "/member/searchPw");
		 * req.getRequestDispatcher("/views/common/msg.jsp").forward(req, resp); return;
		 * }
		 */
		
		PrintWriter out = response.getWriter();
		
		memberDAO dao = new memberDAOImpl();
		
		memberVO m = dao.select(request.getParameter("id")); // ajax로 넘길 때 ?id값입력해서 넘길것.
		
		if (m!=null) { // 아이디가 있다면
			// mail server 설정
			String host = "smtp.naver.com";
			String user = "kitriprojectjs@naver.com"; // 자신의 네이버 계정
			String password = "kitri1234@";// 자신의 네이버 패스워드

			String to_email = m.getEmail(); // 이메일 받을 주소

			// SMTP 서버 정보를 설정한다.
			Properties props = new Properties();
			props.put("mail.smtp.host", host);
			props.put("mail.smtp.port", 465);
			props.put("mail.smtp.auth", "true");
			props.put("mail.smtp.ssl.enable", "true");
			props.put("mail.smtp.starttls.enable", "true");
			props.put("mail.debug", "true");

			// 인증 번호 생성기
			StringBuffer temp = new StringBuffer();
			Random rnd = new Random();
			for (int i = 0; i < 10; i++) {
				int rIndex = rnd.nextInt(3);
				switch (rIndex) {
				case 0:
					// a-z
					temp.append((char) ((int) (rnd.nextInt(26)) + 97));
					break;
				case 1:
					// A-Z
					temp.append((char) ((int) (rnd.nextInt(26)) + 65));
					break;
				case 2:
					// 0-9
					temp.append((rnd.nextInt(10)));
					break;
				}
			}
			String AuthenticationKey = temp.toString();
			
			System.out.println(AuthenticationKey);

			Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
				protected PasswordAuthentication getPasswordAuthentication() {
					return new PasswordAuthentication(user, password);
				}
			});
			
			
			
			// email 전송
			try {
				MimeMessage msg = new MimeMessage(session);
				msg.setFrom(new InternetAddress(user, "KITRI"));
				msg.addRecipient(Message.RecipientType.TO, new InternetAddress(to_email));

				// 메일 제목
				msg.setSubject("안녕하세요  KITRI입니다. 임시 비밀번호를 발급하기 위한 인증키입니다.");
				// 메일 내용
				msg.setText("인증키는 :" + temp);

				Transport.send(msg);
				System.out.println("이메일 전송");
				

			} catch (Exception e) {
				e.printStackTrace();// TODO: handle exception
			}
			
			HttpSession saveKey = request.getSession();
			saveKey.setAttribute("AuthenticationKey", AuthenticationKey);
			
			String s_result = AuthenticationKey + " " + to_email;
			
			out.println(s_result); // 정상적으로 비밀번호찾기 메일을 보낸 경우 출력 버퍼에 0
		} else { // 아이디가 없다면
			out.println("1"); // 아이디가 없다면 출력 버퍼에 1
		}
		
		
		
		
		
		
		// 패스워드 바꿀때 뭘 바꿀지 조건에 들어가는 id
		/*
		 * req.setAttribute("id", memberId);
		 * req.getRequestDispatcher("/views/login_myPage/searchPasswordEnd.jsp").forward
		 * (req, resp);
		 */
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
