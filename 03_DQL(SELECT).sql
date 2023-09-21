-- DQL (SELECT)
/*
    DQL : Date Query Lanaguage == SELECT
        <SELECT>
            [문법]
                SELECT 칼럼1, 칼럼2, ....
                FROM 테이블 명;
            -데이터를 조회할때 사용
            -조회된 결과는 RESULT SET(결과 집합) 으로 표현된다.
            -테이블에 없는 칼럼을 조회하면 안됨
*/

-- EMPLOTEE 테이블에서 전체 사원의 사번(emo_id), 이름(emp_name), 월급(salary)을 조회
SELECT EMP_ID,EMP_NAME,SALARY
FROM employee;

-- EMPLOTEE 테이블에서 전체 사원의 모든 컬럼(*) 정보 조회
SELECT *
FROM employee;

/*
    <산술연산>
    SELECT 절에서 산술 연산 가능
    
    
*/

SELECT emp_name, salary*12 FROM EMPLOYEE;

--보너스 포함해서 조회
--산술 연산 중에 NULL값이 존재하면 결과값은 무조건 NULL
SELECT EMP_NAME,SALARY*12+NVL(BONUS,0) AS TOTAL FROM employee;

--EMPLOYEE 테이블에서 직원명, 입사일, 근무일수(오늘 날짜 - 입사일) 
    --FLOOR(숫자)반내림 --CEIL(숫자)반올림 --TRUNC(숫자,1)소숫점 없애기 -TO_CHAR(SYSTEMDATE'YYYY.MM.DD',) 날짜표시형식변경
SELECT 
    emp_name,
    FLOOR(SYSDATE-HIRE_DATE) AS "근무 일수                 ",
    TO_CHAR(HIRE_DATE, 'YYYY-MM-DD') as HIRE_DATE  
FROM employee;

--칼럼명에 별칭 (AS)

/*
    <리터럴> --고정된 값?
        SELECT 절에서 리터럴을 사용 가능
*/
SELECT EMP_NAME,EMAIL,123,'ABC'
FROM employee;

/************** 연습 *****************/
-- 사원 테이블에서 모든 사원의 모든 정보 조회
SELECT * FROM EMPLOYEE;

--사원 테이블에서 모든 사원의 이름, 이메일, 전화번호 조회
SELECT EMP_NAME, EMAIL, PHONE FROM employee;

--사원 테이블에서 모든 사원의 이름, 월급, 연봉 조회 (연봉은 월급*12로 계산) (단 연봉 조회 결과는 칼럼 별칭을 연봉으로 지정)
SELECT emp_name AS 직원명, salary AS 월급, salary*12 AS 연봉 FROM employee;

--사원 테이블에서 모든 사원의 직원코드(JOB_CODE) 조회 --DISTINCT 중복 제거
SELECT DISTINCT job_code AS 직원코드 FROM employee;

--부서 코드 조회
SELECT DISTINCT DEPT_CODE FROM employee;

-- 직원코드, 부서코드 조회 --GROUP BY 중복 제거
SELECT DISTINCT JOB_CODE, DEPT_CODE FROM EMPLOYEE;

/******************* 여기까지 ********************/

/*
    <연결 연산자>
        여러 개의 컬럼 값을 연결 / 리터럴 값을 연결
*/
    SELECT EMP_ID ||'사번을 가진' || emp_name ||'사원의 급여는'|| salary||'입니다' FROM employee;

/*
    <WHERE> -- != / ^= / <> 세 기호 모두 같지 않다라는 뜻을 의미한다.
        SELECT 칼럼 FROM 테이블명 WHERE 조건;
        조회하려는 ROW가 조건식을 만족해야 실행
        조건식에는 연산자 사용 가능
*/

-- 부서코드가 D9인 사원들의 모든 칼럼 조회
    SELECT * FROM employee WHERE dept_code = 'D9';

-- 부서코드가 D9이 아닌 사원들의 모든 칼럼 조회
    SELECT * FROM employee WHERE dept_code != 'D9';
    
-- EMPLOYEE 테이블에서 급여가 400만원 이상인 직원들의 직원명, 부서 코드, 급여 조회
SELECT EMP_NAME, dept_code, job_code, SALARY FROM employee WHERE salary >= 4000000;

-- 1. EMPLOYEE 테이블에서 재직 중(ENT_YN 컬럼 값이 'N')인 직원들의 사번, 이름, 입사일 조회 
SELECT emp_no, emp_name, hire_date FROM employee WHERE ENT_YN = 'N';

