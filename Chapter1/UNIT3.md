# Lesson1. Navigation with SAP GUI for Windows in AS ABAP Systems



### Lesson Agenda
- How to Change a password
- How to Run a Transaction from tie Easy Access Menu
- How to Create a Personal List of Values
- How to Log Off the System and Run a Transaction
- Search Technical Information using Fl



## GUI 접속 창

1 : 시스템에 접근할 수 있는 시스템들이 나열,

원하는 시스템에 접근하기 위해서는 서버를 더블 클릭하면 시스템에 접근이 가능함.

이 창에서 더블클릭하고 서버 내부로 들어가면, 아래와 같이 Logon 창이 열림.
이 창에서는 본인이 접속한 시스템의 번호, 유저, PW, 어떤 언어로 접속할 것인지 정보를 입력하면 됨.
우측의 경우 회사마다 어떤 식으로 커스터마이징하냐에 따라 달라짐.
처음 접속했을 때 나타나는 Easy Access창.
왼쪽 화면이 Favorite List로, 자주 가는 트랜잭션을 즐겨찾기하여 네비게이션을 할 수 있음.


Role-Based Menu의 경우, 사용자 Role별로 모두 다르게 보일텐데 SAP 시스템은 사용자의 롤을 관리함.
이 롤에 어떠한 메뉴들을 등록하고 사용자에게 할당을 해주면,
사용자가 접근할 수 있는 메뉴는 Role 안에 들어있는 메뉴임.
그 사용자에게 할당되어 있는 롤 안의 메뉴들만 접근 가능함.
그것을 Role-Based Menu라고 함.


가운데(바디로, 실제로 프로그램을 작성한 화면)에 집중할 필요 없고, 상단/하단바만 여기서 확인
- 상단바(=메뉴바)
- 시스템 툴 바
- 타이틀 바
- 어플리케이션 툴 바 : 영역은 있는데 프로그램마다 다르게 보일 것
- 스테이터스 바 : 메세지나 시스템의 상태를 볼 수 있는 영역    
바디안에 여러 필드들이 있음.
  
## SAP 시스템에서 네비게이션을 할 수 있는 방법
프로그램을 실행시킨다고 보면 됨.

프로그램을 실행시키는 방법에는 크게 3가지가 있음.

1. Command field : 트랜잭션 코드를 알고 있으면, 그 코드를 넣고 엔터치면 바로 실행 가능
2. Easy Access에 있는 메뉴들을 클릭하여 접근 가능
3. 메뉴 바의 특정 엔트리를 선택해서도 특정 메뉴로 접근 가능



## F1 Help
특정 UI 컴포넌트에 포커싱을 주고 F1을 누르면 F1 헬프가 뜨며. 해당 컴포넌트가 어떠한 역할을 하는지 알 수 있음.
이 필드는 어떤 프로그램의 필드인지, 몇 번 스크린에 존재하고, 어떤 데이터 타입을 참고하는지 확인 가능

## F4 Help (Search Help)
###- input field에 들어올 수 있는 값을 의미
특정 UI 컴포넌트에 포커싱을 주고 F4를 누르면, 해당 필드에 들어올 수 있는 값이 리스트 형태로 나타남.
이를 possible entity라고 부름.

---

- SAP Library - help.sap.com에서 확인 가능
SAP의 모든 프로그램에서 공통으로 볼 수 있음.

- System Status : 접근하고 있는 시스템에 대한 정보 자세히 볼 수 있음.
예) 어플리케이션 서버 OS, DB 정보들 확인 가능

- SAP Service Marketplace : 시스템에 문제가 있을 때 oss 메시지를 날리거나, 다운로드를 받아야 할 SW가 있으면 여기서 확인 가능 

 

 

 