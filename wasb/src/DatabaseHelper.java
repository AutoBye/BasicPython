import java.sql.*;
import java.util.*;

public class DatabaseHelper {
    private static final String URL = "jdbc:mysql://localhost:3306/ott_data"; // 데이터베이스 URL
    private static final String USER = "root"; // 데이터베이스 사용자 이름
    private static final String PASSWORD = "root"; // 데이터베이스 비밀번호

    public static Connection getConnection() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            // 시간대를 UTC 또는 필요한 시간대로 설정
            String dbUrl = URL + "?serverTimezone=UTC";
            return DriverManager.getConnection(dbUrl, USER, PASSWORD);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    // 테스트용 샘플 쿼리 실행 메소드
    public static List<Map<String, Object>> runSampleQuery() {
        List<Map<String, Object>> results = new ArrayList<>();
        try (Connection conn = getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery("SELECT * FROM netflix_title")) { // 쿼리

            while (rs.next()) {
                // 결과 처리
                Map<String, Object> row = new HashMap<>();
                //row.put("title", rs.getString("title")); // 예: 'title' 열 사용
                row.put("title", rs.getString("kr_title")); // 예: 'title' 열 사용
                // 필요한 다른 열도 여기에 추가
                results.add(row);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return results;
    }

    //넷플릭스에서 검색
    public static boolean netFlixSearch(String query) {
        try (Connection conn = getConnection()) {
            String sql = "SELECT COUNT(*) FROM netflix_title WHERE kr_title LIKE ?";
            try (PreparedStatement stmt = Objects.requireNonNull(conn).prepareStatement(sql)) {
                stmt.setString(1, "%" + query + "%"); // '%'를 사용하여 부분 일치 검색
                try (ResultSet rs = stmt.executeQuery()) {
                    if (rs.next()) {
                        int count = rs.getInt(1);
                        return count > 0; // 결과의 개수가 1 이상이면 true, 아니면 false
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false; // 예외가 발생하면 false 반환
    }

    //디즈니에서 검색
    public static boolean disneySearch(String query) {
        try (Connection conn = getConnection()) {
            String sql = "SELECT COUNT(*) FROM disney_title WHERE title LIKE ?";
            try (PreparedStatement stmt = Objects.requireNonNull(conn).prepareStatement(sql)) {
                stmt.setString(1, "%" + query + "%"); // '%'를 사용하여 부분 일치 검색
                try (ResultSet rs = stmt.executeQuery()) {
                    if (rs.next()) {
                        int count = rs.getInt(1);
                        return count > 0; // 결과의 개수가 1 이상이면 true, 아니면 false
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false; // 예외가 발생하면 false 반환
    }

    //티빙에서 검색
    public static boolean tvingSearch(String query) {
        try (Connection conn = getConnection()) {
            String sql = "SELECT COUNT(*) FROM tving_title WHERE title LIKE ?";
            try (PreparedStatement stmt = Objects.requireNonNull(conn).prepareStatement(sql)) {
                stmt.setString(1, "%" + query + "%"); // '%'를 사용하여 부분 일치 검색
                try (ResultSet rs = stmt.executeQuery()) {
                    if (rs.next()) {
                        int count = rs.getInt(1);
                        return count > 0; // 결과의 개수가 1 이상이면 true, 아니면 false
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false; // 예외가 발생하면 false 반환
    }

    //왓차에서 검색
    public static boolean watchSearch(String query) {
        try (Connection conn = getConnection()) {
            String sql = "SELECT COUNT(*) FROM watcha_title WHERE title LIKE ?";
            try (PreparedStatement stmt = Objects.requireNonNull(conn).prepareStatement(sql)) {
                stmt.setString(1, "%" + query + "%"); // '%'를 사용하여 부분 일치 검색
                try (ResultSet rs = stmt.executeQuery()) {
                    if (rs.next()) {
                        int count = rs.getInt(1);
                        return count > 0; // 결과의 개수가 1 이상이면 true, 아니면 false
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false; // 예외가 발생하면 false 반환
    }


}
