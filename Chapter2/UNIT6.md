# Unit6 - Communication and Integration Technologies 

## RFC(Remote Function Call)
RFC를 사용하여 가능한 연결 방법
- SAP와 SAP 시스템 간의 통신
- SAP와 비 SAP 시스템(ex: JAVA,.NET) 간의 통신 가능

## Calling System
: RFC를 호출하는 곳  
: CALL function이라는 것을 가지고 호출.  
: DEST → SAP에 Destination을 관리하는 곳이 있음. (= Tcode SM59 : 외부 destination 관리, 여기에 있어야지만 외부 function call 가능)   
: DEST를 정의할 때는 Called 되는 System의 정보가 필요.  
: 실제로 호출 시 Call Function 함수이름 나열 후, 시스템에 있는 Function의 정보를 조회함.  
: RFC 호출 하기 전 Destionation을 먼저 만들어 놔야 함.  

## Called System
: 실제로 RFC가 존재하는 곳   
: RFC만 만들면 됨

## BAPI
: 비즈니스 오브젝트 repository라는 곳에 비즈니스 오브젝트와 그 비즈니스 오브젝트를 변경하고, 조회할 수 있는 것으로 조회  
: BOR은 BO와 BO의 액션을 담당하고 있는 BAPI로 구성되어 있음.

## ALE
분산환경에서 어플리케이션 등을 쓸 수 있는 기능

## 웹 서비스 시나리오
- UDDI : 전화번호부 같은 역할을 수행
- 웹 서비스 프로바이더 / 사용자
    - 웹 서비스 프로바이더는 서비스를 생성하고 UDDI에 등록 
    - 웹 서비스 사용자는 UDDI에서 웹 서비스를 찾은 다음 WSDL이라는 것을 통해서 웹 서비스 프로바이더로부터 웹 서비스를 호출
  - SAP NetWeaver는 웹 서비스를 개발하고 configure할 수 있는 모든 툴을 다 제공하고 있음.
    
## 웹 서비스의 configuration tool
웹 서비스를 call하기 전, provider는 point를 정해줘야 하고 consumer는 포트를 정의해야 함. 정의된 포인트와 로컬 포트가 알맞게 매치되어야 함.    
엔드포인트에 SSO(Single-Sign-On)으로 인증이 된 경우 패스워드만 가지고서는 웹 서비스를 호출할 수 없음.

## Odata(Open Data Protocol)
표준 프로토콜, SAP에서도 표준 Odata 프로토콜을 사용하여 통신을 지원  
Odata는 http 사용하여 xml, json 형태의 데이터를 전송함.    

 