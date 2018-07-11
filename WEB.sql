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
-- �����͸� ���̺� �����Ҷ� ��� 
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

--commit; -- ������ ������ �����ݿ��ϱ�
--rollback; -- ����� ������ �ݿ����� �ʱ� 


--DDL basic test 
--CREATE TABLE
CREATE TABLE test ( -- test table create 
    test1 NUMBER, -- number data column
    test2 VARCHAR2(10) -- character data column
);
-- DCL is not DML , so it is not required commit, rollback. 
desc test; --table ���� (column, null, datatype) check
--desc is not SQL, it is a kind of ORACLE keyward. 

SELECT * FROM tabs;
SELECT * FROM tab;

--DELETE TABLE
DROP TABLE test;

--recyclebin : ����Ŭ���� �����ϴ� ������
SHOW recyclebin; -- check recyclebin 
FLASHBACK TABLE test TO BEFORE DROP; -- recycle from bin 
PURGE recyclebin; -- empty recyclebin

DROP TABLE test PURGE ;  -- delete table without recycling


-- SELECT STATEMENT 
SELECT * FROM emp;
SELECT empno, ename FROM emp; -- empno and ename only 

SELECT 
    empno AS ���, 
    ename AS ����̸� 
FROM emp;

-- WHERE clause
SELECT empno, ename, deptno 
FROM emp 
--WHERE deptno=10;
--WHERE deptno>=20; -- same or bigger then 20 
WHERE deptno<>20; -- not 20

--�������� 
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


--��Ÿ������

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
--WHERE ename LIKE '%RD'; -- RD�� ������ �̸� 
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
--ORDER BY empno; -- ��� ��������
--ORDER BY ename; -- �̸� ��������
ORDER BY ename DESC;

-- order by deptno then empno.
SELECT * FROM emp
ORDER BY deptno DESC, empno ASC;

-- Order by comm desc but null data move to last. 
SELECT * FROM emp
ORDER BY comm DESC NULLS LAST;

-- nulls ������ ������ ���ı��ؿ� ����ȴ�.
SELECT * FROM emp
ORDER BY comm NULLS FIRST, ename;


SELECT * FROM emp
WHERE deptno=10
ORDER BY sal DESC;


-- DISTINCT
SELECT DISTINCT deptno, job
FROM emp
ORDER BY deptno;

-- Wrong usage (��� �÷��� ��ġ�ϴ°��� �ִٴ°� �߸� ���� ����) 
SELECT DISTINCT * FROM emp;

-- || ���ڿ� ���� ������ (|| is NOT mean 'OR')
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
-- 12.523 -> �Ҽ������� �ݿø�
SELECT ROUND(12.523, 0) FROM DUAL;
-- -12.723 -> �Ҽ������� �ݿø�
SELECT ROUND(-12.723, 0) FROM DUAL;
-- 12.567 -> �Ҽ��� 3°�ڸ����� �ݿø�
SELECT ROUND(12.567, 2) FROM DUAL;
-- 12345 -> 1�� �ڸ����� �ݿø�
SELECT ROUND(12345, -1) FROM DUAL;
-- 56789 -> 10�� �ڸ����� �ݿø�
SELECT ROUND(56789, -2) FROM DUAL;

-- 12.456 -> �Ҽ������� ����
SELECT TRUNC(12.456, 0) FROM DUAL;
-- 12.456 -> �Ҽ��� 3°�ڸ����� ����
SELECT TRUNC(12.456, 2) FROM DUAL;
-- 12345 -> 1���ڸ����� ����
SELECT TRUNC(12345, -1) FROM DUAL;
-- 56789 -> 10���ڸ����� ����
SELECT TRUNC(56789, -2) FROM DUAL;

-- 13�� 8�� ���� ������
SELECT MOD(13, 8) FROM DUAL;

-- 12.345 �ø� -> 13
SELECT CEIL(12.345) FROM DUAL;
-- -12.567 �ø� -> -12
SELECT CEIL(-12.567) FROM DUAL;

-- 12.567 ���� -> 12
SELECT FLOOR(12.567) FROM DUAL;
-- 12.123 ���� -> 12
SELECT FLOOR(12.123) FROM DUAL;
-- -12.567 ���� -> -13
SELECT FLOOR(-12.567) FROM DUAL;
-- -12.123 ���� -> -13
SELECT FLOOR(-12.123) FROM DUAL;

-- 3�� 4���� -> 81
SELECT POWER(3,4) FROM DUAL;
-- 3�� -1 ���� -> 0.33333333333
SELECT POWER(3,-1) FROM DUAL;

-- 9�� ������ -> 3
SELECT sqrt(9) FROM dual;

-- 11�� ������ -> 3.3166...
SELECT sqrt(11) FROM dual;



-- ���� �Լ� Character Function 