-- 2. EMPLOYEE 테이블에서 연봉이 5000이상인 직원의 직원명, 급여, 연봉, 입사일 조회
SELECT EMP_NAME,SALARY,SALARY*12 AS 연봉, HIRE_DATE FROM employee WHERE salary*12 >= 50000000;

-- EMPLOYEE 테이블에서 부서 코드가 D6이면서 급여가 300만원 이상인 직원들의 사번, 직원명, 부서 코드, 급여 조회
SELECT EMP_ID,EMP_NAME,dept_code,salary FROM employee where salary>=3000000 AND dept_code ='D6';

-- EMPLOYEE 테이블에서 급여가 400만원 이상, 직급 코드가 J2인 사원의 모든 컬럼 조회
SELECT * FROM employee WHERE salary >= 4000000 AND job_code = 'J2';

-- EMPLOYEE 테이블에서 급여가 350만원 이상 600만원 이하를 받는 직원의 사번, 직원명, 부서 코드, 급여 조회
SELECT EMP_ID,EMP_NAME,dept_code,salary FROM employee WHERE salary <= 6000000 AND salary >=3500000;

/*
    < BETWEEN A AND B >
    A이상 B 이하
*/
-- EMPLOYEE 테이블에서 급여가 350만원 이상 600만원 이하가 아닌 받는 직원의 사번, 직원명, 부서 코드, 급여 조회
    SELECT EMP_ID,EMP_NAME,dept_code,salary FROM employee WHERE salary NOT BETWEEN 3500000 AND 6000000;

-- EMPLOYEE 테이블에서 입사일 '90/01/01' ~ '01/01/01'인 사원의 모든 컬럼 조회
    SELECT * FROM employee WHERE hire_date BETWEEN '90/01/01' AND '01/01/01'
    ORDER BY hire_date;
    
/*
    
    <LIKE>
    [문법]
    WHERE 비교대상컬럼 LIKE '특정 패턴';
    
    - 비교하려는 컬럼 값이 지정된 특정 패턴에 만족할 경우 TRUE를 리턴한다.
    - 특정 패턴에는 '%', '_'를 와일드카드로 사용할 수 있다.
    - LIKE 안에 '%', '_'를 사용해야 한다면 이스케이프를 설정하고 써야한다. ESCAPE '\'
      '%' : 0글자 이상
        ex) 비교대상컬럼 LIKE '문자%'  => 비교대상컬럼 값 중에 '문자'로 시작하는 모든 행을 조회한다.
            비교대상컬럼 LIKE '%문자'  => 비교대상컬럼 값 중에 '문자'로 끝나는 모든 행을 조회한다.
            비교대상컬럼 LIKE '%문자%' => 비교대상컬럼 값 중에 '문자'가 포함되어 있는 모든 행을 조회한다.
            
      '_' : 1글자
        ex) 비교대상컬럼 LIKE '_문자'  => 비교대상컬럼 값 중에 '문자'앞에 무조건 한 글자가 오는 모든 행을 조회한다.
            비교대상컬럼 LIKE '__문자' => 비교대상컬럼 값 중에 '문자'앞에 무조건 두 글자가 오는 모든 행을 조회한다.

    ESCAPE : 특정 패턴 포함
        ex) SELECT * FROM employee WHERE email LIKE '___\_%' ESCAPE '\';
*/

-- EMPLOYEE 테이블에서 성이 전 씨인 사원의 사원명, 급여, 입사일 조회
SELECT EMP_ID,EMP_NAME,salary FROM employee WHERE emp_name LIKE '전%';

-- EMPLOYEE 테이블에서 이름 중에 '하'가 포함된 사원의 사원명, 주민번호, 부서 코드 조회
SELECT emp_name, EMP_NO, DEPT_CODE FROM employee WHERE emp_name LIKE '%하%';

-- EMPLOYEE 테이블에서 전화번호 4번째 자리가 9로 시작하는 사원의 모든칼럼 조회
SELECT emp_name, EMP_NO, DEPT_CODE, phone FROM employee WHERE phone LIKE '___9%';

--EMPLOYEE 테이블에서 이메일 중 _ 앞 글자가 3자리인 이메일 주소를 가진 사원의 사번 사원명, 이메일 조회
-- ex) sun_di@kh.or.kr, yoo_js@kh.or.kr, ...
SELECT * FROM employee WHERE email LIKE '___\_%' ESCAPE '\';
