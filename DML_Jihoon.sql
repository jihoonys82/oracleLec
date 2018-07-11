SELECT * FROM emp;      -- employee table
SELECT * FROM dept;     -- departement table
SELECT * FROM bonus;    -- bonus table 
SELECT * FROM salgrade; -- salary grade table

select * from tabs;     -- accessiable table list by scott
SELECT TABLE_NAME FROM tabs;  -- view table name column

SELECT * FROM emp; -- alt + ' : change letter to uppercase, lowercase or first letter Uppercase. 
-- CASE is NoT sensitive.  Select SELECT select is all same in query statement. 

desc emp;

-- INSERT statement test 
-- 데이터를 테이블에 삽입할때 사용 
-- ctrl + / : single line comment 
desc dept;
INSERT INTO DEPT VALUES (90, '', ''); --  string type is wrapped by '' 
INSERT INTO DEPT VALUES (91, null, null); 
SELECT * FROM dept;

-- UPDATE statement test 
UPDATE dept 
SET loc = 'SEOUL';

-- DELETE statement test 
DELETE dept 
WHERE DEPTNO = 40; -- delete which has deptno 40 only.
SELECT * FROM dept;

select * from emp;
DELETE EMP; -- delete all data in emp table

--commit; -- 변뎡된 데이터 영구반영하기
--rollback; -- 변경된 데이터 반영하지 않기 


--DDL basic test 
--CREATE TABLE
CREATE TABLE test ( -- test table create 
    test1 NUMBER, -- number data column
    test2 VARCHAR2(10) -- character data column
);
-- DCL is not DML , so it is not required commit, rollback. 
desc test; --table 구조 (column, null, datatype) check
--desc is not SQL, it is a kind of ORACLE keyward. 

SELECT * FROM tabs;
SELECT * FROM tab;

--DELETE TABLE
DROP TABLE test;

--recyclebin : 오라클에서 제공하는 휴지통
SHOW recyclebin; -- check recyclebin 
FLASHBACK TABLE test TO BEFORE DROP; -- recycle from bin 
PURGE recyclebin; -- empty recyclebin

DROP TABLE test PURGE ;  -- delete table without recycling


-- SELECT STATEMENT 
SELECT * FROM emp;
SELECT empno, ename FROM emp; -- empno and ename only 

SELECT 
    empno AS 사번, 
    ename AS 사원이름 
FROM emp;

-- WHERE clause
SELECT empno, ename, deptno 
FROM emp 
--WHERE deptno=10;
--WHERE deptno>=20; -- same or bigger then 20 
WHERE deptno<>20; -- not 20

--논리연산자 
-- view the employee that deptno is 30 and job is NOT 'salesman';
SELECT empno, ename, deptno
FROM emp
WHERE deptno = 30
--    AND NOT(job='SALESMAN');
    AND JOB!='SALESMAN';    
    
-- deptno is NOT 30 and job is NOT SALESMAN.
SELECT empno, ename, deptno
FROM emp
WHERE NOT(deptno = 30
    OR job='SALESMAN');
--WHERE deptno!=30 AND job!="SALESMAN";


--기타연산자

--BETWEEN a AND b 
SELECT empno, ename FROM emp 
WHERE empno BETWEEN 7700 AND 7900;
--WHERE empno>=7700 AND empno<=7900;

-- NOT BETWEEN a AND b 
SELECT empno, ename FROM emp 
--WHERE empno NOT BETWEEN 7700 AND 7900;
WHERE empno<=7700 OR empno>=7900;

--IN(list)
SELECT empno, ename FROM emp 
WHERE empno IN (7369, 7521, 7654, 7777, 8888);
--WHERE empno = 7369
--    OR empno = 7521
--    OR empno = 7654
--    OR empno = 7777
--    OR empno = 8888;
SELECT empno, ename FROM emp 
WHERE empno NOT IN (7369, 7521, 7654, 7777, 8888);


-- LIKE
SELECT empno, ename FROM emp
--WHERE ename LIKE '%R%'; -- find all name has 'R' 
--WHERE ename LIKE '_A%'; -- Employ who has Second chracter is A in the name 
--WHERE ename LIKE '%RD'; -- RD로 끝나는 이름 
WHERE ename NOT LIKE '%R%';

SELECT empno, ename FROM emp 
--WHERE ename LIKE 'KING'; // Same result but it is NOT RECOMMANDED. 
WHERE ename = 'KING';


-- IS NULL
SELECT empno, ename FROM emp 
--WHERE mgr IS NULL;
--WHERE mgr = null; -- It is not working
WHERE mgr IS NOT NULL;


--QUIZ 

SELECT empno, ename, deptno FROM emp
WHERE deptno = 30 and job='SALESMAN'; 

SELECT empno, ename, deptno FROM emp
WHERE deptno = 30 and job<>'SALESMAN';

