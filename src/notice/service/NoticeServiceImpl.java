package notice.service;

import java.util.ArrayList;
import java.util.List;

import freeboard.dao.Dao_impl;
import model.BoardVO;
import notice.dao.NoticeDao_impl;


public class NoticeServiceImpl implements NoticeService{

	private NoticeDao_impl dao;
	public  NoticeServiceImpl() {
		dao=new NoticeDao_impl();
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


}