--length() 
SELECT length(ename) FROM emp;
SELECT length('Apple') FROM dual;
SELECT length('�ȳ�') FROM dual;

--lengthb()
SELECT lengthb('Apple') FROM dual;
SELECT lengthb('�ȳ�') FROM dual; -- ORACLE using UTF-8 which needs 3byte for Korean characters. So, it returns 6 for �ȳ�

-- substr()
SELECT substr('Hello Oracle', 3) FROM dual;


-- Character Function Quiz 
-- 'hELlo' ��� �빮�ڷ� ��ȯ -> HELLO
SELECT UPPER('hELlO') FROM dual;
-- 'hELlo' ��� �ҹ��ڷ� ��ȯ -> hello
SELECT LOWER('hELlO') FROM dual;
-- 'hELlo' �̴ϼ�(ù����) �빮�� -> Hello
SELECT INITCAP('hELlO') FROM dual;

-- 'Alice Bob'�� ���ڿ� ���� -> 9
SELECT LENGTH('Alice Bob') FROM dual;
-- '�ȳ��ϼ���'�� ���ڿ� ���� -> 5
SELECT LENGTH('�ȳ��ϼ���') FROM dual;

-- 'Alice Bob' ���ڿ� ����Ʈ �� -> 9
SELECT LENGTHB('Alice Bob') FROM dual;
-- 'ACE �ȳ��ϼ���'���ڿ� ����Ʈ �� -> 19
SELECT LENGTHB('ACE �ȳ��ϼ���') FROM dual;
-- (����Ŭ�� �ѱ� ���ڵ��� UTF-8�� �⺻���� �ϸ�
--  UTF-8�� �ѱ� �ѱ��ڿ� 3����Ʈ�� �ʿ��ϴ�)

-- 'ABCDEFGHI'���� 'D' �� ��ġ -> 4
SELECT INSTR('ABCDEFGHI', 'D') FROM dual;
-- 'ABCDEFGHI'���� 'DEF'���ڿ��� ��ġ ->4
SELECT INSTR('ABCDEFGHI', 'DEF') FROM dual;
-- 'ABCDEFGHI'���� 'DF'���ڿ��� ��ġ -> 0
SELECT INSTR('ABCDEFGHI', 'DF') FROM dual;
-- '�ȳ��ϼ���'���� '��'���ڿ��� ��ġ -> 3
SELECT INSTR('�ȳ��ϼ���', '��') FROM dual;
-- 'ABCABCDDD'���� 'C'���ڿ��� ��ġ -> 3
SELECT INSTR('ABCABCDDD', 'C') FROM dual;

--'Oracle SQL Developer'���� 5��° �ε��� ������ ���ڿ��� �ڸ���
SELECT substr('Oracle SQL Developer',6) FROM dual;
--'Oracle SQL Developer'���� 5��° �ε������� 5���ڷ� �ڸ���
SELECT substr('Oracle SQL Developer',6, 5) FROM dual;
--'����Ŭ SQL'���� 2��° �ε������� 5���ڷ� �ڸ���
SELECT substr('����Ŭ SQL', 2, 5) FROM dual;
--'�ȳ��ϼ������Ŭ'���� 3��° ���� �ڸ���
SELECT substr('�ȳ��ϼ������Ŭ', 3) FROM dual;

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
    ltrim(rtrim('   SQL   ')) AS "-'" -- DB�� ���� trim��� �̷��� ����ϴ°�쵵 ����
FROM dual;

SELECT TRIM(TRAILING '*' FROM '**SQL***') AS "-" FROM dual;
SELECT TRIM(LEADING FROM '     SQL    ') AS "-" FROM dual;
SELECT TRIM('A' FROM 'AAASQLAAAA') FROM dual;
SELECT TRIM('   SQL   ') FROM dual;


-- DATETIME function
SELECT sysdate FROM dual; --returns date but there is hidden time

SELECT TO_CHAR(sysdate, 'YYYY/MM/DD HH24:MI:SS') "NOW" FROM dual;

-- months_between : �� datetime ������ ������ ���� ��� 
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

-- last_day : ������ datetime ���� ������ �� ��ȯ
SELECT
    last_day(sysdate),
    last_day('16/2/7')
FROM dual;    