SELECT empno, ename, deptno FROM emp
WHERE NOT(deptno = 30 or job='SALESMAN');

SELECT empno, ename, deptno FROM emp
WHERE empno BETWEEN 7782 AND 7900;

SELECT empno, ename, deptno FROM emp
--WHERE ename BETWEEN 'A' AND 'Cz';
WHERE ename>='A' AND ename<'D';

SELECT empno, ename, deptno FROM emp
WHERE deptno IN (10, 30);


--ORDER BY clause
SELECT * FROM emp
--ORDER BY empno; -- 사번 오름차순
--ORDER BY ename; -- 이름 오름차순
ORDER BY ename DESC;

-- order by deptno then empno.
SELECT * FROM emp
ORDER BY deptno DESC, empno ASC;

-- Order by comm desc but null data move to last. 
SELECT * FROM emp
ORDER BY comm DESC NULLS LAST;

-- nulls 설정도 각각의 정렬기준에 적용된다.
SELECT * FROM emp
ORDER BY comm NULLS FIRST, ename;


SELECT * FROM emp
WHERE deptno=10
ORDER BY sal DESC;


-- DISTINCT
SELECT DISTINCT deptno, job
FROM emp
ORDER BY deptno;

-- Wrong usage (모든 컬럼이 일치하는것이 있다는건 잘못 만든 것임) 
SELECT DISTINCT * FROM emp;

