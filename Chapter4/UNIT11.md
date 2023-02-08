# Unit11 - Complex Data Objects 

## Lesson1. Using Structured Data Object

### 글로벌 타입을 사용하여 구조 타입 선언

- 구조의 의미    
논리적으로 연관성이 있는 필드들을 여러 개 모은 데이터 오브젝트를 구조라고 하면 됨.   
구조 오브젝트를 선언하는 데 사용하는 타입은 ABAP Dictionary에 있는 타입(데이터 엘리먼트 / 스트럭쳐 타입 / 인터널 테이블 타입)을 참조해서 생성. 이 스트럭쳐 타입을 사용하여 오브젝트를 만들면, 스트럭쳐를 기반으로 한 데이터 오브젝트가 생성됨. 개별 필드들이 모인 하나의 오브젝트 모양으로 생성됨.

  
스트럭쳐를 만들 때에는 타입으로 두 가지를 참조 가능함.
글로벌 타입으로 사전에 선언된 것을 사용할 수 있음.   
프로그램 내 로컬에서 선언된 것을 사용 가능함.  

### 로컬 타입을 사용하여 구조 타입을 정의하는 방법
```
TYPES : BEGIN OF 구조 이름,

필드명 TYPE 필드 타입,
       .
       .
       .
END OF  구조 이름. 

DATA 변수 이름 TYPE 구조 이름.
```
→ 타입 참조하여 구조 데이터 오브젝트 만들 때 사용

### 구조의 컴포넌트에 접근하는 방법

구조의 컴포넌트 = 구조의 개별 필드    
구조의 개별 필드에 접근할 때에는 구조의 이름 - 구조 내 필드 이름 이런 식으로 작성하면 됨.

### 구조와 구조 사이의 값을 이동(복사)시키는 방법

구조 2개가 선언이 다른 경우, 등호를 사용하면 안 됨.    
MOVE-CORRESPONDING을 사용해야 함.   
이 경우, 구조 사이의 이름이 같은 필드만 복사하게 됨. 

`MOVE_CORRESPONDING A TO B ` : A의 구조 내용을 B에 복사.

### 디버깅 모드에서 구조 조사

보고 싶은 구조체를 더블 클릭하면, 구조체에 대한 정보가 나타남.    
실제 안에 있는 컴포넌트 값도 볼 수 있고 그 안에 있는 내용을 변경할 수도 있음.


## LESSON2. USING INTERNAL TABLE

### 인터널 테이블 사용하는 곳

#### 인터널 테이블

구조는 하나의 라인만 저장할 수 있는 데이터 오브젝트이지만,
인터널 테이블은 구조 타입의 오브젝트가 여러 라인 있는 오브젝트임.    
몇 개의 라인이 올 지는 모르지만 이 관리는 런타임 시스템에서 해주므로 굳이 신경 안 써도 됨.     
스크린(ALV)을 디스플레이할 때나 프린트 리스트, 데이터베이스에 여러 데이터를 삽입하거나 파일로 내보내기 위해서 사용


### 인터널 테이블의 속성

- LINE TYPE    
인터널 테이블은 해당 인터널 테이블이 어떤 컴포넌트로 구성될 것인지 정보를 주는 곳이 LINE TYPE임.   
이때 라인 타입은 당연히 스트럭쳐의 형태를 띔.

- PK   
인터널 테이블에 여러 칼럼들이 있는데 키 값은 어떠한 컬럼인지 이를 정의할 수 있음.
이 때 그 키 값은 UNIQUE와 NON-UNIQUE로 정의가 가능함.
키 값 조합으로 인터널 테이블을 검색했을 때 한 건만 나오면 유니크한 것임. 여러 건이면 논-유니크임.   

- TABLE KIND   
테이블의 종류에는 STANDARD, SORTED, HASHED 테이블 총 3개가 있음.   
이걸 정의하는 이유는 큰, 많은 양의 데이터를 가진 인터널 테이블을 사용(조회)할 때 속도 관련 이슈가 발생하는데,    
그럴 경우 적합한 인터널 테이블을 선언하여 사용해야 함.
  
### 테이블의 속성에 따른 인터널 테이블 사용하는 방법

