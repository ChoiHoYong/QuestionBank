package back;

import java.io.File;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import jxl.Sheet;
import jxl.Workbook;

public class Import_java {

	public static void main(String[] args) {
	}
	
	// DBConnection
	public static PreparedStatement DBConnection(){
		String url = "jdbc:mariadb://localhost:3306/test";
		String uid = "root";
		String upw = "1q2w3e4r!";

		Connection con = null;
		PreparedStatement pstmt = null;

		String sql = "INSERT INTO test_table(num, mq1, mq2, ua1, ua2, ua3, ua4, a) "
				+ "VALUES(null, ?, ?, ?, ?, ?, ?, ?)";

		String diver = "org.mariadb.jdbc.Driver";

		try {

			Class.forName(diver);

			con = DriverManager.getConnection(url, uid, upw);

			pstmt = con.prepareStatement(sql);
					
		}catch (SQLException e) {
			System.out.println(e.getMessage());
		} catch (ClassNotFoundException e) {
			System.out.println(e.getMessage());
		}	
		return pstmt;
	}
	
	// insertFile
	public static void insertFile(int[][] arr_int) {		
		PreparedStatement pstmt = DBConnection();
		try {
			// 배열 넣기
			for (int i = 0; i < arr_int.length; i++) {
				// 데이터 없으면 그만
				if (arr_int[i][1] == 0 && arr_int[i][2] == 0) {
					break;
				}
				for(int j = 1; j <= 7; j++) {
					pstmt.setInt(j, arr_int[i][j]);
				}				
				pstmt.executeUpdate();
			}
			pstmt.close();
			
		} catch (Exception e) {
			System.out.println(e.getMessage()); 
		} 		
	}			
		
	// getFile
	public static int[][] getFile(String file_path) {
		File file = new File(file_path);

		int[][] insert_xls = new int[100][8];

		try {
			// xls 가져오기
			Workbook workbook = Workbook.getWorkbook(file);

			Sheet sheet = workbook.getSheet(0);

			int endIdx = sheet.getColumn(1).length - 1;
			
			// cell 읽어서 배열에 입력
			for (int i = 0; i <= endIdx; i++) {
				for (int j = 0; j < 7; j++) {
					insert_xls[i][j + 1] = Integer.parseInt(sheet.getCell(j, i).getContents());
				}
			}			
		} catch (Exception e) {
			System.out.println(e);
		} 	
		
		// file delete
		file.delete();
		
		// 입력받은 배열 리턴
		return insert_xls;
	}
}
