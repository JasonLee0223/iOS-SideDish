# 🍱 SideDish (반찬 서비스)
> 코드스쿼드에서 제공해주는 API를 이용하여 반찬 서비스 앱 구현하기

&nbsp;

|주제|항목|
|:---|:---|
| ▫️ 언어 | Swift |
| ▫️ 스킬 | Delegate 패턴, Observer 패턴 |
| ▫️  라이브러리 | Toast |
| ▫️  디자인 패턴 | MVVM |

## 🪧 목차

- [🍱 SideDish (반찬 서비스)](#-sidedish-반찬-서비스)
  - [🪧 목차](#-목차)
  - [📱 실행 결과](#-실행-결과)
  - [⒈ 기능](#-기능)
    - [🖥️ 홈 화면](#️-홈-화면)
    - [🖥️ 상세 화면](#️-상세-화면)
  - [⒉ 설계 및 구현](#-설계-및-구현)
    - [2-1. 화면 설계 방법](#2-1-화면-설계-방법)
    - [🖥️ 홈 화면](#️-홈-화면-1)
    - [🖥️ 상세 화면](#️-상세-화면-1)
    - [2-2. 레이어(Layer) 구현](#2-2-레이어layer-구현)
  - [⒊ 트러블 슈팅](#-트러블-슈팅)
    - [🔴 3-1. UICollectionViewDataSource의 비동기 reload 에러 해결](#-3-1-uicollectionviewdatasource의-비동기-reload-에러-해결)
    - [🔴 (작성 예정) 3-2. reloadData -\> reloadSection 리펙토링](#-작성-예정-3-2-reloaddata---reloadsection-리펙토링)
    - [🟡 (작성 예정) 3-3. UIScrollView의 View 계층 관계](#-작성-예정-3-3-uiscrollview의-view-계층-관계)
    - [🟢 (작성 예정) 3-4. prepareForReuse를 사용한 셀 초기화 작업](#-작성-예정-3-4-prepareforreuse를-사용한-셀-초기화-작업)
    - [🔴 (작성 예정) 3-5. UICollectionViewDataSource의 추상화 리펙토링](#-작성-예정-3-5-uicollectionviewdatasource의-추상화-리펙토링)
    - [🔴 (작성 예정) 3-6. OAuth를 사용한 소셜 로그인 구현하기](#-작성-예정-3-6-oauth를-사용한-소셜-로그인-구현하기)
---
## 📱 실행 결과

<p float="left">
  <img src= "https://user-images.githubusercontent.com/92699723/251017821-c3df401f-e712-4135-b70f-225001738ade.gif" width= 30% />
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
    - 화면을 스크롤하여 여러 장의 이미지를 확인할 수 있다.
  - 헤당 반찬을 주문하게 될 때의 배송 정보를 나타낸다.
  - 사용자가 원하는 만큼 수량을 선택하여 주문할 수 있다.
- `주문하기` 버튼을 터치하면 메세지를 통해 주문 정보를 확인할 수 있다.

## ⒉ 설계 및 구현

### 2-1. 화면 설계 방법

### 🖥️ 홈 화면
<img src = "https://user-images.githubusercontent.com/92699723/250234554-8b38dd95-355e-47c1-a34f-928bbc73ee19.jpg" width = 70%>

### 🖥️ 상세 화면
<img src = "https://user-images.githubusercontent.com/92699723/250474246-c67696e3-7423-4f1c-b9f3-6e04175308bb.jpg" width = 70%>

### 2-2. 레이어(Layer) 구현
| 레이어 | 서브레이어 | 설명 |
|:---|:---|:---|
| Presentation | Controller | Home, Detail의 ViewController를 관리한다.|
||CellLayout|홈 화면의 collectionView Cell 레이아웃으로 Compositional을 사용하여 관리한다.|
||DataSource|홈 화면의 collectionView DataSource를 커스텀 타입으로 만들어 관리한다.|
||Cells|CollectionView의 Cell을 구성하는 UI 요소들을 관리한다.|
||ViewModel|API 데이터를 관리하며 UI에 바인딩하는 역할을 한다.|
||View|Cell에 들어가는 UI 요소들을 관리한다.|
|Domain|Entity|홈 화면에 사용되는 api 데이터들을 Food 타입으로 관리한다. <br/>(DetailVC에서 사용되는 Entity는 불필요하다고 생각되어 구현하지 않음)|
|Data|Network <br/>(APIEndpoint)|API 요청 및 응답의 콘크리트 형태|
|Infrastructure|Network <br/>(Endpoint & Service)|Endpoint의 인터페이스 및 실제 서버로부터 응답받은 데이터를 가지고있다.|

## ⒊ 트러블 슈팅

해결해나아가는 과정에 대한 난이도를 아래와 같이 표현합니다.

|난이도|이모지|
|:---:|:---|
|상|🔴|
|중|🟡|
|하|🟢|

### 🔴 3-1. UICollectionViewDataSource의 비동기 reload 에러 해결
[Velog - UICollectionViewDataSource의 비동기 reload 에러 해결에 대하여...](https://velog.io/@jaonlee0223/UICollectionViewDataSource%EC%9D%98-%EB%B9%84%EB%8F%99%EA%B8%B0-reload-%EC%97%90%EB%9F%AC-%ED%95%B4%EA%B2%B0%EC%97%90-%EB%8C%80%ED%95%98%EC%97%AC)

### 🔴 (작성 예정) 3-2. reloadData -> reloadSection 리펙토링

### 🟡 (작성 예정) 3-3. UIScrollView의 View 계층 관계

### 🟢 (작성 예정) 3-4. prepareForReuse를 사용한 셀 초기화 작업

### 🔴 (작성 예정) 3-5. UICollectionViewDataSource의 추상화 리펙토링

### 🔴 (작성 예정) 3-6. OAuth를 사용한 소셜 로그인 구현하기
