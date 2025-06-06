### Windows API의 구성

1. User 모듈: 윈도우창 관리 역할 (User32.dll)
    
    ex. 윈도우(버튼, 에딧 컨트롤 등), 커서, 메뉴 등
    
2. GDI 모듈: 그래픽 관리 역할 (GDI32.dll)
    
    ex. 펜, 브러쉬, 비트맵, 폰트 등
    
3. 커널 모듈: 커널 관리 역할 (Kernel32.dll)
    - 시스템 프로그래밍에 해당
    
    ex. 파일, 프로세스, 스레드 등
    

*dll (Dynamic linking library)

⇒ 각 모듈은 여러 종류의 객체를 관리

⇒ 관리의 편의를 위해 핸들을 사용함 (핸들: 32bit의 숫자)

| **User모듈 (User32.dll)** | **GDI 모듈** | **Kernel 모듈** |
| --- | --- | --- |
| 윈도우 (창) 관리에 사용 | 그래픽을 위해 사용 | 커널 관리를 위해 사용 |
| User 객체: 윈도우, 커서, 아이콘, 메뉴 등 | GDI 객체: 펜, 브러시, 비트맵 등 | Kernel 객체: 파일, 프로세스, 스레드 등 |
| - 한 객체에 하나의 핸들 <br> - 시스템 전역적 | - 한 객체에 하나의 핸들 <br> - 프로세스 지역적 | - 한 객체에 다수의 핸들 <br> - 프로세스 한정적 |

### 객체와 핸들

**객체 Object**

- 시스템 리소스에 대한 정보를 담고 있는 일종의 데이터 구조체
    
    ex. 사람(객체)의 정보: 이름, 성별, 생년월일, 주소 등
    

**핸들 Handle**

- 객체의 관리 편의를 위해서 사용하는 간단한 32bit 정수 값 (Win64면 64bit)
    
    ex. 사람의 주민번호 (13자리 숫자)
    

객체 ≠ 핸들

**파일의 핸들 열기**

```powershell
hFile = CreateFile(…); # 핸들 열기 (객체를 직접 만지는 것 X)
# 파일을 만들겠다 = CreateFile
# 폰트를 만들겠다 = CreateFont
# ~를 만들겠다 = Create~
```

함수 실행) 내부적으로는 객체 생성, 핸들만 넘겨 받음

만들어진 핸들을 통해 파일 제어 가능!

**파일 핸들 닫기**

```powershell
CloseHandle(hFile); # 닫을 핸들명 넣기
```

함수 실행) 파일을 더 이상 제어할 의사가 없다

파일을 삭제하겠다는 의미가 아님! (파일을 제어하는 핸들이 여러 개 일 수 있음) ↔ DeleteFile() 함수 등 🈶

**커널 객체의 핸들 특징**

- 한 개의 객체에 대해서 여러 개의 핸들을 생성할 수 있음!!!!
    
    ⇒ 커널 모듈이 관리하는 커널 객체만 이러한 특징 갖고 있음 (객체 : 핸들 = 1 : N)
    
- 다른 객체로부터 받은 핸들을 갖고 와서 사용 불가!!!
    
    ⇒ 프로세스 한정적이기 때문에..
    

### Windows API ↔ MFC

Windows API: C 프로그래밍 용도로 개발

Microsoft Foundation Class: 객체지향화하여 C++ 프로그램 용도로 개발

→ Windows API의 함수들과 구조체들을 모아서 클래스의 형태로 만들어 놓은 클래스의 집합
