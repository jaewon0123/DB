/*
SELECT(조회)

지정된 테이블에서 원하는 데이터를 선택해서 조회하는 SQL

작성된 구문에 맞는 행, 열 데이터가 조회됨
->조회된 결과 행의 집합 == RESULT SET (결과 집합)

- RESULT SET 은 0 행 이상이 포함될 수 있음
-> 조건에 맞는 행이 없을 수 있다는 것
*/

/*
[SELECT 작성법 -1(기초)]

SELECT 컬럼명,컬럼명,...
FROM 테이블명;

-> 지정된 테이블 모든 행에서
컬럼명이 일치하는 컬럼값 조회

테이블의 모든 행 모든 컬럼 조회하는 방법
  *(asterisk) : 모든, 포함하다를 나타내는 기호
*/

--EMPLOYEE 테이블에서
--모든 행의 사번(EMP_ID),이름(EMP_NAME),급여(SALARY) 조회
SELECT EMP_ID,EMP_NAME,SALARY
FROM EMPLOYEE;

--EMPLOYEE 테이블에서 모든 행, 모든 컬럼 조회
SELECT *
FROM EMPLOYEE;

/*
컬럼 값 산술 연산

--컬럼 값 : 행과 열이 교차되는 테이블 한 칸에 작성된 값

-- SELECT문에 산술 연산을 직접 작성하면
--조회결과(RESULT SET)에 연산 결과가 반영되어 조회됨
*/

--EMPLOYEE 테이블에서
-- 모든 사원의 이름, 급여, 급여 + 100만원 조회
SELECT EMP_NAME,SALARY,SALARY + 1000000
FROM EMPLOYEE;

--EMPLOYEE 테이블에서
--모든 사원의 이름, 연봉(급여*12)조회
SELECT EMP_NAME,SALARY * 12 AS "연봉"
FROM EMPLOYEE;

/*
SYSDATE,SYSTIMESTAMP
--(시스템이 나타내고 있는)현재 시간

--SYSDATE : 현재시간(년,월,일,시,분,초) 조회
--SYSTIMESTAMP : 현재시간(년,월,일,시,분,초,MS+지역(local))조회

회원가입할 때 DB에 들어오는 현재 시간을 기록할 때 생성
컴퓨터에서 체크하는 시간을 기록할 때 사용


*/

/* 날짜 사용하기
DB에 저장된 날짜들 중에서 특수한 일정 기간을 조회하거나 변경하길 원할 때 사용

TO_DATE('문자열','패턴')
예를 들어 2024-05-01 자 이후 회원가입 한 회원 조회
TO DATE('2024-05-01','YYYY-MM-DD')
*/

/*
컬럼명 별칭 지정

별칭 지정 방법
1)컬럼명 AS "별칭" : 문자O,띄어쓰기O,특수문자O
2)컬럼명 "별칭" : 문자O,띄어쓰기O,특수문자O
3)컬럼명 별칭 : 문자O,띄어쓰기X,특수문자X
4)컬럼명 AS 별칭 : 문자O,띄어쓰기X,특수문자X
*/

--EMPLOYEE 테이블에서 이름,이메일 이메일에 @ 포함이라는 별칭
--1)컬럼명 AS "별칭"
SELECT EMP_NAME,EMAIL AS "이메일 @ 포함"
FROM EMPLOYEE;

--2)컬럼명 "별칭"
SELECT EMP_NAME,EMAIL "이메일 @ 포함"
FROM EMPLOYEE;

--3)컬럼명 별칭 띄어쓰기X,특수문자X
--띄어쓰기와 @ 사용불가
SELECT EMP_NAME,EMAIL 이메일포함
FROM EMPLOYEE;

--4)컬럼명 AS 별칭 띄어쓰기X,특수문자X
--띄어쓰기와 @ 사용불가
SELECT EMP_NAME,EMAIL AS 이메일포함
FROM EMPLOYEE;

/* 
DISTINCT(별개의, 전혀다른)
->중복 제거

--조회 결과 집합(RESULT SET)에서
지정된 컬럼의 값이 중복되는 경우
중복되는 값을 한 번만 표시할 때 사용

사용방법
SELECT DISTINCT 중복제거할컬럼명
FROM 테이블명
*/

--EMPLOYEE 테이블에서 모든 사원의 부서코드 조회
SELECT DEPT_CODE FROM EMPLOYEE;

--EMPLOYEE 테이블에서 사원이 존재하는 부서코드만 조회
SELECT DISTINCT DEPT_CODE
FROM EMPLOYEE;

