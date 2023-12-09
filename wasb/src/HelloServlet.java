import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.io.PrintWriter;


public class HelloServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 응답의 Content-Type을 설정
        response.setContentType("text/html");
        response.setCharacterEncoding("UTF-8");
        // PrintWriter를 사용하여 응답 데이터를 출력
        PrintWriter out = response.getWriter();
        out.println("<html>");
        out.println("<head><title>팀 정보</title></head>");
        out.println("<body>");
        out.println("<h1>Basic Python 팀 정보</h1>");
        out.println("<p>팀장 : 권영건</p>");
        out.println("<p>팀원 : 김세훈, 김형섭, 함성원</p>");
        out.println("OTT 추천 알고리즘 / 웹");
        out.println("</body>");
        out.println("</html>");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