-- next_day
SELECT
    next_day(sysdate, '�ݿ���')
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
--    to_char(sysdate, 'YYYYY'), -- YYYY Y �� �ν��ؼ� 20188���
--    to_char(sysdate, 'MM'), 
--    to_char(sysdate, 'MONTH'), -- JANUARY
--    to_char(sysdate, 'MON'), -- 'JAN
--    to_char(sysdate, 'DD'),
--    to_char(sysdate, 'D'), -- Sunday:1, Monday:2 ... Saturday:7
--    to_char(sysdate, 'DDD'),
--    to_char(sysdate, 'DAY'),
--    to_char(sysdate, 'DY'),
--    to_char(sysdate, 'Q'), --Quater (�б�)
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
--        'YYYY"��" MM"��" DD"��"' || 
--        'AM HH24"��" MI"��" SS"��" DAY'),
--    to_char(sysdate, 'HH:MI YY-MM/DD'),
--    to_char(sysdate, 'ddth'),
--    to_char(sysdate, 'DdSP'),
--    to_char(sysdate, 'DdSPTH'),
--    to_char(sysdate, 'MMth'),
--    to_char(sysdate, 'MmSP'),
--    to_char(sysdate, 'MMSPTH'),
--    to_char(sysdate, 'SYYYY'), -- ����� ǥ�ø� ���� ���� SYYYY
--    to_char(to_date('-2100','SYYYY'), 'SYYYY'),
    to_char(systimestamp, 'MI:SS.FF3')
FROM dual;    


-- ��Ÿ ��ȯ�Լ� 

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
            10, 'ȸ����',
            20, '������',
            30, '������',
            40, '���',
            '�μ�����') dname
FROM emp;            

-- CASE statement 
SELECT 
    empno, ename, deptno,
    CASE deptno
        WHEN 10 THEN 'ȸ����'
        WHEN 20 THEN '������'
        WHEN 30 THEN '���'
        WHEN 40 THEN '���'
        ELSE '�μ�����'
    END dname
FROM emp;         

SELECT 
    empno, ename, deptno,
    CASE 
        WHEN job = 'PRESIDENT' THEN '����'
        WHEN deptno = 10 THEN 'ȸ����'
        WHEN deptno = 20 THEN '������'
        WHEN deptno = 30 THEN '���'
        WHEN deptno = 40 THEN '���'
        ELSE '�μ�����'
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
        WHEN 10 THEN 'ȸ����'
        WHEN 20 THEN '������'
        WHEN 30 THEN '������'
        WHEN 40 THEN '���'
        ELSE '�μ�����'
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
WHERE E.deptno = D.deptno   -- ��������
    AND empno>7500          -- ��ȸ����
ORDER BY deptno, empno;

-- INNER JOIN
SELECT
    empno, ename, E.deptno, dname
FROM emp E
INNER JOIN dept D 
    ON E.deptno = D.deptno  -- ��������
WHERE empno>7500            -- ��ȸ����
ORDER BY deptno, empno;    

-- Non-EQUI JOIN
SELECT * FROM emp;
SELECT * FROM salgrade;

SELECT ename, sal, grade
FROM emp E, salgrade S
WHERE E.sal BETWEEN S.losal and S.hisal;

-- Quiz. �� ������ ASNIǥ�ع������� ���� (JOIN)
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

-- INNER JOIN ~ USING()�� �̿��� NATURAL JOIN
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


-- ��ü ��� �ӱݺ��� ���� �޴� ����� 
SELECT empno, ename, sal 
FROM emp 
WHERE sal > (
    SELECT AVG(sal) 
    FROM emp
);

-- ���� �ֱ� �Ի��� ��� 
SELECT empno, ename, hiredate
FROM emp
WHERE hiredate = (SELECT MAX(hiredate) FROM emp);

-- ��ü ��� �ӱݺ��� �μ� �� ����ӱ��� ���� �μ�
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

-- SUBQUERY �� ORDER BY���� ����ϱ�
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

-- �μ��� �ο� ���ϱ� 
-- 40�� �μ��� 0���̶�� ��� 
-- �������� Ȱ��, ���� Ȱ�� 
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

-- ROWNUM -> MSSQL���� TOP3 ��°� �־ �̻��� ���ص��� 
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


-- comm�� ���� ���� �޴� TOP2�� ��ȸ 
-- Column : comm_top, emp.*

SELECT rownum AS comm_top, E.* FROM (
SELECT * FROM emp ORDER BY comm DESC NULLS LAST
) E
WHERE rownum <=2;


-- ���� �� �������� 
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

-- ���� �� ��������
-- IN
SELECT DISTINCT sal FROM emp
WHERE job='SALESMAN'
ORDER BY sal;

--salesman �� �޿��� ���� ���̸� �޴� ��� ���� 
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

-- 30�� �μ��� empno,ename �����͸� INSERT 
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

-- UPDATE  : WHERE �� ������ �ȵ�!!!! ����!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
SELECT * FROM emp 
-- UPDATE emp SET ename = 'MATT'
WHERE empno = 1003;

-- �̸� �� �ּ� ó���ϰ� �� �� �� �ڿ������� �巡�� �ؼ� �����Ұ�!!!!!!

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
-- emp ���̺��� 10,20 �μ��� �ο� ����, --> emp_merge 

-- emp ���̺��� 20,30 �μ��� ��ȸ 
-- emp_merge�� �����ϴ� ����̸� sal 10% �λ�
-- emp_merge�� �������� ������ ���� ����
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
