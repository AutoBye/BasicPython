import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class SearchServlet extends HttpServlet {

    public void init() {
        //System.out.println("init 호출?");
    }

    // 웹에서 GET 메소드로 정보 전달, 요청
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String query = request.getParameter("query"); // 쿼리 파라미터 추출
        int people = Integer.parseInt(request.getParameter("numberOfMembers"));
        // 데이터 처리 로직 (4개의 OTT 실행후 저장, True : 검색 결과 있음 , False : 없음)
        boolean netf = DatabaseHelper.netFlixSearch(query);
        boolean tvin = DatabaseHelper.tvingSearch(query);
        boolean disn = DatabaseHelper.disneySearch(query);
        boolean watc = DatabaseHelper.watchSearch(query);

        // 쿼리 실행 테스트용
        //List<Map<String, Object>> results = DatabaseHelper.runSampleQuery();


        int netflix, tving, disney, watcha = 0;

        // 인원수에 맞는 가격 데이터 설정
        switch (people) {
            case 1 :
                netflix = 5500;
                tving = 7900;
                disney = 9900;
                watcha = 7900;
                break;
            case 2:
                netflix = 13500;
                tving = 10900;
                disney = 9900;
                watcha = 12900;
                break;
            case 3:
            case 4:
                netflix = 17000;
                tving = 13900;
                disney = 13900;
                watcha = 12900;
                break;
            default:
                netflix = 99999;
                tving = 99999;
                disney = 99999;
                watcha = 99999;
                break;
        }
        
        // 검색 결과 없으면 후순위로 미룸

        if (!netf)
            netflix = 99999;
        if (!tvin)
            tving = 99999;
        if (!disn)
            disney = 99999;
        if (!watc)
            watcha = 99999;

        int min = netflix;
        String ott = "Netflix";

        if (tving < min) {
            min = tving;
            ott = "tving";
        }

        if (watcha < min) {
            min = watcha;
            ott = "watcha";
        }

        if (disney < min) {
            min = disney;
            ott = "disney";
        }


        //내용 인코딩
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        if (!netf && !tvin && !disn && !watc) {
            response.getWriter().write("해당 콘텐츠를 찾지 못했습니다.");
            response.getWriter().write("제목을 다시 확인해 주세요.");
        } else {
            response.getWriter().write(query + " 를 " + ott + "에서 " + min + "원으로 감상할 수 있습니다.\n");
            response.getWriter().write(ott + "를 추천합니다.");
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }


}
