package household.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import conn.DBConnect;
import model.hhYearVO;

	public class hhYearDao {
		private DBConnect db;
		
		public hhYearDao(){
			db = DBConnect.getInstance();
		}
		
		public ArrayList<hhYearVO> select_by_id(String id,String year,int type) {
			Connection conn = null;
			PreparedStatement pstmt = null;		
			ResultSet rs = null;
			ArrayList<hhYearVO> result = new ArrayList<hhYearVO>(); // 결과를 저장할 어레이리스트
			
			try {			
				conn = db.getConnection();
				// 서브쿼리 : 아이디, 타입(지출,수입), 연도   // 메인쿼리 : 오려낸 데이터에서 월별로 group by하여 수입,지출 통계를 구한다.(월 오름차순)
				String sql = "select substr(w_date,6,2), sum(price) from (select * from household where id=? and type = ? and w_date like ?) group by substr(w_date,6,2) order by substr(w_date,6,2) asc";
				pstmt = conn.prepareStatement(sql);
				
				//pstmt.setString(1, id); 
				pstmt.setString(1, id);
				pstmt.setInt(2,type);
				pstmt.setString(3, year+"%");
				
				rs = pstmt.executeQuery();
				
				while(rs.next()) {
					//System.out.println(rs.getString(1));
					//System.out.println(rs.getInt(2));
					result.add(new hhYearVO(rs.getString(1),rs.getInt(2))); // 월, 월수입 or 월지출 형태로 저장
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
			}
			return result;
		}
}