--> D3 D4 D7 부서는 사원이 없기 때문에 조회되지 않음

-- EMPLOYEE 테이블에 존재하는 직급 코드의 종류 조회 JOB_CODE
SELECT DISTINCT JOB_CODE FROM EMPLOYEE;

/*
WHERE 절

-- 테이블에서 조건을 충족하는 행을 조회할 때 사용
-- WHERE 절에는 조건식(TRUE / FALSE) 만 작성

비교 연산자 : > , < , >= , <= , =(같다), != , <> (같지않다)
논리 연산자 : AND, OR, NOT

작성방법
SELECT 컬럼명,컬럼명,...
FROM 테이블명
WHERE 조건식;
--> 지정된 테이블 모든 행에서 컬럼명이 일치하는 컬럼 값 조회
*/
-- EMPLOYEE 테이블에서 급여가 300만원을 초과하는 사원의
-- 이름 급여 부서코드 조회
SELECT EMP_NAME, SALARY, DEPT_CODE
FROM EMPLOYEE
WHERE SALARY > 3000000;

-- EMPLOYEE 테이블에서 D9 부서의 해당하는 사원의 이름 조회
SELECT EMP_NAME
FROM EMPLOYEE
WHERE DEPT_CODE = 'D9';

-- EMPLOYEE 테이블에서 D9 부서의 해당하지 않는 사원의 이름 조회
SELECT EMP_NAME
FROM EMPLOYEE
WHERE DEPT_CODE != 'D9';

/*
NULL, NOT NULL

컬럼 값이 존재하지 않는 경우
IS NULL;

컬럼 값이 존재하는 경우
IS NOT NULL;
*/
--EMPLOYEE 테이블에서 DEPT_CODE 가 없는 사원 조회
SELECT * FROM EMPLOYEE WHERE DEPT_CODE IS NULL;

--EMPLOYEE 테이블에서 DEPT_CODE 가 있는 사원 조회
SELECT * FROM EMPLOYEE WHERE DEPT_CODE IS NOT NULL;

/*
컬럼명 BETWEEN (A) AND (B)
-- 컬럼의 값이 A 이상 B 이하면 TRUE

컬럼명 NOT BETWEEN (A) AND (B)
-- 컬럼의 값이 A 이상 B 이하면 FALSE
-- 컬럼의 값이 A 미만 또는 B 초과시 TRUE ||
*/

-- 월급이 300이상 500이하

SELECT EMP_NAME,SALARY 
FROM EMPLOYEE 
WHERE SALARY BETWEEN 3000000 AND 5000000;

-- 월급이 300 미만이거나 500 초과일 때

SELECT EMP_NAME,SALARY 
FROM EMPLOYEE 
WHERE SALARY NOT BETWEEN 3000000 AND 5000000;

/*
WHERE OR 사용해서 값1, 값2, 값3, ... 과 가은 표시를 진행하기 도 함

컬럼명 IN (값1,값2,값3,...)
-- 컬럼의 값이 () 내 값과 일치하면 TRUE

컬럼명 NOT IN (값1,값2,값3,...)
-- 컬럼의 값이 () 내 값과 일치하면 FALSE
-- 컬럼의 값이 () 내 값과 일치하지 않으면 TRUE
*/

---------------
/*** OR 사용 ***/
--EMPLOYEE 테이블에서
-- 부서코드가 'D5''D6''D9'인 사원의
--이름,부서코드,급여 조회
SELECT EMP_NAME, DEPT_CODE, SALARY
FROM EMPLOYEE
WHERE DEPT_CODE = 'D5'
OR DEPT_CODE = 'D6'
OR DEPT_CODE = 'D9';
---------------
/*** IN 사용 ***/
--EMPLOYEE 테이블에서
-- 부서코드가 'D5''D6''D9'인 사원의
--이름,부서코드,급여 조회
SELECT EMP_NAME, DEPT_CODE, SALARY
FROM EMPLOYEE
WHERE DEPT_CODE IN('D5','D6','D9');
---------------
/*** NOT IN 사용 ***/
--EMPLOYEE 테이블에서
-- 부서코드가 'D5''D6''D9' 아닌 사원의
--이름,부서코드,급여 조회
SELECT EMP_NAME, DEPT_CODE, SALARY
FROM EMPLOYEE
WHERE DEPT_CODE NOT IN ('D5','D6','D9');

