# SAP Netweaver 어플리케이션 서버의 Client / Server 아키텍처



SAP 시스템은 표현 서버 계층, 응용 서버 계층, 데이터베이스 서버 계층이 있음.
표현 서버 계층의 경우 클라이언트가 있고 이 클라이언트가 응용 서버 계층으로 붙어서 요청을 보내면,     
디스패처가 알맞은 워크 프로세스로 분배를 하고 만약 데이터베이스로 접근해야 하면    
데이터베이스 인터페이스로 접근해서 데이터를 읽는 구조로 되어 있음.    



## 레이어 아키텍처에 대한 설명

### Architecture Layers
- The various layers in the architecture of SAP NetWeaver AS are as follows:        
Database layer is the lowest layer At this layer. data is managed with the
help of a Relational Database Management System (RCEMS)_ In addition to
application data it includes programs and the metadata that the SAP system
requires for operation.       
- Application Server layer is the intermediate layer At this layer. AEAP
programs, such as applications that SAP provides and any custom- developed
applications run on the application server ABAP programs read data from the
database, process it and if necessary. store new data in the database.      
- presentation Server layer is the highest layer. This layer contains the user
interface where each user can access the program enter new data. and
receive the results of a work process.     

3개의 레이어로 구성되어 있음,    
데이터베이스 레이어는 RDBMS를 통해 데이터가 관리됨.    
어플리케이션 데이터 외에도 프로그램, SAP 시스템의 메타데이터 등이 관리됨.   
---

어플리케이션 레이어는 표현 계층과 데이터베이스 계층 사이의 중간에 위치해 있음. 이 레이어에서 실제 ABAP 프로그램이 실행됨. ABAP 프로그램은 데이터베이스로부터 데이터를 읽어서 처리하며 어떤 경우에는 새로운 데이터를 데이터베이스에 넣어서 저장하는 역할을 수행하기도 함.
표현 계층은 유저 상호작용을 담당함. ABAP 프로그램에 접근하거나 새로운 데이터를 입력하거나 아니면 워크프로세스로부터 결과를 보여주는 역할을 담당.

### 유저의 입장에 따른 ABAP 프로그램
내부적인 영역이 Black Box로 표시되어 있는데, 일반적인 유저의 입장에서 보면
이 블랙 박스는 관심사항이 아님. 즉 사용자는 블랙박스 내용을 몰라도 되지만, 개발자는 이 내용을 알아야 함.

### 서버 레벨과 프로그램 플로우 간 상호작용
프로그램이 시작되면, 어플리케이션 서버에서 프로그램이 실행되면서 전역 변수들을 메모리에 잡은 후 유저에게 어떤 입력을 할 수 있는 화면을 출력해 줌.   
어떤 값 입력하고 실행 버튼을 누르면 그 액션이 다시 어플리케이션 서버로 와서 거기서 처리가 되는데      
만약 그 서버의 액션이 데이터베이스에 가서 절반을 얻어와야 한다고 하면, 메인 프로그램에서 Reuse Unit을 호출함.     

데이터베이스에 접근하는 기능들은 reuse unit으로 모듈화를 해 놓음.    
모듈화 unit으로 생성한 다음 다시 데이터베이스 테이블에서 해당 unit을 전달함.
Reuse unit이 값을 읽어와서 메인 프로그램에게 전달하고, 메인 프로그램은 출력한 값을 유저에게 보여주는 방식으로 상호작용함.  

### ABAP 프로그램 흐름

1. 유저가 selection screen과 list로 이어진 리포트 프로그램 실행
2. 프로그램을 실행시키면 데이터베이스 베이스 레이어의 레포지토리로부터 소스코드가 어플리케이션 서버로 로딩됨.
3. 이때 프로그램 콘텍스트(프로그램에 선언된 변수들, 스크린들 등)가 메모리에 로드됨.
4. 런타임 시스템은 사용자에게 selection screen을 보내 줌.
5. 사용자는 selection screen의 input field에 값을 입력 후 실행 버튼을 누르게 됨. 사용자가 입력한 값이 어플리케이션 서버의 데이터 오브젝트에 복사됨.
6. 만일, ABAP processing block에서 reuse unit을 호출하면 reuse unit도 repository에 소스코드가 있기 때문에 소스코드를 읽어와서 어플리케이션 서버에 로드하게 되어 있음
7. 유저로부터 받은 데이터를 reuse unit으로 전달
8. 데이터베이스로부터 어떠한 데이터를 가지고 오라고 요청을 날림
9. 데이터베이스로부터 요청에 대한 결과를 return 받음
10. Return 받은 결과를 reuse unit 안 데이터 오브젝트에 저장
11. Reuse unit이 받은 결과를 reuse unit을 호출한 곳으로 다시 전달
12. 런타임 시스템이 결과를 list 형태의 스크린으로 사용자에게 다시 보내줌 

 

 

 

 

 