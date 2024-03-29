HCI Project
===========

### bug Report
* 1 하루 이상의 공백 후 싸이트에 접속해서 디비 접근시 jdbc 에러가 발생(다시 접속하면 작동함)
* 2 개인 정보에서 팀이름 변경후 바로 글쓰기시, team repository가 넘어오지 않아서 에러발생

###  현재 진행중인 사항
* <del>협업 및 share tool 또는 시스템 선정 및 구축</del>
* <del>embeded tomcat 으로 update</del>
* <del>약속, 미팅등 팀내 활동 기본사항 제작</del>
* <del>사용할 db 확정 및 db 연동(현재 h2 db)</del>
* <del>Local project setting(개발경험 프로젝트 자료 기반) - 자료구조 및 MVC 설계 필요</del>
* <del>local 프로젝트 깃허브에 올리기</del>
* <del>깃허브로 부터 서버에 설치</del>
* <del>서버 주소 받기(from 서경진 교수님)</del>
* <del>서버에 자동화된 배포 스크립트 세팅(관련 자료 박재성 교수님 - 파이선 패브릭)</del>
* <del>제목, 내용, 댓글 구조 형식의 DB</del>
* <del>UI형식 및 기능 구체화작업</del>
* <del>User Repository 만들고 User별 데이터베이스 구축</del>
* <del>세션 관리 부분 추가</del>
* <del>Comment Controller 완성</del>
* <del>서버와 로컬에서 개발환경 문제 해결(다운받는 폴더 경로등의 문제)</del>
* <del>pdf파일 실시간으로 업데이트 되도록 개선(현재 이클립스의 리프레쉬후 가능 -  서버에서 테스트 필요)</del>
* <del>평점 부분 추가</del> 
* <del>평점 부분 UI개선 및 디자인 수정</del>
* <del>평점 부분 디비연동</del>
* <del>긴글의 코멘트 가능하도록 db수정</del>
* <del>한글 입력 문제 해결</del>
* <del>코멘트 입력부 및 입력후 보이는 UI 개선</del>
* <del>댓글 문단, 줄바꿈 기능이 필요합니다.</del>
* <del>화면 비율이 학생들 노트북에 최적화 되어 있고 고정되어 있습니다. pdf를 직접 볼 수 있도록 넓혀주시고 비율(예를 들어 브라우저윈도우의 80퍼센트)로 하면 어떻까 싶습니다.</del>
* <del>학기구분 되도록 수정</del>
* <del>어드민 페이지 계정 생성/수정/삭제가 있으면 좋겠네요</del>
* <del>개인 계정에 대한 정보관리 페이지</del>
* <del>회원정보에 팀이름, 팀원이름 추가</del>
* <del>세션 만료시 예외처리</del>
* <del>글삭제 기능</del>

### 서버관련
* 접속 IP :  10.73.44.97
* ID : next(sudo계정)
* OS : ubuntu 12.04 LTS
* sudo 계정공유로 인해 root계정을 별로 공유드리지 않았으나, 필요시 요청주시면 공유드리도록 하겠습니다
* 현재 사내망에서도 접속되도록 듀얼라우팅 테스트 진행중이고, 완료되면 사내망에서도 해당서버로 접속 되도록 지원해 드리겠습니다
* HCI폴더에서 fab deploy 로 실행으로 배포 스크립트 완료 (변경사항이 바로 적용 안되는경우 fab powerdeploy)

### 최종타겟
* 사용자별 개인 페이지가 구현된다.
* 구현된 페이지에 PDF파일의 업로드 및 다운로드 브라우져상의 뷰가 가능하다.
* 올라간 PDF문서글에 댓글이나 평가를 할수 있다.
* 업데이트되거나 새로운 PDF문서가 timeline형식으로 관리 된다.
* 댓글이나 평가, PDF올리기에 따른 권한 관리가 가능하다.

### [참고자료](https://github.com/onlycesc/HCI_Project/wiki/참고자료)
*(이미 처리) 한글 인코딩 문제 : Mysql DB 인코딩 세팅을 UTF8로 해주어야 함. 서버(/etc/mysql/my.cnf) 참조 : http://croute.tistory.com/606