/*
LIKE
비교하려는 값이 특정한 패턴을 만족시키면 조회하는 연산자
WHERE 컬럼명 LIKE '패턴'

%(포함)
- %A : 문자열이 앞은 어떤 문자든 포함되고 마지막은 A
    예 : %륨 검색창에 륨으로끝나는단어를 검색한 것과 비슷
    
- A% : 문자열에서 A로 시작하고 끝나는 것은 상관 없음
    예 : 림% 검색창에 림으로 시작하는 단어를 검색한 것과 비슷
    
- %A% : 문자열 시작과 끝 문자는 관계 없이 중간에 A가 들어가면 됨
    예 : %로% 검색창에 로가 중간에 들어가는 단어를 검색한 것과 비슷
    
_ 글자 수

- A_ : A뒤에 아무거나 한 글자만 있는 문자열
    예 : AB,A1,AQ,A가
        가_ : 가로 시작하는 두글자 단어만 검색
        나__ : 나로 시작하는 세글자 단어만 검색
        
- _A : A앞에 아무거나 한 글자만 있는 문자열
    예 : BA,1A,QA,가A
        _가 : 가로 끝나는 두글자 단어만 검색
        __나 : 나로 끝나는 세글자 단어만 검색
*/

-- EMPLOYEE 에서 성이 전씨인 사원의 사번 이름 조회
SELECT EMP_ID,EMP_NAME
FROM EMPLOYEE
WHERE EMP_NAME LIKE '전%';
-- EMPLOYEE 에서 이름이 수로 끝나는 사원의 사번,이름 조회
SELECT EMP_ID,EMP_NAME
FROM EMPLOYEE
WHERE EMP_NAME LIKE '%수';
-- EMPLOYEE 에서 하 가 포홤되는 사원의 사번, 이름 조회
SELECT EMP_ID,EMP_NAME
FROM EMPLOYEE
WHERE EMP_NAME LIKE '%하%';
-- EMPLOYEE 에서 이름이 전으로 시작하고 돈으로 끝나는 사원의 사번, 이름 조회
SELECT EMP_ID,EMP_NAME
FROM EMPLOYEE
WHERE EMP_NAME LIKE '전%돈';

-- 이메일의 아이디 글자 수가 5글자인 사원의
-- 이름 이메일 조회 5글자@
-- EMPLOYEE
SELECT EMP_NAME,EMAIL
FROM EMPLOYEE
WHERE EMAIL LIKE '____@%';
-- 이메일의 아이디 중 _ 앞 쪽의 글자수가 3글자인 사원의
--  사번 이름 이메일 조회
-- EMPLOYEE
SELECT EMP_NAME,EMAIL
FROM EMPLOYEE
WHERE EMAIL LIKE '___%';

-- ESCAPE 옵션 : LIKE 의미를 벗어나 단순 문자열로 인식
--> 적용범위 : 특수문자 뒤 한 글자
SELECT EMP_NAME,EMAIL
FROM EMPLOYEE
WHERE EMAIL LIKE '___#_%' ESCAPE'#';

/*
___세글자 의미

ESCAPE'#' 구분을 지을 것이다.
___LIKE 사용하는 3글자만 찾으라는 의미로 구분짓는 것
_% -> _로 된 글자 찾기

___#_% ___@%
_를 @처럼 사용하길 원했기 때문에 중간 # 넣어준 것

__#_% __돈%
_를 돈처럼 사용하길 원했기 때문에 중간 # 넣어준 것

LIKE'__#@%' ESCAPE # 에서 문자 그대로 @의미

^ 구분짓고 싶다.
LIKE '___^_%' ESCAPE'^';

* 구분짓고 싶음
LIKE '___*_%' ESCAPE'*';
*/

/*
DUAL(DUmmy tAbLe)
Dummy : 실제로 사용되지 않은 데이터
더미테이블 : 실제로 존재하지 않는 테이블
        -> 테이블 만들기는 번거롭고.. 뭔가 테스트나 사용은 해봐야겠고..
        -> 단순히 데이터를 조회하거나 확인할 때 사용
*/

-- 존재하지 않는 테이블을 이용해서 현재시간 확인하기
SELECT SYSDATE, SYSTIMESTAMP
FROM DUAL;

/*
WHERE 절 별칭 사용 불가 확인!
*/

-- 부서코드 D6 확인

SELECT EMP_NAME,DEPT_CODE AS "부서코드"
FROM EMPLOYEE
WHERE 부서코드 = 'D6';

--> 부서코드 컬럼이 존재하지 않음
----> 별칭은 우리가 눈에 보기 좋게 작성하는 별칭일 뿐
-----> WHERE 절에서 찾는데 사용할 수 없음