#### STANDARD
인덱스 접근(테이블에 열 숫자 - 인덱스로 접근하는 방법), 키 접근(테이블에 있는 필드의 값으로 테이블 열을 찾아감)이 가능   
키의 유니크함 : 중복되어도 상관없음.    
주로 사용되는 목적은 인덱스 접근을 목적으로 사용.    
이걸 많이 사용, 아래 두 개는 탐색 속도가 좋아 대용량일 때 사용.

#### SORTED
인덱스, 키 접근 모두 가능   
데이터를 새로 삽입할 때 키 값이 정렬된 상태로 들어가게 되어 있음.  
키의 유니크함은 따라서 중복도, 유니크하게도 설정이 따로 가능함.   
키 접근, 인터널 테이블의 값을 검색할 목적으로 주로 사용함.

#### HASHED
인덱스 접근이 안 되며, 키 접근만 가능함.    
키는 반드시 유니크해야 함. 중복 시 런타임 에러 발생.    
오직 키 접근만 가능함.   

### 글로벌 테이블 타입을 사용해 인터널 테이블 타입을 만드는 방법  
글로벌 테이블 타입은 딕셔너리에 사전에 정의되어 있음.     
프로그램에서는 DATA 데이터 오브젝트 명 TYPE 테이블 타입명을 작성해서 사용하면 됨.     
데이터 오브젝트를 만들 때, 인터널 테이블을 참조한 것을 만들기 위해서는 TYPE 키워드를 사용해주면 됨.

### 로컬 데이터 타입을 가지고 인터널 테이블을 만드는 방법
#### 테이블 타입을 가지고 로컬로 만드는 방법.
그 후 테이블 타입이 나옴, 스탠다드 / 정렬 / 해쉬 중 하나임. 그 후 OF 키워드를 사용하고 라인 타입을 작성함.    
그 다음 WITH NON_UNIQUE KEY를 나열하고 키 이름을 나열해주면 됨.      

```
TYPES 타입명
         TYPE STANDARD / SORTED / HASH TABLE OF LINE TYPE명
         WITH NON-UNIQUE KEY 키 이름
```
그 후 데이터 오브젝트를 만들 때에는 DATA 데이터 오브젝트 명 TYPE 테이블 타입명을 작성해서 선언해두면 됨.

### 구조 타입만 가지고 테이블을 선언하는 방법
위에 구조 타입을 먼저 로컬로 만들어 줌.    
그 후 구조 타입을 가지고 인터널 테이블을 만들 때에는
```
DATA 인터널 테이블명 TYPE STANDARD / SORTED / HASH TABLE OF (위에서 선언한)구조명
WITH NON-UNIQUE / UNIQUE KEY...
```
타입 테이블 타입 오브 라인타입 순서임!    
타입이면 뒤에 무조건 테이블 타입    
3번이 가장 많이 쓸 문법(숏폼 형태)임. 이 구조 타입 모양의 테이블 형식인 인터널 테이블을 만듦.    
3번의 경우 테이블 구조를 생략했으므로 디폴트인 스탠다드 테이블이 만들어짐.    
또한 키의 경우 논-유니크하게 만들어짐.     
이 때 숫자 형태의 필드가 아닌 경우 자동으로 다 키 필드로 잡히게 됨.

### 인터널 테이블의 싱글 레코드에 접근하는 방법

#### APPEND
인터널 테이블의 맨 마지막에 데이터를 넣어 두는 것.    
`APPEND 구조명 TO 인터널 테이블명`      
이런 식으로 작성함.     
이 때 이 gs를 WORK AREA라고 부름.
인터널 테이블을 조작하기 위해 선언하는 구조 오브젝트를 워크 영역이라고 부름.     
이 워크 영역과 인터널 테이블의 구조를 일치시켜야 되므로, 해당 구조를 라인 타입으로 선언해둬야 함.

#### INSERT
인터널 테이블의 특정 위치에 데이터를 삽입하는 것.       
`INSERT 구조명(워크 영역) INTO TABLE 인터널 테이블명 <조건>`

#### READ
인터널 테이블의 특정 레코드를 조회하는 것.
`READ TABLE 인터널 테이블 INTO WORK AREA <조건>`     
(읽은 데이터를 워크 영역에 복사하라는 의미)

#### CHANGE ( = MODIFY)
인터널 테이블의 특정 값을 변경하는 것   
`MODIFY TABLE 인터널 테이블 FROM work_area <조건>`
워크 영역에 있는 값으로 인터널 테이블의 특정 값을 변경해라.     

