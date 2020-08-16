package member.dao;

import java.util.ArrayList;

import model.memberVO;

public interface memberDAO {
	void insert(memberVO m);
	   
	memberVO select(String id);
	   
	void update(memberVO m);
	   
	void delete(String id);
	   
	void update_status(String s, String id);
	   
	ArrayList<memberVO> getAll();
	
	boolean select_attendance(String id, String date);
	
	void check_attendance(String id, String date);
	
	void update_pwd(String email, String pw);
	
	boolean select_email(String email); // 중복된 이메일 검색
	
	memberVO search_email(String email); // 이메일로 가입된 회원정보 검색
	
	ArrayList<String> select_forCalendar(String id); // 아이디로 출석정보 검색
	
	void update_attendance_score(String id); // 해당 아이디의 점수 + (출석점수 10점)
	
}