/*
그러나!!!
ORDER BY 절에서는 별칭 사용 가능!!
*/

SELECT EMP_NAME,SALARY * 12 AS "연봉"
FROM EMPLOYEE
ORDER BY 연봉 DESC;

--> ORDER BY 는 무언가를 컬럼에서 찾아오는 것이 아니라
---> 나타난 정보를 오름차순으로 정렬할지 내림차순으로 정렬할지
----> 정렬만 하기 때문에 별칭으로 사용할 수 있음

-- EMPLOYEE 테이블에서 이름,부서코드,급여를
-- 부서코드 오름차순, 급여 내림차순으로 조회
SELECT EMP_NAME,DEPT_CODE,SALARY
FROM EMPLOYEE
ORDER BY DEPT_CODE, SALARY DESC;
--EMPLOYEE 테이블에서 이름,부서코드,직급코드를
--부서코드 오름차순 직급코드 내림차순 이름 오름차순으로 , 활용해서 조회
SELECT EMP_NAME AS "이름",DEPT_CODE AS "부서코드", JOB_CODE AS "직급코드"
FROM EMPLOYEE
ORDER BY 부서코드 ASC, 직급코드 DESC, 이름;


/*

|| 연결 연산자
--문자열 이어쓰기
+나,로 연결하지 않고 || 를 사용해서 연결

*/

SELECT EMP_ID || EMP_NAME 
FROM EMPLOYEE;

SELECT EMP_NAME||'의 월급은'||SALARY||'원 입니다.'
FROM EMPLOYEE;

-- 직급 코드가 J5인 사원의 수를 조회
-- J5 몇명?
SELECT COUNT(*) AS "J5 COUNT"
FROM EMPLOYEE
WHERE JOB_CODE = 'J5';

-- 사원의 이름과 이메일을 결합해서 조회
SELECT EMP_NAME||'('||EMAIL||')'
FROM EMPLOYEE;

-- 사원의 이름과 전화번호를 - 사용해서 조회
SELECT EMP_NAME ||'-'||  PHONE 
FROM EMPLOYEE;
-- 사원의 사번과 부서코드를 - 사용해서 조회
SELECT EMP_ID || '-' || DEPT_CODE 
FROM EMPLOYEE;
-- 사원의 이름과 급여를 이름 : 급여 형식으로 조회 AS 이름 : 급여
SELECT EMP_NAME || ':' || SALARY AS "이름 : 급여" FROM EMPLOYEE;
-- 사원의 이름 - 연봉 형식으로 조회
SELECT EMP_NAME || '-' || SALARY * 12 AS "이름 - 연봉" FROM EMPLOYEE;

/*****
ORDER BY 절

SELECT 문의 조회 결과(RESULT SET)를 정렬할 때 사용하는 구문

*** SELECT 구문에서 제일 마지막에 해석됨 ***

[작성법]
SELECT 컬럼명, 컬럼명 AS "별칭", 컬럼명, ...
FROM 테이블명
WHERE 조건식
ORDER BY 컬럼명 | 별칭 | 컬럼순서 [오름 내림 차순]

컬럼순서의 기본 값은 오름차순
오름차순 : ASC (ASCending)
내림차순 : DESC (DESCending)
*****/

-- EMPLOYEE 테이블에서 모든 사원의 이름, 급여 조회
-- 급여는 오름차순으로 정렬
SELECT EMP_NAME,SALARY
FROM EMPLOYEE
ORDER BY SALARY ASC;

-- EMLOYEE 테이블에서 모든 사원의 이름,급여 조회
-- 급여는 내림차순으로 정렬
SELECT EMP_NAME,SALARY
FROM EMPLOYEE
ORDER BY SALARY DESC;

-- EMPLOYEE 테이블에서
-- 부서코드가 D5,D6,D9인 사원의
-- 사번,이름,부서코드를
-- 부서코드 오름차순으로 조회
SELECT EMP_ID,EMP_NAME,DEPT_CODE
FROM EMPLOYEE
WHERE DEPT_CODE IN ('D5','D6','D9')
ORDER BY DEPT_CODE; -- ASC 기본값이기 때문에 오름차순 생략 가능

/* 컬럼순서를 이용해서 정렬하는 방법 */
--EMPLOYEE 테이블에서
-- 급여가 300만원 이상, 600만원 이하인 사원의
-- 사번 이름 급여를 이름 내림차순으로 조회
SELECT EMP_ID,EMP_NAME,SALARY
FROM EMPLOYEE
WHERE SALARY BETWEEN 3000000 AND 6000000
ORDER BY EMP_NAME DESC;

