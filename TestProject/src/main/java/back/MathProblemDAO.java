package back;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

public class MathProblemDAO {
	private String url = "jdbc:mariadb://localhost:3306/test";
	private String uid = "TEST";
	private String upw = "1q2w3e4r!";
	
	public MathProblemDAO() {
		try {
			Class.forName("org.mariadb.jdbc.Driver");
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public ArrayList<MathProblemDTO> memberSelect(){
		
		ArrayList<MathProblemDTO> dtos = new ArrayList<MathProblemDTO>();
		
		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		
		try {
			con = DriverManager.getConnection(url, uid, upw);
			stmt = con.createStatement();
			
			// 전체 데이터 검색 쿼리
			rs = stmt.executeQuery("select * from test_table");
			
			// 전체 데이터 저장
			while(rs.next()) {
				int id = rs.getInt("num");
				int problem1 = rs.getInt("mq1");
				int problem2 = rs.getInt("mq2");
				int no1 = rs.getInt("ua1");
				int no2 = rs.getInt("ua2");
				int no3 = rs.getInt("ua3");
				int no4 = rs.getInt("ua4");
				int answer = rs.getInt("a");
				
				MathProblemDTO dto = new MathProblemDTO(id, problem1, problem2, no1, no2, no3, no4, answer);
				dtos.add(dto);
			}
		} catch(Exception e) {
			System.out.println(e);
		} finally {
			try {
				if(rs != null) rs.close();
				if(stmt != null) stmt.close();
				if(con != null) con.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		return dtos;
	}
}
