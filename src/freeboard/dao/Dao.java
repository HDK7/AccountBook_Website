package freeboard.dao;

import java.util.ArrayList;
import java.util.List;

import model.BoardVO;
import model.LikeVO;



public interface Dao {
	void insert(BoardVO b);
	BoardVO select(int num);
	List selectAll();
	void update(BoardVO b);
	void delete(int num);	
	void countupdate(BoardVO b); 
	void recupdate(int num);
	void recdelete(int num);
	void like(String id,int sequence);
	LikeVO likeselect(String id,int num);
	void likedelete(String id,int num);
	
}
