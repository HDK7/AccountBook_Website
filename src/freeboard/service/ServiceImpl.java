package freeboard.service;

import java.util.ArrayList;
import java.util.List;

import freeboard.dao.Dao_impl;
import model.BoardVO;
import model.LikeVO;


public class ServiceImpl implements nService{

	private Dao_impl dao;
	
	public  ServiceImpl() {
		dao=new Dao_impl();
	}


	@Override
	public void recupdate(int num) {
		dao.recupdate(num);
		
	}



	@Override
	public void countupdate(BoardVO b) {
		dao.countupdate(b);
		
	}



	@Override
	public void writerBoard(BoardVO b) {
		
		dao.insert(b);
	}

	@Override
	public BoardVO getBoard(int num) {
		return dao.select(num);
		
	}

	@Override
	public List getAll() {
		// TODO Auto-generated method stub
		return dao.selectAll();
	}

	@Override
	public void editBoard(BoardVO b) {
		dao.update(b);
		
	}

	@Override
	public void delBoard(int num) {
		dao.delete(num);
		
	}


	@Override
	public void like(String id, int num) {
		dao.like(id,num);
		
	}





	
	


	

}
