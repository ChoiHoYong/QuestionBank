package back;

import java.sql.PreparedStatement;
import java.util.Random;

public class Insert_rand {
	public static void main(String[] args) {
		// 매개변수는 생성 수
		insertData(1);	
	}
	
	public static void insertData(int count) {		
		Random random = new Random();

		try {			
			PreparedStatement pstmt = Import_java.DBConnection();
			
			for (int i = 0; i < count; i++) {
				
				// 문제에 대한 난수 지정
				int a = random.nextInt(400) + 1;
				int b = random.nextInt(400) + 1;

				// 정답 위치 판단 - 1번 ~ 4번
				int num = random.nextInt(4);
				
				// mq1, mq2 set
				pstmt.setInt(1, a + 1);
				pstmt.setInt(2, b + 1);
				
				// ua1 ~ ua4, a set
				for (int j = 0; j < 4; j++) {
					if (j == num) {						
						// 정답 ua
						pstmt.setInt(j + 3, (a + b) + 2);
						
						// 정답과 비교할 a
						pstmt.setInt(7, (a + b) + 2);
						
					// 나머지 ua
					} else {
						pstmt.setInt(j + 3, (random.nextInt(800)));
					}
				}
				pstmt.executeUpdate();
			}
			pstmt.close();

		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
	}
}
