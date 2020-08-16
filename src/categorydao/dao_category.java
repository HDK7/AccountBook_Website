package categorydao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import conn.DBConnect;
import model.categoryVO;
import model.hhVO;

public class dao_category {
	private DBConnect db;
	public dao_category(){
		db = DBConnect.getInstance();
	}
	
	public ArrayList<categoryVO> category(String id, String category) {
		
		Connection conn = null;
		PreparedStatement pstmt = null;		
		ResultSet rs = null;
		ArrayList<categoryVO> result =new ArrayList<categoryVO>();
		try {			
			conn = db.getConnection();
			String sql ="select category, substr(w_date,1,7), sum(price) from household where id=? and category=? group by category, substr(w_date,1,7) order by substr(w_date,1,7)";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, id); 
			pstmt.setString(2, category); 
					
			rs= pstmt.executeQuery();
			
			while(rs.next()) {
				result.add(new categoryVO(rs.getString("category"),rs.getString("substr(w_date,1,7)"),rs.getInt("sum(price)")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null) {
					rs.close();
				}
				pstmt.close();
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}		return result;
	}
	
	public ArrayList<String> CGlist(String id) {
		
		Connection conn = null;
		PreparedStatement pstmt = null;		
		ResultSet rs = null;
		ArrayList<String> result =new ArrayList<String>();
		try {			
			conn = db.getConnection();
			String sql = "select category from household where id=? group by category order by category";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, id); 		
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				result.add(new String(rs.getString("category")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {

				pstmt.close();
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}		return result;
	}

}
