### 스트림

- 컴퓨터 내에서 데이터를 전송할 경우, 데이터가 연속적인 흐름을 만들어서 이동하는 개념

### 표준 입출력

- 기본이 되는 입출력 장치
- 표준 입력: 키보드를 통한 입력
- 표준 출력: 모니터를 통한 출력

### 콘솔

- 컴퓨터를 제어하기 위해 사용되는 컴퓨터 단말 장치
- 보통 모니터, 키보드 등과 같은 장치

## 입출력(I/O)

### 스트림이란?

- 데이터를 입력/출력하기 위한 다리 (인터페이스)
- 표준 입출력 스트림: 콘솔 (키보드와 모니터)
    
    키보드 → stdin(표준 입력 스트림) → 프로그램 → stdout(표준 출력 스트림) → 모니터
    
- 파일 입출력 스트림: 파일
    
    파일 → 파일 입력 스트림 → 프로그램 → 파일 출력 스트림 → 파일
    

### 표준 입출력 스트림

**종류**

- 표준 입력 스트림: 키보드 (stdin)
- 표준 출력 스트림: 모니터 (stdout)

**생성/소멸 시점**

- 생성 시점: 프로그램 시작 시 (자동)
- 소멸 시점: 프로그램 종료 시 (자동)

### 파일 입출력 스트림

**필요성**

- 프로그램이 종료되면, 데이터 사라짐
- 데이터의 영구저장 필요

**생성/소멸 시점**

- 생성 시점: 프로그래머가 파일 스트림을 생성한 때 (수동)
- 소멸 시점: 프로그래머가 파일 스트림을 파괴한 때 (수동)

**파일 접근 모드**

- 읽기 모드
- 쓰기 모드
- 추가 모드

**파일 저장 모드**

- 텍스트 파일
    - 문자열 기반으로 저장된 파일
    - 일반 문서 편집기에서 확인 가능
        
        ex) *.txt, *.c, *.html
        
- 이진 파일
    - 이진 형식으로 인코딩된 파일
    - 일반 문서편집기에서 확인 불가
        
        ex) *.obj, *.exe, *.hwp, *.doc
        

**파일 개방 모드의 조합**

- RT
- WT
- AT
- RB
- WB
- AB