-- EMP_NAME : 현재 2번 째 자리에 위치하는 순서를 이용해서 ORDER BY를 구할 수 있음
SELECT EMP_ID,EMP_NAME,SALARY
FROM EMPLOYEE
WHERE SALARY BETWEEN 3000000 AND 6000000
ORDER BY 2 DESC; -- 2 = EMP_NAME
-- 만약에 EMP_ID 로 ORDER BY 에서 정렬하길 원한다면 1을 작성
-- 만약에 SALARY 로 ORDER BY 에서 정렬하길 원한다면 3을 작성

-- ORDER BY 절에 수식 적용 --
-- EMPLOYEE 테이블에서 이름,연봉을 연봉 내림차순 조회
SELECT EMP_NAME,SALARY * 12
FROM EMPLOYEE
ORDER BY SALARY * 12 DESC; -- 월급 * 12달 = 연봉 내림차순 조회

-- ** ORDER BY 로 정렬을 진행할 경우에는
-- SELECT 절에 작성된 컬럼을 그대로 따라 작성한 경우가 많음 **--

/* ORDER BY 절에서 별칭 사용하기 */
--> SELECT 절 해석 이후 ORDER BY 절이 해석되기 때문에
-- SELECT 절에서 해석된 별칭을 ORDER BY 절에서 사용할 수 있음
-- EMPLOYEE 테이블에서 이름,연봉을 연봉 내림차순 조회
SELECT EMP_NAME,SALARY * 12 AS "연봉"
FROM EMPLOYEE
ORDER BY 연봉 DESC; -- SALARY * 12 대신 "연봉" 을 작성할 수 있음
-- 주의할 점 : ORDER BY에서는 별칭 사용이 가능하지만
-- WHERE 절의 경우 조건이기 때문에 별칭 사용이 불가능
-- ORDER BY 는 결과를 가지고 결과 정리를 하는 표현방법
-- WHERE 은 결과를 나타내기 위해 찾는 조건문이기 때문
-- 조건이 뭔가 진행도 안됐는데 별칭부터 붙인 것이기 때문

/* 정렬 중첩 */

-- 먼저 작성된 정렬 기준을 깨지 않고
-- 다음 작성된 정렬 기준 적용
-- 각각 다른 정렬이 된 것

--EMPLOTEE 테이블에서 이름, 부서코드,급여를
--부서코드 오름차순,급여 내림차순 조회
--정렬해서 부서코드 어떻게 돼 있고, 급여 가장 높은 금액만 궁금한 것
--누가 높게 받는지 궁금한 것은 아님
SELECT EMP_NAME,DEPT_CODE,SALARY
FROM EMPLOYEE
ORDER BY DEPT_CODE, SALARY DESC;

-- EMPLOYEE 테이블에서
-- 이름,부서코드,직급코드 를
-- 부서코드 오름차순 직급코드 내림차순 이름 오름차순
SELECT EMP_NAME AS "이름", DEPT_CODE AS "부서코드", JOB_CODE AS "직급코드"
FROM EMPLOYEE
ORDER BY "부서코드" ASC, "직급코드" DESC, "이름"; -- 이름은 자동으로 오름차순 정렬

/*
부서코드 1번 정렬
제일 먼저 부서코드가 오름차순으로 정렬
D1 D2 D5 D6 D8 D9 NULL 순서로 정렬

그 다음에
동일한 부서코드 내에서 직급 코드가 내림차순 정렬
D1의 부서의 경우 내림차순 이기 때문에 J7이 J6보다 먼저 정렬

그 다음에
동일한 부서코드와 직급코드 내에서 이름이 오름차순으로 정렬

D1 부서에서는 직급코드 J7이 J6보다 먼저 작성되고,
그 다음 J7은 단독이기 때문에 정렬할 수 있는게 없음
J6 에서는 2명 이상이 존재하기 때문에 J6 직급의 직원들의 이름이 오름차순 정렬

컬럼 위치랑 관계없이 정렬표기
*/
-- 위에서 작성한 ORDER BY 순으로 컬럼을 보길 원한다면 아래와 같이 작성
SELECT DEPT_CODE AS "부서코드", JOB_CODE AS "직급코드", EMP_NAME AS "이름"
FROM EMPLOYEE
ORDER BY 부서코드 ASC, 직급코드 DESC, 이름 ASC;