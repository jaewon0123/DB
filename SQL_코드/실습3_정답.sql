CREATE TABLE employee2
    AS
        SELECT
            *
        FROM
            employee;

INSERT INTO employee2 VALUES (
    '223',
    '김영수',
    '850101-1234567',
    'kim_ys@or.kr',
    '01012345678',
    'D1',
    'J4',
    'S2',
    3500000,
    0.1,
    '200',
    TO_DATE('2015/06/20', 'YYYY-MM-DD'),
    '',
    'N'
);

INSERT INTO department2 VALUES (
    'D10',
    '연구개발부',
    'L6'
);
/*

오류 보고 -
SQL 오류 : QRA-12899: value too large for column "KH_T"."DEPARTMENT2","DEPT_ID"(actual: 3, maximum: 2)

컬럼의 최대 크기가 2BYTE로 영어나 숫자로 2글자까지만 가능하지만
3글자를 작성하려 했기 때문에 에러 발생
-> department2 테이블에서 "DEPT_ID" 에 해당하는 컬럼의 크기를
    2에서 3으로 늘려주거나
    VARCHAR2로 변경해서 255까지 늘려주는 방법이 존재 -> VARCHAR2 알아서 공간크기를 조정
    CHAR 의 경우 공간 크기를 조정하지 못하기 때문에 처음부터 크기를 잘 선택
*/
INSERT INTO employee2 VALUES (
    '224',
    '이수진',
    '900101-2345678',
    'lee_sj@or.kr',
    '01098765432',
    'D2',
    'J2',
    'S3',
    3000000,
    0.15,
    '201',
    TO_DATE('2016/07/01', 'YYYY-MM-DD'),
    '',
    'N'
);

INSERT INTO department2 VALUES (
    'D11',
    '품질관리부',
    'L7'
);

INSERT INTO employee2 VALUES (
    '225',
    '박민수',
    '750303-3456789',
    'park_ms@op.kr',
    '01123456789',
    'D3',
    'J5',
    'S1',
    2800000,
    0.05,
    '202',
    TO_DATE('2017/08/15', 'YYYY-MM-DD'),
    '',
    'N'
);

INSERT INTO department2 VALUES (
    'D12',
    '재무부',
    'L8'
);

INSERT INTO employee2 VALUES (
    '226',
    '최은지',
    '860404-4567890',
    'choi_ej@or.kr',
    '01056789012',
    'D4',
    'J3',
    'S4',
    4200000,
    0.2,
    '203',
    TO_DATE('2018/09/25', 'YYYY-MM-DD'),
    '',
    'N'
);

INSERT INTO department2 VALUES (
    'D13',
    '홍보부',
    'L9'
);

INSERT INTO employee2 VALUES (
    '227',
    '장영호',
    '950505-5678901',
    'jang_yh@or.kr',
    '01067890123',
    'D5',
    'J1',
    'S5',
    5000000,
    0.25,
    '204',
    TO_DATE('2019/10/30', 'YYYY-MM-DD'),
    '',
    'N'
);

INSERT INTO department2 VALUES (
    'D14',
    '전략기획부',
    'L10'
);

SELECT
    *
FROM
    employee2
WHERE
    emp_id = '200';

/***** UPDATE 25 문제 정답 *****/
UPDATE employee2
SET
    email = 'sun_di_updated@or.kr',
    phone = '01012345678'
WHERE
    emp_id = '200';

SELECT
    *
FROM
    employee2
WHERE
    dept_code = 'D1';

UPDATE employee2
SET
    salary = salary * 1.10,
    bonus = bonus + 0.05
WHERE
    dept_code = 'D1';

UPDATE employee2
SET
    job_code = 'J5',
    dept_code = 'D3'
WHERE
    job_code = 'J2';

UPDATE employee2
SET
    salary = salary * 1.04,
    bonus = bonus + 0.02
WHERE
    hire_date > TO_DATE('2000-01-01', 'YYYY-MM-DD');

UPDATE employee2
SET
    manager_id = '210',
    dept_code = 'D5'
WHERE
    manager_id = '200';

UPDATE employee2
SET
    email = replace(email, 'or.kr', 'company.com'),
    phone = '010-XXXX-XXXX';
--PHONE = '010-'||SUBSTR(PHONE,4,4)||'-'||SUBSTR(PHONE,8);
--PHONE = REGEXP_REPLACE(PHONE,'(\d{3})(\d{4})(\d{4})','\1-\2-\3');
-- LIKE를 사용해서 변경
/*
SQL 오류: ORA-12899: value too large for column "KH_T"."EMPLOYEE2"."PHONE" (actual: 13, maximum: 12)
"missing expression" ->  "" 나 '' 잘 닫히지 않을때 뜸
*/

UPDATE employee2
SET
    salary = '4000000',
    job_code = 'J4'
WHERE
    sal_level = 'S3';

UPDATE EMPLOYEE2 SET ENT_DATE = TO_DATE('2024-09-12','YYYY-MM-DD'), ENT_YN = 'Y'
WHERE HIRE_DATE + TO_DATE('1997-09-12','YYYY-MM-DD');

UPDATE EMPLOYEE2 SET HIRE_DATE = TO_DATE('2023'||TO_CHAR(HIRE_DATE,'-MM-DD'),'YYYY-MM-DD'),ENT_YN = 'N';
UPDATE EMPLOYEE2 SET HIRE_DATE = '2023', ENT_YN = 'N';
ROLLBACK;

UPDATE EMPLOYEE2 SET EMAIL = SUBSTR(
    email, 1, instr ( email, '@' ) - 1
    || '@newcompany.com', phone = '011-XXXX-XXXX';

UPDATE EMPLOYEE2 SET BONUS = BONUS + 0.1 , PHONE = '01033334444'
WHERE DEPT_CODE = 'D4';

UPDATE EMPLOYEE2 SET SALARY = 4500000, PHONE = '01022223333'
WHERE DEPT_CODE = 'D8'
AND JOB_CODE = 'J2';

UPDATE EMPLOYEE2 SET EMAIL = 'example.com', 
DEPT_CODE = 'D10';
--REPLACE (EMAIL,'or.kr','example.com'), 


