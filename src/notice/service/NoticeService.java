package notice.service;

import java.util.ArrayList;
import java.util.List;

import model.BoardVO;


public interface NoticeService {
	void writerBoard(BoardVO b); //글작성
	BoardVO getBoard(int num); //글검색
	List getAll();   //글전체 검색
	void editBoard(BoardVO b); //글수정
	void delBoard(int num); //글삭제
	void countupdate(BoardVO b); //조회수 +1 하기
	void recupdate(int num); //추천 +1 하기
	
}
