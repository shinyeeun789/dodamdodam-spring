# 도담도담 v2.0.0
2020년 9월에 진행했던 프로젝트에서 <a href="https://github.com/shinyeeun789/DodamDodam-Spring-/new/master?readme=1#%EB%B3%B4%EC%99%84%ED%95%9C-%EC%A0%90">아쉬움으로 남았던 부분</a>을 보완한 프로젝트입니다.

## 💻 프로젝트 소개
식품 알레르기 환자들을 위한 안전한 제품 및 섭취 제한 식품 정보를 제공해주는 웹사이트입니다.
본 시스템의 기대효과는 대학병원 방문 없이 알레르기 원인을 예상할 수 있어 사용자의 시간과 부담을 감소시킬 수 있고, 시스템에 기록된 식단, 증상 데이터를 알레르기 치료 참고 자료로 사용하게 될 것입니다.

### 🕰 개발 기간
2022.01 - 2022.02

### 📚 개발 환경
![Spring](https://img.shields.io/badge/spring-6DB33F?style=for-the-badge&logo=spring&logoColor=white)
![bootstrap](https://img.shields.io/badge/bootstrap-7952B3?style=for-the-badge&logo=bootstrap&logoColor=white)
![mySQL](https://img.shields.io/badge/mysql-4479A1?style=for-the-badge&logo=mysql&logoColor=white)
![ApacheTomcat](https://img.shields.io/badge/ApacheTomcat-F8DC75?style=for-the-badge&logo=ApacheTomcat&logoColor=black)

### 🛠 보완한 점
|기능|v1.0.0|v2.0.0|
|:----:|:------:|:------:|
| Frontend | HTML+CSS | Bootstrap Template |
| Backend | JSP | Spring Framework |
| 로그인 기능 | 일반 로그인만 지원 | 소셜 로그인(카카오)도 지원 |
| 식품 정보 기능 | DB에 직접 추가 | Open API 사용 |

## 📱 주요 기능
### 1. 로그인
- Frontend 단에서 Kakao.API.request() 함수를 통해 카카오 로그인 기능 구현
#### 📷 View
<table>
  <tr>
    <td align="center">
      <img src="https://user-images.githubusercontent.com/70800414/234228059-82faf533-1381-4730-8e6c-4db16485420e.png" width="800" alt=""/> <br/>
      <sub><b> PIC1 : 일반 로그인 화면 </sub></b>
    </td>
    <td align="center">
      <img src="https://user-images.githubusercontent.com/70800414/234228522-22ffb75f-954e-4808-be29-5eabad04b136.png" width="300" alt=""/> <br/>
      <sub><b> PIC2 : 카카오 로그인 화면 </sub></b>
    </td>
  </tr>
</table>

### 2. 식단 관리 기능
#### (1) 식단 추가
- <a href="https://github.com/shinyeeun789/DodamDodam#1-%EC%8B%9D%EB%8B%A8-%EC%B6%94%EA%B0%80"> 도담도담 v1.0.0</a>과 같음
#### (2) 식단 리스트
- jqGrid 대신 TOAST UI GRID 사용하여 도식화
#### 📷 View
<table>
  <tr>
    <td align="center">
      <img src="https://user-images.githubusercontent.com/70800414/234228967-57d4b245-1f83-498f-bd40-c81b20da4f83.png" width="500" alt=""/> <br/>
      <sub><b> PIC1 : 식단 추가 화면 </sub></b>
    </td>
    <td align="center">
      <img src="https://user-images.githubusercontent.com/70800414/234229562-e36c167c-25f2-403e-86e4-51bb80308aa7.png" width="500" alt=""/> <br/>
      <sub><b> PIC2 : 식단 리스트 화면 </sub></b>
    </td>
  </tr>
</table>

### 3. 증상 및 약 복용 정보 관리 기능
- <a href="https://github.com/shinyeeun789/DodamDodam#2-%EC%A6%9D%EC%83%81-%EB%B0%8F-%EC%95%BD-%EB%B3%B5%EC%9A%A9-%EC%A0%95%EB%B3%B4-%EA%B4%80%EB%A6%AC-%EA%B8%B0%EB%8A%A5"> 도담도담 v1.0.0</a>과 동일
#### 📷 View
<table>
  <tr>
    <td align="center">
      <img src="https://user-images.githubusercontent.com/70800414/234292732-e7bc574f-83d6-4b0c-a17f-570ebaab7927.png" width="500" alt=""/> <br/>
      <sub><b> PIC1 : 증상 추가 화면 </sub></b>
    </td>
    <td align="center">
      <img src="https://user-images.githubusercontent.com/70800414/234293036-b834cdca-008b-451a-92ad-d5295ce2d1e4.png" width="500" alt=""/> <br/>
      <sub><b> PIC2 : 증상 리스트 화면 </sub></b>
    </td>
  </tr>
</table>

### 4. 알레르기 원인 분석 기능
- 기능은 <a href="https://github.com/shinyeeun789/DodamDodam#3-%EC%95%8C%EB%A0%88%EB%A5%B4%EA%B8%B0-%EC%9B%90%EC%9D%B8-%EB%B6%84%EC%84%9D-%EA%B8%B0%EB%8A%A5">도담도담 v1.0.0</a>과 같음
- <a href="https://github.com/shinyeeun789/DodamDodam-Spring-/blob/master/src/main/resources/mappers/allergenMapper.xml">Mapper</a>에서 SELECT문 개선
#### 📷 View
<table>
  <tr>
    <td align="center">
      <img src="https://user-images.githubusercontent.com/70800414/234297991-ee49af06-b405-405e-8e44-f31dbf6c7ad8.png" width="500" alt=""/> <br/>
      <sub><b> PIC1 : 알레르기 원인 분석 페이지 </sub></b>
    </td>
  </tr>
</table>

### 5. 증상 발생 분석 기능
- <a href=""> 도담도담 v1.0.0과 동일</a>
#### 📷 View
<table>
  <tr>
    <td align="center">
      <img src="https://user-images.githubusercontent.com/70800414/234298540-3e7ba3f8-4945-40bc-9cd5-ee08a86c92c8.png" width="500" alt=""/> <br/>
      <sub><b> PIC1 : 증상 발생 분석 페이지 </sub></b>
    </td>
  </tr>
</table>

### 6. 식품 검색 기능
- 
#### 📷 View
<table>
  <tr>
    <td align="center">
      <img src="https://user-images.githubusercontent.com/70800414/234299704-3c70bede-aab9-4874-a9a1-d09ad323b01e.png" width="500" alt=""/> <br/>
      <sub><b> PIC1 : 식품 검색 페이지 </sub></b>
    </td>
  </tr>
</table>