#### DELETE
인터널 테이블의 특정 레코드 값을 삭제하는 것.       
`DELETE 인터널 테이블 <조건>`

#### COLLECT
인터널 테이블의 내용을 합산하는 기능.

### 인터널 테이블의 복수 행을 다루는 방법

####루프
루프는 인터널 테이블의 첫 번째 라인부터 행을 돌면서 루프를 돎.    
한 라인 씩 꺼내면서 워크 영역에 복사해줌.    
인터널 테이블 내의 콘텐츠를 접근하기 위해서는 무조건 루프를 돌려야 함.    
인터널 테이블에 직접 접근하여 콘텐츠를 변경하는 방법은 없음. 

### 여러 라인 삭제
DELETE 한 다음에 인터널 테이블 이름 주고, 그 라인을 특정할 수 있는 조건을 주면 됨.

`INSERT LINES OF`    
`INSERT LINES OF A INTO B <condition>`     
A라는 인터널 테이블에 있는 특정 ROW들을 읽어서 B의 특정 위치에 넣으라는 의미.  

`APPEND LINES OF`      
`APPEND LINES OF A INTO B <condition>`

A라는 인터널 테이블의 라인을 읽어서 B라는 인터널 테이블 라인의 마지막에 추가하라는 의미.

### WORK AREA의 선언 방법

`워크 에리어 이름 LIKE LINE OF 인터널 테이블`     
라인과 비슷한 스트럭처 워크 에리어 데이터 오브젝트를 만들라는 의미.

`Sy-tabix`    
루프를 돌며 현재 내가 처리하고 있는 라인의 넘버가 해당 시스템 변수에 들어감.

### 인터널 테이블의 인덱스 접근
첫번째 구문의 경우 1부터 5까지 구문을 돌으라는 의미.    
두번째 구문의 경우 하나의 싱글 레코드만 읽음.     
이 때 INDEX 키워드를 줘서 지정 가능.

### 인터널 테이블의 키 접근
WHERE 조건을 사용하여 키 접근 진행.    
조건에 있는 필드로 접근하여 출력          
`WITH TABLE KEY 조건을 사용하여 키 접근 진행.`     
특정 조건이 그것인 것만을 읽으라는 의미.    
인터널 테이블로부터 값을 찾았으면, sy-subrc 값이 0이 됨. 0일 경우에만 값을 출력하면 됨.    
이 때 sy-tabix에 들어가는 값은 조건에 부합하는 행이 몇 번째 행인지에 대한 정보가 들어감.     
`WITH TABLE KEY VS WITH KEY`     
TABLE KEY의 경우 해당 테이블에 있는 키 필드만 접근이 가능하지만,
KEY의 경우 해당 테이블 외의 키 필드에도 접근이 가능하다.    

### 인터널 테이블 삭제 및 정렬방법
SORT 키워드 사용하고 아무 것도 입력 안 하면 자동으로 오름차순 정렬 진행.    
SORT 인터널 테이블명 BY 컬럼명 입력 시 그 컬럼명에 대해 오름차순 정렬 진행.     
컬럼 이후 어떤 방식으로 정렬할 지 줄 수 있음.      
인터널 테이블 콘텐츠 초기화하려면, 리프레쉬 / 클리어는 동일한 효과.     
FREE는 콘텐츠 뿐만 아니라 메모리도 날리므로 해당 키워드쓰면 그 이후론 다시 접근이 불가능함.

### 인터널 테이블과 헤더라인
좌측은 헤더라인을 갖지 않은 것, 우측은 헤더라인을 갖고 있는 것임.    
우측은 절대 쓰면 안 됨!     
예전 레거시 코드에서 우측 방식으로 사용한 것이 많기 때문에 알아두기만 하자.     
워크 영역을 통해 인터널 테이블 작업을 수행함.     

워크 영역 대신 헤더 라인 사용.    
헤더라인 사용 시 인터널 테이블과 같은 이름으로 헤더 라인이 생성됨.     
이름이 같기 때문에 작업 수행 시 생략하고 사용 가능.    

OOP 클래스 내부에서 WITH HEADER를 쓰는 경우 아예 오류가 발생하며, 모호하기 때문에 권장하진 않음.     
그냥 등호만 쓰면 헤더라인만 복사되고, []를 붙이면 그 안의 콘텐츠까지 전부 복사됨.    
헤더라인과 테이블 내용을 구분하는 방법에는 대괄호가 있음. 