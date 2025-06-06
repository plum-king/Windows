### 경쟁상태

- 프로그램 실행의 결과가 일정하지 않고, 입력의 타이밍, 실행되는 순서나 시간 등에 영향을 받게 되는 상태
- 결과가 매번 달라지므로, 정상적인 결과가 나오지 않게 될 위험이 있는 상태

### 교착상태

- 두 개 이상의 작업이 서로 상대방의 작업이 끝나기를 기다리고 있는 상태
- 결과적으로 두 작업 모두 완료되지 못하는 상태

### 동기화

- 시스템을 동시에 작동시키기 위해서, 여러 작업들을 적절히 제어하는 기술
- 동기화 기술을 통해서 여러 작업들이 경쟁상태나 교착상태에 빠지지 않고 조화롭게 실행되도록 하는 것이 목적

### 동시성의 부작용

1. 경쟁상태 (Race Condition)
2. 교착상태 (Deadlock): 서로 양보하는 상태

<br>

**프로세스 확인해보기**

ctrl + alt + delete > 메뉴 띄우기 > 작업관리자 > 세부 정보 > 세부 정보 컬럼들 > 열 선택 > 스레드 활성 > 스레드 개수 확인
    

### 동기화의 필요성

동시에 세 개의 흐름이 실행되면, 셋 중 하나씩 골라서 차례대로 실행

동시성(성능 좋게 하는 기술) ≠ 동기화(병목을 만드는 기술, 성능을 안좋게 하는 기술) : 서로를 방해하는 관계

- 동시성 저해 (성능 나빠짐)
- 병목현상을 일으키는 기술

동시성 - 최대한 활용 ↔ 동기화 - 최소한 활용

### 다양한 동기화 기술

: 동시에 여러 개가 접근했을 때 하나만 선택하기 위한 기술

- 지원 레벨에 따른 구분
    1. 유저 모드의 동기화
        
        : 크리티컬 섹션 등 (치명적인 영역)
        
    2. 커널 모드의 동기화
        
        : 뮤텍스, 세마포어, 이벤트 등
        
    
    *크리티컬 섹션과 뮤텍스는 동일한 기술
    
- 제어 대상에 따른 구분
    1. 접근 제어의 동기화
        
        : 크리티컬 섹션, 뮤텍스, 세마포어 등
        
    2. 순서 제어의 동기화
        
        : 이벤트 등
        
- 제어 방식에 따른 구분
    1. BOOL형(T/F)의 동기화
        
        : 크리티컬 섹션, 뮤텍스 (하나는 T, 나머지는 F로 T만 통과)
        
    2. int형(1, 2, 3…)의 동기화 (= 계수기)
        
        : 세마포어 (정해진 번호 통과)
        
    3. 소식을 전하는 동기화
        
        : 이벤트
        

|  | 뮤텍스 | 세마포어 | 이벤트 |
| --- | --- | --- | --- |
| 역할 | 한 개 자원의 소유여부를 관리하는 동기화 객체 | 사용 가능한 자원의 개수를 카운트 하는 동기화 객체 | 어떤 사건이 일어났음을 알리는 동기화 객체 (↔ 접근제어) |
| 목적 | 하나의 공유자원을 보호/관리하기 위해 사용 | 제한된 일정 개수(= n개)의 공유자원을 보호/관리하기 위해 사용 (뮤텍스 ∈ 세마포어) | 스레드 간 통신을 위한 신호를 보내기 위해 사용 (작업순서/시기 조절) |
| 비고 | BOOL형의 동기화 객체 (스레드의 실행여부만을 통제) | int형의 동기화 객체 (실행 가능한 스레드 개수 관리) | 윈도우 메시지와 비슷한 역할의 동기화 객체 |