/*** UPDATE 실습 ***/

-- D1 인사관리부 -> 인사팀
UPDATE department2 SET DEPT_TITLE = '인사팀'
WHERE DEPT_ID = 'D1';

-- D3 마케팅부 -> 마케팅팀
UPDATE department2 SET DEPT_TITLE = '마케팅팀'
WHERE DEPT_ID = 'D3';

-- D8 기술지원부 -> 기술지원팀
UPDATE department2 SET DEPT_TITLE = '기술지원팀'
WHERE DEPT_ID = 'D8';

SELECT * FROM department2
WHERE DEPT_ID = 'D8';

SELECT * FROM department2;

-- 수정된 내용을 저장하길 원한다면 COMMIT
-- 저장하지 않길 원한다면 ROLLBACK;
COMMIT;

UPDATE employee2 SET BONUS = 0.1
WHERE BONUS IS NULL;

SELECT EMP_NAME,BONUS FROM EMPLOYEE2;

ROLLBACK;

-- 모든 직원의 기본 급여 인상 EMPLOYEE2
UPDATE employee2 SET SALARY = SALARY * 1.1;

SELECT EMP_NAME,SALARY FROM EMPLOYEE2;
-- D9 부서의 모든 직원의 보너스를 0.4로 수정 EMPLOYEE2
UPDATE EMPLOYEE2 SET BONUS = 0.4
WHERE DEPT_CODE = 'D9';

SELECT DEPT_CODE,BONUS FROM employee2;

-- DEPT_CODE 가 NULL 인 직원은 D3 부서로 이동
UPDATE EMPLOYEE2 SET DEPT_CODE = 'D3'
WHERE DEPT_CODE IS NULL;

SELECT * FROM employee2;
-- 특정 입사일(2000-01-01) 이후 입사한 직원 급여 수정
-- HRIE_DATE
UPDATE employee2 SET SALARY = SALARY + 1000000
WHERE HIRE_DATE > TO_DATE('2000-01-01','YYYY-MM-DD');
-- 1997-09-12 에 입사한 직원 퇴사처리
-- ENY_YN
UPDATE employee2 SET ENT_YN = 'Y'
WHERE HIRE_DATE = TO_DATE('1997-09-12','YYYY-MM-DD');

ROLLBACK;

SELECT EMP_NAME,EMAIL FROM EMPLOYEE2;
-- 특정 도메인 주소 변경
UPDATE EMPLOYEE2 SET EMAIL = REPLACE(EMAIL,'or.kr','kh.kh');

SELECT EMP_NAME,EMAIL FROM EMPLOYEE2;

-- 핸드폰번호 EMPLOYEE2 에서 010뒤에 - 붙여서 변경
-- LIKE --> 무조건 맨 앞이 010 이어야하고 중간에 오는 010 변경 X
UPDATE EMPLOYEE2 SET PHONE = REPLACE(PHONE,'010','010-')
WHERE PHONE LIKE '010%';
/*
EMPLOYEE2"."PHONE" (ACTUAL:13,MAXIMUM:12)
-> 행 최대 크기 12자리로 설정해줬기 때문에 나중에 발생하는 에러
--> 행 최대 크기를 늘리거나 다시 돌아가기 ROLLBACK 설정
*/
-- 특정 입사일을 가진 직원의 입사일 변경
-- HIRE_DATE 1999-09-09 입사한직원 -> 2000-01-02

SELECT * FROM EMPLOYEE2;

UPDATE EMPLOYEE2 SET HIRE_DATE = TO_DATE('2000-01-02','YYYY-MM-DD')
WHERE HIRE_DATE = TO_DATE('1999-09-09','YYYY-MM-DD');

COMMIT;

ROLLBACK;

SELECT * FROM DEPARTMENT2;

UPDATE department2 SET DEPT_TITLE = '인사팀';

SELECT * FROM DEPARTMENT2;

ROLLBACK;


-- UPDATE 한 번에 여러 컬럼 업데이트

-- 진행하기전에 EMPLOYEE3 만들기
CREATE TABLE EMPLOYEE3 AS SELECT * FROM EMPLOYEE;

-- EMP_ID가 200인 직원의 이메일과 전화번호 업데이트
UPDATE employee3 SET EMAIL = 'ONE_SUN@or.kr', PHONE = '01012345678'
WHERE EMP_ID = '200';

SELECT EMP_ID, EMAIL, PHONE FROM EMPLOYEE3
WHERE EMP_ID = '200';

SELECT * FROM EMPLOYEE3;
-- D9 부서의 모든 직원의 급여 * 1.1 보너스 = 0.2
UPDATE EMPLOYEE3 SET SALARY = SALARY * 1.1 , BONUS = 0.2
WHERE DEPT_CODE = 'D9';

SELECT * FROM EMPLOYEE3;
-- J3 직무 코드를 가진 직원의 직무 코드와 부서코드 변경
-- J5 D5
UPDATE EMPLOYEE3 SET DEPT_CODE = 'D5', JOB_CODE = 'J5'
WHERE JOB_CODE = 'J3';

SELECT * FROM EMPLOYEE3;
-- 송은희 직원의 이름과 이메일 변경
-- 송은휘 SONGSONG@ro.kr
UPDATE EMPLOYEE3 SET EMP_NAME = '송은휘', EMAIL = 'SONGSONG@or.kr'
WHERE EMP_NAME = '송은희';

SELECT * FROM EMPLOYEE3;

ROLLBACK;

-- 차태연 직원의 이름과 급여변경
--> 차태형 8000000
UPDATE EMPLOYEE3 SET EMP_NAME = '차태형', SALARY = 8000000
WHERE EMP_NAME = '차태연';
--> EMPLOYEE3 해당하는 모든 직원의 이메일 도메인과
---> 부서코드 D4 변경
UPDATE EMPLOYEE3 SET EMAIL = REPLACE(EMAIL,'or.kr','kh.kh'), DEPT_CODE = 'D4';

SELECT * FROM EMPLOYEE3;

ROLLBACK;

-- EMPLOYEE3 전체 테이블 삭제
DELETE FROM EMPLOYEE2;

-- 완전 삭제 --> COMMIT

-- 되돌리기 --> ROLLBACK
COMMIT;

SELECT * FROM EMPLOYEE2;

DROP TABLE EMPLOYEE2;

COMMIT;