-- || 문자열 연결 연산자 (|| is NOT mean 'OR')
SELECT ename || '''s job is ' || job AS "EMPLOYEE"
FROM emp;
    -- 


-- Single-row Function Test
SELECT ename, length(ename)
FROM emp;

-- Group Function Test 
SELECT SUM(sal)
FROM emp;


-- DUAL Table 
SELECT 'Apple' FROM dual;

SELECT 10+20 from emp; -- return 12(number of employee) of '30'
SELECT 10+20 FROM dual; --dummy table for return result. 
desc dual;

-- Numeric Function 
SELECT abs(-445) FROM dual;

--QUIZ
-- 12.523 -> 소수점이하 반올림
SELECT ROUND(12.523, 0) FROM DUAL;
-- -12.723 -> 소수점이하 반올림
SELECT ROUND(-12.723, 0) FROM DUAL;
-- 12.567 -> 소수점 3째자리에서 반올림
SELECT ROUND(12.567, 2) FROM DUAL;
-- 12345 -> 1의 자리에서 반올림
SELECT ROUND(12345, -1) FROM DUAL;
-- 56789 -> 10의 자리에서 반올림
SELECT ROUND(56789, -2) FROM DUAL;

-- 12.456 -> 소수점이하 버림
SELECT TRUNC(12.456, 0) FROM DUAL;
-- 12.456 -> 소수점 3째자리에서 버림
SELECT TRUNC(12.456, 2) FROM DUAL;
-- 12345 -> 1의자리에서 버림
SELECT TRUNC(12345, -1) FROM DUAL;
-- 56789 -> 10의자리에서 버림
SELECT TRUNC(56789, -2) FROM DUAL;

-- 13을 8로 나눈 나머지
SELECT MOD(13, 8) FROM DUAL;

-- 12.345 올림 -> 13
SELECT CEIL(12.345) FROM DUAL;
-- -12.567 올림 -> -12
SELECT CEIL(-12.567) FROM DUAL;

-- 12.567 내림 -> 12
SELECT FLOOR(12.567) FROM DUAL;
-- 12.123 내림 -> 12
SELECT FLOOR(12.123) FROM DUAL;
-- -12.567 내림 -> -13
SELECT FLOOR(-12.567) FROM DUAL;
-- -12.123 내림 -> -13
SELECT FLOOR(-12.123) FROM DUAL;

-- 3의 4제곱 -> 81
SELECT POWER(3,4) FROM DUAL;
-- 3의 -1 제곱 -> 0.33333333333
SELECT POWER(3,-1) FROM DUAL;

-- 9의 제곱근 -> 3
SELECT sqrt(9) FROM dual;

-- 11의 제곱근 -> 3.3166...
SELECT sqrt(11) FROM dual;



-- 문자 함수 Character Function 

--length() 
SELECT length(ename) FROM emp;
SELECT length('Apple') FROM dual;
SELECT length('안녕') FROM dual;

--lengthb()
SELECT lengthb('Apple') FROM dual;
SELECT lengthb('안녕') FROM dual; -- ORACLE using UTF-8 which needs 3byte for Korean characters. So, it returns 6 for 안녕

-- substr()
SELECT substr('Hello Oracle', 3) FROM dual;


-- Character Function Quiz 
-- 'hELlo' 모두 대문자로 변환 -> HELLO
SELECT UPPER('hELlO') FROM dual;
-- 'hELlo' 모두 소문자로 변환 -> hello
SELECT LOWER('hELlO') FROM dual;
-- 'hELlo' 이니셜(첫글자) 대문자 -> Hello
SELECT INITCAP('hELlO') FROM dual;

-- 'Alice Bob'의 문자열 길이 -> 9
SELECT LENGTH('Alice Bob') FROM dual;
-- '안녕하세요'의 문자열 길이 -> 5
SELECT LENGTH('안녕하세요') FROM dual;

-- 'Alice Bob' 문자열 바이트 수 -> 9
SELECT LENGTHB('Alice Bob') FROM dual;
-- 'ACE 안녕하세요'문자열 바이트 수 -> 19
SELECT LENGTHB('ACE 안녕하세요') FROM dual;
-- (오라클은 한글 인코딩을 UTF-8을 기본으로 하며
--  UTF-8은 한글 한글자에 3바이트가 필요하다)

-- 'ABCDEFGHI'에서 'D' 의 위치 -> 4
SELECT INSTR('ABCDEFGHI', 'D') FROM dual;
-- 'ABCDEFGHI'에서 'DEF'문자열의 위치 ->4
SELECT INSTR('ABCDEFGHI', 'DEF') FROM dual;
-- 'ABCDEFGHI'에서 'DF'문자열의 위치 -> 0
SELECT INSTR('ABCDEFGHI', 'DF') FROM dual;
-- '안녕하세요'에서 '하'문자열의 위치 -> 3
SELECT INSTR('안녕하세요', '하') FROM dual;
-- 'ABCABCDDD'에서 'C'문자열의 위치 -> 3
SELECT INSTR('ABCABCDDD', 'C') FROM dual;

--'Oracle SQL Developer'에서 5번째 인덱스 이후의 문자열로 자르기
SELECT substr('Oracle SQL Developer',6) FROM dual;
--'Oracle SQL Developer'에서 5번째 인덱스부터 5글자로 자르기
SELECT substr('Oracle SQL Developer',6, 5) FROM dual;
--'오라클 SQL'에서 2번째 인덱스부터 5글자로 자르기
SELECT substr('오라클 SQL', 2, 5) FROM dual;
--'안녕하세요오라클'에서 3번째 부터 자르기
SELECT substr('안녕하세요오라클', 3) FROM dual;

--Example
SELECT empno+1000, initcap(ename)
FROM emp
WHERE ename = 'SMITH';

-- LEFT PADDING
SELECT lpad('SQL', 5, '*') FROM dual; --fill * character
SELECT lpad('SQL', 10, '*-') FROM dual; 
SELECT lpad('SQL', 5) FROM dual; 
SELECT lpad('SQL', 5 , ' ') FROM dual; 
SELECT lpad('ABCDEFGHI', 5) FROM dual; 

-- RIGHT PADDING
SELECT rpad('SQL', 5, '*') FROM dual;

-- TRIM
SELECT 
    '   SQL   ', 
    ltrim('   SQL   ') AS "-",
    rtrim('   SQL   ') AS "-.",
    trim('   SQL   ') AS "-,",
    ltrim(rtrim('   SQL   ')) AS "-'" -- DB에 따라 trim대신 이렇게 써야하는경우도 있음
FROM dual;

SELECT TRIM(TRAILING '*' FROM '**SQL***') AS "-" FROM dual;
SELECT TRIM(LEADING FROM '     SQL    ') AS "-" FROM dual;
SELECT TRIM('A' FROM 'AAASQLAAAA') FROM dual;
SELECT TRIM('   SQL   ') FROM dual;


-- DATETIME function
SELECT sysdate FROM dual; --returns date but there is hidden time

SELECT TO_CHAR(sysdate, 'YYYY/MM/DD HH24:MI:SS') "NOW" FROM dual;

-- months_between : 두 datetime 사이의 개월수 차이 계산 
SELECT
    MONTHS_BETWEEN('18.01.01', '18-02-01') AS "1", 
    MONTHS_BETWEEN('18/01/01', '18/02/15') AS "2",
    ROUND(MONTHS_BETWEEN('18/01/01', '18/02/15'), 2) AS "3"
FROM dual;    
-- '18/01/01', '18.01.01', and '18-01-01' are chracter but ORACLE recognise it as datetime format. 

SELECT
    ename,
    months_between(sysdate, hiredate) "diff"
FROM emp;    

-- Addition at DATETIME
SELECT
    sysdate + 100   -- current date + 100 day
FROM dual;    

-- last_day : 지정된 datetime 달의 마지막 날 반환
SELECT
    last_day(sysdate),
    last_day('16/2/7')
FROM dual;    

-- next_day
SELECT
    next_day(sysdate, '금요일')
FROM dual;    

SELECT
    sysdate,
    systimestamp
FROM dual;    

-- TRUNC(date)
SELECT TO_CHAR(TRUNC(sysdate), 'YYYY/MM/DD HH24:MI:SS') FROM dual;

--CONVERSION FUNCTION

-- to_number
SELECT
    '123123' + 111111, -- auto casting from string '123123' to number 123123 
    to_number('123123') + 111111
FROM dual;    

-- to_date
SELECT
    '17/10/9' , -- DATEIME format VARCAHR2 datatype : can't add number 
    to_date('17/10/9') + 5 -- DATETIME datatype : +5 means add 5 days.
FROM dual;    

SELECT
    to_date('12 1 11'),
    to_date('12 1 11', 'dd mm yy')
FROM dual;

-- to_char (number)
SELECT
    to_char(12345) "1",
    to_char(12345, '99') "2",
    to_char(12345, '9999999999') "3",
    to_char(12345, '0000000000') "4",
    to_char(12345, '9900000000') "5"
FROM dual;    

SELECT
    to_char(12345, '$999999') "1",
    to_char(12345, '$99999') "2",
    to_char(12345, '$9999') "3",
    to_char(12345, 'L999999') "4" -- L: locale, indicate as Korean Won 
FROM dual;

SELECT
    to_char(12345.6789) "1",
    to_char(12345.6789, '99999.99') "2",
    to_char(12345.6789, '9,999,999.99') "3",
    to_char(12345.6, '99,999.99') "4"
FROM dual;    

-- to_char (datetime)
SELECT
--    to_char(sysdate, 'YYYY/MM/DD HH24:MI:SS DAY'),
--    to_char(sysdate, 'SCC'), -- SCC
--    to_char(to_date('1987/01/02'), 'SCC'),
--    to_char(sysdate, 'YEAR'),
--    to_char(sysdate, 'year'),
--    to_char(sysdate, 'Year'),
--    to_char(sysdate, 'YYYY'),
--    to_char(sysdate, 'YY'),
--    to_char(sysdate, 'YYY'),
--    to_char(sysdate, 'Y'),
--    to_char(sysdate, 'YYYYY'), -- YYYY Y 로 인식해서 20188출력
--    to_char(sysdate, 'MM'), 
--    to_char(sysdate, 'MONTH'), -- JANUARY
--    to_char(sysdate, 'MON'), -- 'JAN
--    to_char(sysdate, 'DD'),
--    to_char(sysdate, 'D'), -- Sunday:1, Monday:2 ... Saturday:7
--    to_char(sysdate, 'DDD'),
--    to_char(sysdate, 'DAY'),
--    to_char(sysdate, 'DY'),
--    to_char(sysdate, 'Q'), --Quater (분기)
--    to_char(to_date('2018/01/01'), 'Q'),
--    to_char(to_date('2018/04/01'), 'Q'),
--    to_char(to_date('2018/07/01'), 'Q'),
--    to_char(to_date('2018/10/01'), 'Q'),
--    to_char(sysdate, 'HH'),
--    to_char(sysdate, 'HH12'),
--    to_char(sysdate, 'HH24'),
--    to_char(sysdate, 'MI'),
--    to_char(sysdate, 'SS'),
--    to_char(sysdate, 'FF'), -- It is not working
--    to_char(sysdate, 'A.M.'),
--    to_char(sysdate, 
--        'YYYY"년" MM"월" DD"일"' || 
--        'AM HH24"시" MI"분" SS"초" DAY'),
--    to_char(sysdate, 'HH:MI YY-MM/DD'),
--    to_char(sysdate, 'ddth'),
--    to_char(sysdate, 'DdSP'),
--    to_char(sysdate, 'DdSPTH'),
--    to_char(sysdate, 'MMth'),
--    to_char(sysdate, 'MmSP'),
--    to_char(sysdate, 'MMSPTH'),
--    to_char(sysdate, 'SYYYY'), -- 기원전 표시를 위한 서식 SYYYY
--    to_char(to_date('-2100','SYYYY'), 'SYYYY'),
    to_char(systimestamp, 'MI:SS.FF3')
FROM dual;    


-- 기타 변환함수 

-- NVL
SELECT
    empno, ename, NVL(comm, 0)
FROM emp;    

-- NVL2
SELECT
    empno, ename, NVL2(comm, sal+comm, sal) AS "PAY"
FROM emp;

-- NULLIF
SELECT
    NULLIF(10,20),
    NULLIF(20,10),
    NULLIF(20,20)
FROM dual;    

-- DECODE
SELECT
    empno,
    ename,
    deptno,
    DECODE(deptno,
            10, '회계팀',
            20, '연구팀',
            30, '영업팀',
            40, '운영팀',
            '부서없음') dname
FROM emp;            

-- CASE statement 
SELECT 
    empno, ename, deptno,
    CASE deptno
        WHEN 10 THEN '회계팀'
        WHEN 20 THEN '연구팀'
        WHEN 30 THEN '운영팀'
        WHEN 40 THEN '운영팀'
        ELSE '부서없음'
    END dname
FROM emp;         

SELECT 
    empno, ename, deptno,
    CASE 
        WHEN job = 'PRESIDENT' THEN '사장'
        WHEN deptno = 10 THEN '회계팀'
        WHEN deptno = 20 THEN '연구팀'
        WHEN deptno = 30 THEN '운영팀'
        WHEN deptno = 40 THEN '운영팀'
        ELSE '부서없음'
    END dname
FROM emp;  
    
    
-- Group Function

-- COUNT(n)
SELECT count(*) FROM emp; -- 12 : Count all column 
SELECT count(1) FROM emp; -- 12 : same result (There is no performance issue anymore.)
SELECT count(empno) FROM emp; -- 12 
SELECT count(mgr) FROM emp; -- 11
SELECT count(comm) FROM emp; -- 4 : NULL is not counted. 

-- SUM
SELECT SUM(sal) tot_sal FROM emp;

-- AVG
SELECT AVG(sal) avg_sal FROM emp;

--MAX 
SELECT MAX(sal) max_sal FROM emp;

--MIN
SELECT MIN(sal) min_sal FROM emp;

SELECT MAX(hiredate) last_emp FROM emp;
SELECT MIN(hiredate) oldest_emp FROM emp;

SELECT
    min(sal) min_sal
FROM emp
WHERE deptno=10;


-- GROUP BY clause
SELECT
    deptno,
    SUM(sal) dept_tot_sal
FROM emp
GROUP BY deptno
ORDER BY deptno;

SELECT
    deptno,
    COUNT(empno)
FROM emp
GROUP BY deptno
ORDER BY deptno;

SELECT
    empno,deptno
FROM emp
GROUP BY empno,deptno
ORDER BY deptno; -- wrong Query

--QUIZ
SELECT
    deptno,
    CASE deptno
        WHEN 10 THEN '회계팀'
        WHEN 20 THEN '연구팀'
        WHEN 30 THEN '영업팀'
        WHEN 40 THEN '운영팀'
        ELSE '부서없음'
    END dname,
    COUNT(*) cnt,
    SUM(sal) tot_sal,
    ROUND(AVG(sal), 2) avg_sal
FROM emp
GROUP BY deptno
HAVING AVG(sal)>2000
ORDER BY deptno;



-- JOIN
SELECT * FROM emp;
SELECT * FROM emp,dept; -- CROSS JOIN
SELECT * FROM emp NATURAL JOIN dept;

desc emp;

INSERT INTO emp (empno, deptno) VALUES (9999,50); -- IT occurs ERROR
-- RA-02291: integrity constraint (SCOTT.FK_DEPTNO) violated - parent key not found 


-- EQUI JOIN
SELECT
    empno, ename, E.deptno, dname
FROM emp E, dept D
WHERE E.deptno = D.deptno   -- 조인조건
    AND empno>7500          -- 조회조건
ORDER BY deptno, empno;

-- INNER JOIN
SELECT
    empno, ename, E.deptno, dname
FROM emp E
INNER JOIN dept D 
    ON E.deptno = D.deptno  -- 조인조건
WHERE empno>7500            -- 조회조건
ORDER BY deptno, empno;    

-- Non-EQUI JOIN
SELECT * FROM emp;
SELECT * FROM salgrade;

SELECT ename, sal, grade
FROM emp E, salgrade S
WHERE E.sal BETWEEN S.losal and S.hisal;

-- Quiz. 위 쿼리를 ASNI표준문법으로 수정 (JOIN)
SELECT ename, sal, grade
FROM emp E
INNER JOIN salgrade S
    ON E.sal BETWEEN S.losal AND S.hisal;
    

-- SELF JOIN
SELECT E.empno, E.ename, E.mgr, M.ename AS "MGRNAME"
FROM emp E, emp M
WHERE E.mgr = M.empno
ORDER BY empno;
        
SELECT E.empno, E.ename, E.mgr, M.ename AS "MGRNAME"
FROM emp E 
INNER JOIN emp M
    ON E.mgr = M.empno
ORDER BY empno;

-- OUTER JOIN

-- RIGHT OUTER JOIN
SELECT empno, ename, d.deptno, dname
FROM emp e, dept d
WHERE e.deptno(+) = d.deptno
ORDER BY deptno, empno;

SELECT empno, ename, d.deptno, dname
FROM emp e 
RIGHT OUTER JOIN dept d
    ON e.deptno = d.deptno
ORDER BY deptno, empno;

-- LEFT OUTER JOIN
SELECT E.empno, E.ename, E.mgr, M.ename AS "MGRNAME"
FROM emp E, emp M
WHERE E.mgr = M.empno(+)  -- ORACLE Syntax 
ORDER BY empno;

SELECT E.empno, E.ename, E.mgr, M.ename AS "MGRNAME"
FROM emp E 
LEFT OUTER JOIN emp M
    ON E.mgr = M.empno  -- ANSI Syntax
ORDER BY empno;

-- FULL OUTER JOIN
CREATE TABLE test1 (no NUMBER);
CREATE TABLE test2 (no NUMBER);
INSERT INTO test1 VALUES (10);
INSERT INTO test1 VALUES (20);
INSERT INTO test1 VALUES (30);

INSERT INTO test2 VALUES (10);
INSERT INTO test2 VALUES (20);
INSERT INTO test2 VALUES (40);

SELECT * FROM test1;
SELECT * FROM test2;

SELECT *
FROM test1
FULL OUTER JOIN test2
    ON test1.no = test2.no
ORDER BY test1.no;    


--CROSS JOIN
SELECT * FROM salgrade; -- 5row 3col
SELECT * FROM dept;     -- 4row 3col

SELECT * FROM dept, salgrade;

SELECT * FROM salgrade CROSS JOIN dept;

-- NATURAL JOIN
SELECT empno, ename, deptno, dname
FROM emp
NATURAL JOIN dept
ORDER BY deptno;

-- INNER JOIN ~ USING()을 이용한 NATURAL JOIN
SELECT *
FROM emp
JOIN dept 
    USING (deptno)
ORDER BY deptno;    


--SUB QUERY
SELECT * 
FROM dept
WHERE deptno= 10;

SELECT deptno FROM emp WHERE ename = UPPER('king');

SELECT * 
FROM dept
WHERE deptno = (
    SELECT deptno 
    FROM emp 
    WHERE ename = UPPER('king')
);

SELECT d.*
FROM dept d , emp e
WHERE d.deptno = e.deptno
    AND ename=UPPER('King');


-- 전체 평균 임금보다 많이 받는 사원들 
SELECT empno, ename, sal 
FROM emp 
WHERE sal > (
    SELECT AVG(sal) 
    FROM emp
);

-- 가장 최근 입사한 사원 
SELECT empno, ename, hiredate
FROM emp
WHERE hiredate = (SELECT MAX(hiredate) FROM emp);

-- 전체 평균 임금보다 부서 별 평균임금이 높은 부서
-- Column : deptno, avg_sal 
SELECT deptno, ROUND(AVG(sal), 2) 
FROM emp
GROUP BY deptno
HAVING AVG(sal)> (
    SELECT AVG(sal) 
    FROM emp )
ORDER BY deptno;

-- IN-Line VIEW
SELECT E.deptno, dept.dname, avg_sal
FROM (SELECT deptno, ROUND(AVG(sal), 2) as avg_sal 
    FROM emp
    GROUP BY deptno
    HAVING AVG(sal)> (
        SELECT AVG(sal) 
        FROM emp )
) E
INNER JOIN dept
    ON E.deptno = dept.deptno
ORDER BY deptno;    

-- Scala SUBQUERY
SELECT 
    deptno,
    (SELECT dname FROM dept WHERE emp.deptno = dept.deptno) dname,
    ROUND(avg(sal), 2) avg_sal
FROM emp
GROUP BY deptno
HAVING avg(sal)> (
    SELECT AVG(sal) FROM emp)
ORDER BY deptno;    

SELECT
    empno,
    ename,
    deptno,
    (SELECT dname FROM dept D WHERE E.deptno = D.deptno) AS dname,
    (SELECT loc FROM dept D WHERE E.deptno = D.deptno) AS loc
FROM emp E
ORDER BY deptno, empno;

-- SUBQUERY 를 ORDER BY절에 사용하기
UPDATE dept
SET dname='ZACCOUNT'
WHERE deptno=10;

SELECT empno, ename, sal, deptno
FROM emp E
ORDER BY (
    SELECT dname 
    FROM dept D
    WHERE E.deptno = D.deptno
);    

-- 부서별 인원 구하기 
-- 40번 부서는 0명이라고 출력 
-- 서브쿼리 활용, 조인 활요 
-- deptno, dname, cnt_employee
SELECT D.deptno, D.dname, (SELECT COUNT(*) FROM emp E WHERE E.deptno = D.deptno) cnt_employee
FROM dept D;

SELECT D.deptno, D.dname, COUNT(E.empno) cnt_employee
FROM dept D
LEFT OUTER JOIN emp E 
    ON D.deptno = E.deptno
GROUP BY D.deptno, D.dname
ORDER BY deptno;

SELECT D.deptno, D.dname, COUNT(E.empno) cnt_employee
FROM dept D, emp E
WHERE D.deptno = E.deptno(+)
GROUP BY D.deptno, D.dname
ORDER BY deptno;


-- INLINE VIEW
SELECT * FROM (
    SELECT empno, ename FROM emp
    ORDER BY empno
) E
WHERE sal>2000; -- it doesn't work. There are only empno and ename.

-- ROWNUM -> MSSQL에는 TOP3 라는게 있어서 이삽질 안해도됨 
SELECT rownum, emp.* FROM emp; -- without emp. '*' is not working. because rownum and emp is recogised as different table.
SELECT rownum, e.* FROM (SELECT * FROM emp ) e; -- above works like this query. 

SELECT rownum, emp.* FROM emp
WHERE rownum <= 3
ORDER BY sal;

SELECT rownum, e.* FROM (
SELECT * FROM emp
ORDER BY sal DESC
) e
WHERE rownum BETWEEN 1 AND 3;


-- comm을 가장 많이 받는 TOP2를 조회 
-- Column : comm_top, emp.*

SELECT rownum AS comm_top, E.* FROM (
SELECT * FROM emp ORDER BY comm DESC NULLS LAST
) E
WHERE rownum <=2;


-- 다중 열 서브쿼리 
SELECT dname, empno, ename, sal 
FROM emp
JOIN dept USING(deptno)
WHERE (deptno, sal) = (
    SELECT deptno, MAX(sal) FROM emp
    WHERE deptno = 10
    GROUP BY deptno
);

SELECT dname, empno, ename, sal 
FROM emp
JOIN dept USING(deptno)
WHERE (deptno, sal) IN (
    SELECT deptno, MAX(sal) FROM emp
    GROUP BY deptno
);

-- 다중 행 서브쿼리
-- IN
SELECT DISTINCT sal FROM emp
WHERE job='SALESMAN'
ORDER BY sal;

--salesman 과 급여가 같은 페이를 받는 모든 직원 
SELECT * FROM emp
WHERE sal IN (
    SELECT DISTINCT sal 
    FROM emp
    WHERE job='SALESMAN' )
ORDER BY sal; 

-- ANY
SELECT * FROM emp
WHERE sal = ANY (
    SELECT DISTINCT sal 
    FROM emp
    WHERE job='SALESMAN' )
ORDER BY sal; 

SELECT * FROM emp
WHERE sal < ANY ( -- 1250, 1500, 1600
    SELECT DISTINCT sal 
    FROM emp
    WHERE job='SALESMAN' )
ORDER BY sal; 

SELECT * FROM emp
WHERE sal > ANY ( -- 1250, 1500, 1600
    SELECT DISTINCT sal 
    FROM emp
    WHERE job='SALESMAN' )
ORDER BY sal; 

-- ALL
SELECT * FROM emp
WHERE sal = ALL ( --2450, 2850, 2975
    SELECT DISTINCT sal 
    FROM emp
    WHERE job='MANAGER' )
ORDER BY sal; 

SELECT * FROM emp
WHERE sal < ALL ( 
    SELECT DISTINCT sal 
    FROM emp
    WHERE job='MANAGER' )
ORDER BY sal; 

SELECT * FROM emp
WHERE sal > ALL ( 
    SELECT DISTINCT sal 
    FROM emp
    WHERE job='MANAGER' )
ORDER BY sal; 

-- EXISTS
SELECT mgr FROM emp ORDER BY mgr;

SELECT *
FROM emp e  -- 7902, 7698,7566, 7782, 7839
WHERE EXISTS (
    SELECT empno
    FROM emp
    WHERE e.empno = mgr
)
ORDER BY mgr;

SELECT deptno, dname, loc
FROM dept d 
WHERE EXISTS (
    SELECT * FROM emp e
    WHERE d.deptno = e.deptno)
ORDER BY deptno;    

SELECT * FROM dept 
WHERE deptno IN (
    SELECT DISTINCT deptno FROM emp)
ORDER BY deptno;    

-- UNION
SELECT empno, ename, job FROM emp
WHERE job='SALESMAN'
UNION
SELECT empno, ename, job FROM emp
WHERE job='MANAGER'
ORDER BY job, empno;

-- UNION ALL 
SELECT empno, ename, sal FROM emp 
WHERE sal<1000
UNION ALL
SELECT empno, ename, sal FROM emp 
WHERE sal<2000
ORDER BY sal;

-- INTERSECT
SELECT empno, ename, sal FROM emp 
WHERE sal<1000
INTERSECT
SELECT empno, ename, sal FROM emp 
WHERE sal<2000
ORDER BY sal;

-- MINUS
SELECT empno, ename, sal FROM emp 
WHERE sal<2000
MINUS
SELECT empno, ename, sal FROM emp 
WHERE sal<1000
ORDER BY sal;



-- DML 

-- INSERT
desc emp;

INSERT INTO emp(empno,ename,job,mgr,hiredate,sal,comm,deptno)
VALUES (1001, 'ALICE', 'CLERK', 1003, '17/01/08', 800, NULL, 30);

SELECT * FROM emp WHERE empno=1001;

INSERT INTO emp
VALUES (1002, 'MORRIS', 'CLERK', 1003, '17/01/08', 800, null, 30);

SELECT * FROM emp WHERE empno<2000;

INSERT INTO emp 
SELECT 1003, 'MATHEW', 'SALESMAN', null, sysdate, 1500, 100, 30 FROM dual;

INSERT INTO emp (empno, ename)
VALUES (1010, 'BOB');

--Practice 
INSERT INTO emp (empno, ename, job) VALUES (1011, 'EDWARD', 'MANAGER');
INSERT INTO emp (empno, ename, sal) VALUES (1015, 'Richard', 2000);


-- CREATE TABLE
CREATE TABLE emp_research
AS 
SELECT * FROM emp; -- copy emp table 

SELECT * FROM emp_research;

-- DROP TABLE (delete table) 
DROP TABLE emp_research;

CREATE TABLE emp_research 
AS 
SELECT * FROM emp WHERE deptno=20;

CREATE TABLE emp_research
AS 
SELECT * FROM emp WHERE 1=0; -- copy only table column. but null, PK, FK are not copied. 

SELECT * FROM emp_research;

INSERT INTO emp_research
SELECT * FROM emp WHERE deptno = 20;

-- 30번 부서의 empno,ename 데이터를 INSERT 
INSERT INTO emp_research (empno, ename)
SELECT empno, ename FROM emp WHERE deptno = 30;

SELECT * FROM emp_research;


-- DELETE DATA; 
DELETE FROM emp_research;

-- INSERT ALL
INSERT ALL 
WHEN deptno = 20 
    THEN INTO emp_research 
WHEN deptno = 30
    THEN INTO emp_research (empno, ename)
    VALUES (empno, ename)
SELECT * FROM emp;


CREATE TABLE emp_hire
AS SELECT empno, ename, hiredate
    FROM emp WHERE 1=0;
    
CREATE TABLE emp_sal
AS SELECT empno, ename, sal 
    FROM emp WHERE 1=0;
    
desc emp_hire;
desc emp_sal;

SELECT * FROM emp WHERE hiredate<'1981/06/01';

INSERT ALL 
WHEN hiredate<'1981/06/01'
    THEN INTO emp_hire (empno, ename, hiredate)
    VALUES (empno, ename, hiredate)
WHEN sal>2000
    THEN INTO emp_sal
    VALUES (empno, ename, sal)
SELECT * FROM emp;

SELECT * FROM emp_hire;
SELECT * FROM emp_sal;

-- UPDATE  : WHERE 절 없으면 안됨!!!! 주의!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
SELECT * FROM emp 
-- UPDATE emp SET ename = 'MATT'
WHERE empno = 1003;

-- 미리 꼭 주석 처리하고 난 후 맨 뒤에서부터 드래그 해서 실행할것!!!!!!

-- commit;
-- rollback;

SELECT * FROM emp
-- UPDATE emp SET ename = 'Burger', job='King'
WHERE empno = 1001;


SELECT * FROM emp_hire;
-- UPDATE emp_hire SET hiredate=sysdate;

--commit;

-- DELETE 
SELECT * FROM emp
-- DELETE emp
WHERE empno=1002;
-- rollback;

SELECT * FROM emp_sal;
-- DELETE emp_sal;
-- commit;


-- MERGE
-- emp 테이블에서 10,20 부서인 인원 복사, --> emp_merge 

-- emp 테이블에서 20,30 부서를 조회 
-- emp_merge에 존재하는 사원이면 sal 10% 인상
-- emp_merge에 존재하지 않으면 원본 삽입
CREATE TABLE emp_merge
AS SELECT empno, ename, sal, deptno
FROM emp
WHERE deptno IN ( 10, 20);

SELECT * FROM emp_merge ORDER BY deptno, empno;

MERGE INTO emp_merge m
USING (
    SELECT empno, ename, deptno, sal
    FROM emp
    WHERE deptno IN (20,30)
) e
ON (e.empno = m.empno)
WHEN MATCHED THEN 
    UPDATE SET m.sal = ROUND(m.sal*1.1)
--    WHERE e.sal > 1500
WHEN NOT MATCHED THEN 
    INSERT (m.empno, m.ename, m.sal, m.deptno) 
    VALUES (e.empno, e.ename, e.sal, e.deptno);
--    WHERE e.sal > 1000;

SELECT * FROM emp_merge ORDER BY deptno, empno;
-- DELETE emp_merge;
-- DROP TABLE emp_merge;
