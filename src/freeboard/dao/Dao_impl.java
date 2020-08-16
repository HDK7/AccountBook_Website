package freeboard.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import conn.DBConnect;
import model.BoardVO;
import model.LikeVO;



public class Dao_impl implements Dao {
	private DBConnect db;
	public Dao_impl(){
		db=DBConnect.getInstance();
	}
	
	@Override
	public void recupdate(int num) {
Connection conn=null;
		
		String sql="update free_board set recommend_cnt=recommend_cnt+1 where seq=?";
		PreparedStatement pstmt =null;
	
		try {
			conn =db.getConnection();
			pstmt= conn.prepareStatement(sql);
			
			pstmt.setInt(1, num);
			
			pstmt.executeUpdate();
			
		}catch(SQLException e) {
			e.printStackTrace();
			
		} finally {
			try {
				pstmt.close();
			}catch (SQLException e) {
				e.printStackTrace();
				// TODO: handle exception
			}
		
	}
		
	}

	public void recdelete(int num) {
		Connection conn=null;
				
				String sql="update free_board set recommend_cnt=recommend_cnt-1 where seq=?";
				PreparedStatement pstmt =null;
			
				try {
					conn =db.getConnection();
					pstmt= conn.prepareStatement(sql);
					
					pstmt.setInt(1, num);
					
					pstmt.executeUpdate();
					
				}catch(SQLException e) {
					e.printStackTrace();
					
				} finally {
					try {
						pstmt.close();
					}catch (SQLException e) {
						e.printStackTrace();
						// TODO: handle exception
					}
				
			}
				
			}
	@Override
	public void insert(BoardVO b) {
		Connection conn=null;
		
		String sql="insert into free_board values(seq_board.nextval,?,?,?,sysdate,0,0)";
		PreparedStatement pstmt =null;
		
		try {
			conn =db.getConnection();
			pstmt= conn.prepareStatement(sql);
			
			pstmt.setString(1, b.getTitle());
			pstmt.setString(2, b.getWriter());
			pstmt.setString(3, b.getContent());
			
			pstmt.executeUpdate();
			
		}catch(SQLException e) {
			e.printStackTrace();
			
		} finally {
			try {
				pstmt.close();
			}catch (SQLException e) {
				e.printStackTrace();
				// TODO: handle exception
			}
		}
	}	
		
	
	@Override
	public BoardVO select(int sequence) {
		Connection conn=null;
		ResultSet rs=null;
		BoardVO b=null;
		String sql="select * from free_board where seq=? order by seq desc";
		PreparedStatement pstmt =null;
		
		try {
			conn =db.getConnection();
			pstmt= conn.prepareStatement(sql);
			
			pstmt.setInt(1, sequence);
			
			rs=pstmt.executeQuery();
			if(rs.next()) {
				return new BoardVO(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5),rs.getInt(6),rs.getInt(7));
			}
			
		}catch(SQLException e) {
			e.printStackTrace();
			
		} finally {
			try {
				pstmt.close();
			}catch (SQLException e) {
				e.printStackTrace();
				// TODO: handle exception
			}
		}
		return null;
	}
	@Override
	public List selectAll() {
		Connection conn=null;
		ResultSet rs=null;
		ArrayList<BoardVO> list = new ArrayList<BoardVO>();
		String sql="select * from free_board order by seq desc";
		PreparedStatement pstmt =null;
		
		try {
			conn =db.getConnection();
			pstmt= conn.prepareStatement(sql);
			
			rs=pstmt.executeQuery();
			while(rs.next()) {
				list.add(new BoardVO(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5),rs.getInt(6),rs.getInt(7)));
			}
			
		}catch(SQLException e) {
			e.printStackTrace();
			
		} finally {
			try {
				pstmt.close();
			}catch (SQLException e) {
				e.printStackTrace();
				// TODO: handle exception
			}
		}
		return list;
	}
	@Override
	public void update(BoardVO b) {
		Connection conn=null;
		
		String sql="update free_board set title=? ,contents=? ,time=sysdate where seq=?";
		PreparedStatement pstmt =null;
		
		try {
			conn =db.getConnection();
			pstmt= conn.prepareStatement(sql);
			
			pstmt.setString(1, b.getTitle());
			pstmt.setString(2, b.getContent());
			pstmt.setInt(3, b.getSequence());
			
			pstmt.executeUpdate();
			
		}catch(SQLException e) {
			e.printStackTrace();
			
		} finally {
			try {
				pstmt.close();
			}catch (SQLException e) {
				e.printStackTrace();
				// TODO: handle exception
			}
		}
		
	}
	@Override
	public void delete(int num) {
		Connection conn=null;
		String sql="delete free_board where seq=?";
		PreparedStatement pstmt =null;
		
		try {
			conn =db.getConnection();
			pstmt= conn.prepareStatement(sql);
			
			pstmt.setInt(1, num);
			
			
			pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
			
		} finally {
			try {
				pstmt.close();
			}catch (SQLException e) {
				e.printStackTrace();
				// TODO: handle exception
			}
		}
		
	}
	
	@Override
	public void countupdate(BoardVO b) {
		Connection conn=null;
		
		String sql="update free_board set viewcount=viewcount+1 where seq=?";
		PreparedStatement pstmt =null;
	
		try {
			conn =db.getConnection();
			pstmt= conn.prepareStatement(sql);
			
			pstmt.setInt(1, b.getSequence());
			
			pstmt.executeUpdate();
			
		}catch(SQLException e) {
			e.printStackTrace();
			
		} finally {
			try {
				pstmt.close();
			}catch (SQLException e) {
				e.printStackTrace();
				// TODO: handle exception
			}
		
	}
	}

	@Override
	public void like(String id, int sequence) {
		Connection conn=null;
		
		String sql="insert into likey values(?,?,?) ";
		PreparedStatement pstmt =null;
		
		try {
			conn =db.getConnection();
			pstmt= conn.prepareStatement(sql);
			
			pstmt.setString(1,id);
			pstmt.setInt(2,sequence);
			pstmt.setString(3,"false");
			
			pstmt.executeUpdate();
			
		}catch(SQLException e) {
			e.printStackTrace();
			
		} finally {
			try {
				pstmt.close();
			}catch (SQLException e) {
				e.printStackTrace();
				// TODO: handle exception
			}
		
	}
		
	}

	public void likedelete(String id,int sequence) {
		Connection conn=null;
		
		String sql="delete likey where id=? and seq=? ";
		PreparedStatement pstmt =null;
		
		try {
			conn =db.getConnection();
			pstmt= conn.prepareStatement(sql);
			
			
			pstmt.setString(1, id);
			pstmt.setInt(2,sequence);
			
			pstmt.executeUpdate();
			
		}catch(SQLException e) {
			e.printStackTrace();
			
		} finally {
			try {
				pstmt.close();
			}catch (SQLException e) {
				e.printStackTrace();
				// TODO: handle exception
			}
		
	}
		
	}
	
	@Override
	public LikeVO likeselect(String id,int num) {
		Connection conn=null;
		ResultSet rs=null;
		BoardVO b=null;
		String sql="select * from likey where id=? and seq=?";
		PreparedStatement pstmt =null;
		
		try {
			conn =db.getConnection();
			pstmt= conn.prepareStatement(sql);
			
			pstmt.setString(1, id);
			pstmt.setInt(2, num);
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				return new LikeVO(rs.getString(1),rs.getInt(2),rs.getString(3));
			}
			
		}catch(SQLException e) {
			e.printStackTrace();
			
		} finally {
			try {
				pstmt.close();
			}catch (SQLException e) {
				e.printStackTrace();
				// TODO: handle exception
			}
		}
		return null;
	}

	
		
	}
	


