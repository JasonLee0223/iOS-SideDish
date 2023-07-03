# 🍱 SideDish (반찬 서비스)
> 코드스쿼드에서 제공해주는 API를 이용하여 반찬 서비스 앱 구현하기

|주제|항목|
|:---|:---|
| ▫️ 언어 | Swift |
| ▫️ 스킬 | Delegate 패턴, Observer 패턴 |
| ▫️  라이브러리 | Toast |
| ▫️  디자인 패턴 | MVVM |

&nbsp;

## 🪧 목차 
[⒈ 기능](#⒈-기능)

[⒉ 설계 및 구현](#⒉-설계-및-구현)

[⒊ 트러블 슈팅](#⒊-트러블-슈팅)

[⒋ 학습 키워드 및 내용](#⒋-학습-키워드-및-내용)

---
## 📱 실행 결과

<p float="left">
  <img src= "https://user-images.githubusercontent.com/92699723/249687406-28d2c03a-a4bd-4141-a027-55a7094fbe1c.gif" width= 30% />
  <img src= "https://user-images.githubusercontent.com/92699723/249687430-3076fa35-ee48-4b37-8687-9e635aafe336.png" width= 30% /> 
  <img src= "https://user-images.githubusercontent.com/92699723/249687442-9fbacd95-93f1-44e2-8388-85cca8f96b51.png" width= 30% />
</p>

 &nbsp;
---

## ⒈ 기능
### 🖥️ 홈 화면
- 총 3가지 섹션을 사용하여 반찬 정보를 나타낸다.
  - 메인 반찬
  - 국물 요리
  - 밑반찬
- 원하는 섹션(헤드라인)을 터치하면 해당 섹션의 반찬 갯수를 잠깐 보여주었다가 사라진다.

### 🖥️ 상세 화면
- 원하는 반찬 셀을 선택하면 해당 반찬의 상세정보를 담고있는 상세 화면을 보여준다.
  - 홈 화면의 내용을 그대로 보여준다.
  - 헤당 반찬을 주문하게 될 때의 배송 정보를 나타낸다.
  - 사용자가 원하는 만큼 수량을 선택하여 주문할 수 있다.
- `주문하기` 버튼을 터치하면 메세지를 통해 주문 정보를 확인할 수 있다.

## ⒉ 설계 및 구현

### 2-1. 화면 설계 방법

### 🖥️ 홈 화면
<img src = "https://user-images.githubusercontent.com/92699723/250234554-8b38dd95-355e-47c1-a34f-928bbc73ee19.jpg" width = 70%>

### 🖥️ 상세 화면
<img src = "https://user-images.githubusercontent.com/92699723/250474246-c67696e3-7423-4f1c-b9f3-6e04175308bb.jpg" width = 70%>

## ⒊ 트러블 슈팅

## ⒋ 학습 키워드 및 내용