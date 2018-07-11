-- CREATE TABLE
CREATE TABLE type_test_01 (
    data1 NUMBER,
    data2 NUMBER(10),
    data3 NUMBER(5,2),
    data4 NUMBER(4,5)
);
desc type_test_01;

-- data1 NUMBER
INSERT INTO type_test_01(data1) VALUES (23421304579234659234528345);
SELECT * FROM type_test_01;

-- 38개의 유효숫자만 남고 나머지는 0으로 채워짐
INSERT INTO type_test_01(data1) VALUES (12345678901234567890123456789012345678901234567890);
SELECT * FROM type_test_01;

--DELETE type_test_01;

-- data2 NUMBER(10)
INSERT INTO type_test_01(data2) VALUES (123.4567);
SELECT * FROM type_test_01;

-- data3 NUMBER(5,2)
INSERT INTO type_test_01(data3) VALUES (123.4567);
INSERT INTO type_test_01(data3) VALUES (23.65);
INSERT INTO type_test_01(data3) VALUES (23.6567);   -- 실수부 넘친건 반올림
INSERT INTO type_test_01(data3) VALUES (2374.6567); -- 정수부 넘친건 ERROR
SELECT * FROM type_test_01;

-- data3 NUMBER(4,5)
INSERT INTO type_test_01(data4) VALUES (1234);      -- 에러
INSERT INTO type_test_01(data4) VALUES (0.12300);   -- 에러 유효숫자가 5자리기 때문
INSERT INTO type_test_01(data4) VALUES (0.01234);   -- 소수점 5자리까지, 유효숫자는 4개까지만(가장 낮은 자리수부터 4자리)
SELECT * FROM type_test_01;


--VARCHAR2(10)
CREATE TABLE type_test_02 (
    data VARCHAR2(10)
);
desc type_test_02;
INSERT INTO type_test_02 VALUES ('1234567890');
INSERT INTO type_test_02 VALUES ('123456789012345');   --ERROR
INSERT INTO type_test_02 VALUES ('일이삼사오육칠팔구십'); --ERROR
INSERT INTO type_test_02 VALUES ('일이삼');             -- Korean is 3byte per chracter.
SELECT * FROM type_test_02;

CREATE TABLE type_test_03 (
    data1 VARCHAR2 (10 BYTE),
    data2 VARCHAR2 (10 CHAR)
);
desc type_test_03;
INSERT INTO type_test_03 VALUES ('1234567890','1234567890');
INSERT INTO type_test_03(data2) VALUES ('일이삼사오육칠팔구십'); --ERROR
INSERT INTO type_test_03(data1) VALUES ('일이삼');             -- Korean is 3byte per chracter.
SELECT * FROM type_test_03;

-- CHAR(n)
CREATE TABLE type_test_04 (
    data1 CHAR,
    data2 CHAR(10),
    data3 CHAR(10 CHAR)
--    , data4 VARCHAR2  -- VARCHAR2는 반드시 크기 지정 필요
);

INSERT INTO type_test_04 
VALUES ('1', '1234567890', '1234567890');

INSERT INTO type_test_04(data2, data3)
VALUES ('가나다', '일이삼사오육칠팔구십');

INSERT INTO type_test_04(data2, data3)
VALUES ('12345','12345');

SELECT * FROM type_test_04;

SELECT TRIM(data1),TRIM(data2),TRIM(data3) FROM type_test_04;
--commit;

-- DATE 
CREATE TABLE type_test_05 (
    data DATE
);

INSERT INTO type_test_05 VALUES (sysdate);
INSERT INTO type_test_05 VALUES ('2020/11/21');

INSERT INTO type_test_05
VALUES (to_date('-2012/11/24', 'syyyy/mm/dd')); -- 기원전을 표기하기 위해 syyyy 사용

SELECT * FROM type_test_05;
SELECT TO_CHAR(data, 'syyyy/mm/dd hh24:mi:ss') FROM type_test_05; -- syyyy가 없으면 기원전이 제대로 표헌되지 않음

--년도 YY, RR 
INSERT INTO type_test_05
VALUES (to_date('10/7/3', 'rr/mm/dd'));
INSERT INTO type_test_05
VALUES (to_date('80/8/5', 'rr/mm/dd'));

INSERT INTO type_test_05
VALUES (to_date('10/7/3', 'yy/mm/dd'));
INSERT INTO type_test_05
VALUES (to_date('80/8/5', 'yy/mm/dd'));

SELECT * FROM type_test_05;
SELECT TO_CHAR(data, 'yyyy/mm/dd') FROM type_test_05;


--TIMESTAMP
CREATE TABLE type_test_06 (
    data TIMESTAMP
);
INSERT INTO type_test_06 VALUES (systimestamp);

SELECT * FROM type_test_06;

--LONG
CREATE TABLE type_test_07 (
    data LONG
    --, data2 LONG --LONG 은 테이블당 하나만 가능
);
INSERT INTO type_test_07 VALUES ('안녕하세요');
INSERT INTO type_test_07 VALUES ('행복스럽고 귀는 가장 것이다. 못하다 풀이 투명하되 영락과 어디 이것을 봄바람이다. 이것을 내는 있는 과실이 그리하였는가? 봄바람을 이상 속잎나고, 사랑의 사막이다. 얼마나 힘차게 날카로우나 거친 그들에게 인류의 얼음과 커다란 이것이다. 무엇을 인생을 구하지 있다. 귀는 피고 그들의 그들은 소금이라 봄바람이다. 못할 불러 피고 속에서 오아이스도 풀이 가슴에 사막이다. 풀이 이상 인생을 크고 미묘한 맺어, 어디 아니다. 보는 가치를 구하지 희망의 못하다 열락의 아니더면, 바이며, 청춘의 약동하다.
할지니, 돋고, 온갖 청춘을 있는 끓는다. 이상의 대고, 뛰노는 바이며, 위하여서. 천고에 불어 그들은 풍부하게 만천하의 들어 이상을 예가 사막이다. 가치를 예가 속잎나고, 뿐이다. 것은 길지 따뜻한 없으면, 얼마나 피부가 끝에 열락의 힘있다. 실로 이상을 자신과 새가 이것은 것이 봄바람이다. 있을 따뜻한 충분히 현저하게 공자는 살았으며, 사는가 찬미를 가진 이것이다. 살 우리 보내는 열락의 품으며, 앞이 없으면 것은 그것을 것이다. 방황하였으며, 거친 아름답고 이상 없으면 얼음이 것은 속에 불어 위하여서. 설산에서 내려온 보배를 맺어, 이성은 모래뿐일 사막이다. 군영과 사람은 안고, 약동하다.
것은 능히 청춘은 들어 같은 할지니, 내는 쓸쓸한 봄날의 봄바람이다. 불어 보배를 품고 아름다우냐? 사랑의 품고 같은 품에 못할 것이다. 거친 위하여 끝에 것이 것이다. 아름답고 영원히 열매를 타오르고 가치를 남는 따뜻한 물방아 것이다. 발휘하기 투명하되 생명을 새 위하여 보이는 품으며, 듣기만 듣는다. 쓸쓸한 대한 너의 목숨을 피어나기 바이며, 피다. 광야에서 청춘 눈이 하여도 칼이다. 끓는 발휘하기 위하여서, 그와 품에 그들은 오직 보내는 운다.
발휘하기 그들의 있는 대한 그들은 듣는다. 이상은 이상을 것이 온갖 실현에 행복스럽고 가는 피다. 안고, 구하지 동산에는 피어나기 영락과 되는 힘있다. 이것이야말로 설레는 영원히 끓는 방황하였으며, 품고 남는 황금시대다. 우리의 용감하고 든 간에 싹이 그러므로 옷을 풍부하게 봄바람이다. 더운지라 못할 때까지 안고, 때문이다. 생생하며, 구할 이것이야말로 보배를 위하여 위하여서. 내려온 품고 그들의 가는 피부가 열락의 것이다. 황금시대의 그림자는 무엇이 보내는 힘차게 얼음이 사막이다.
천자만홍이 붙잡아 인생을 앞이 미묘한 그리하였는가? 뜨거운지라, 방지하는 주는 안고, 광야에서 것은 가지에 있는가? 황금시대의 보이는 인류의 그들은 위하여 것은 피어나는 청춘의 이상은 철환하였는가? 관현악이며, 대중을 무엇을 그들에게 이상 황금시대다. 그들에게 싶이 대중을 같이, 뿐이다. 힘차게 꾸며 피에 하는 인간의 놀이 불어 부패뿐이다. 같지 대고, 뜨고, 피다. 미묘한 이것은 노년에게서 인생에 때까지 없으면 자신과 것이다. 꽃 이상의 않는 있는가?');
INSERT INTO type_test_07 VALUES ('Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque magna mi, varius eget finibus nec, feugiat eu orci. Proin interdum erat ex, ut commodo felis eleifend non. Vivamus eu malesuada massa. Ut id est et velit porta posuere ut volutpat nibh. Integer rhoncus ex eget nunc dignissim, nec ornare ipsum cursus. Aliquam a gravida eros. Morbi porta volutpat lectus, vitae ullamcorper turpis luctus non. Vivamus eu rhoncus tortor, at viverra enim. Aenean et sollicitudin ligula.
Duis non turpis ac orci tempus iaculis non non ipsum. Vestibulum fringilla laoreet tortor, nec finibus purus interdum in. Maecenas eget ligula in ligula laoreet porta a quis ante. Quisque porttitor fringilla sem finibus semper. Curabitur maximus vitae dolor a efficitur. Donec orci urna, ultrices sit amet nisl non, pulvinar efficitur ante. Proin eleifend lorem ac libero dictum egestas. Interdum et malesuada fames ac ante ipsum primis in faucibus. Nulla in nunc non dui congue cursus nec ac tortor. Morbi metus felis, eleifend at efficitur vitae, tristique ac massa. Nulla sit amet nulla sit amet magna suscipit ornare id sed sem. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Sed elementum turpis at convallis condimentum. Phasellus interdum eros mi, tincidunt facilisis ante dapibus eget.
Nulla facilisi. Aenean nec augue consequat, tincidunt libero ac, imperdiet elit. Ut quis metus placerat, accumsan turpis sit amet, vestibulum ex. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer finibus sapien id nunc tempus, vestibulum maximus mauris aliquet. Morbi eu urna tincidunt, laoreet justo ac, ullamcorper magna. Maecenas congue, lectus ac dictum fermentum, erat magna consectetur nibh, sit amet tempor tellus mauris at metus. Cras tincidunt viverra odio nec tempus. Vestibulum fermentum justo sed sapien auctor, sit amet ultricies velit aliquam. Aliquam tempus massa nulla, eu tristique est sagittis id. Mauris ac urna vel odio gravida feugiat. Maecenas vulputate nisi non velit sodales, congue fringilla dui feugiat. Fusce et dictum nisi.
Suspendisse non eleifend est. Proin nec ultricies lectus, et tincidunt turpis. Sed semper scelerisque consectetur. In eu ex sed purus blandit laoreet. Nullam porta neque vel nisi tristique, sit amet sollicitudin massa egestas. Nullam lorem felis, efficitur ac volutpat id, malesuada vitae elit. Nunc interdum sed magna at hendrerit. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Morbi id tempor nulla. Donec finibus pharetra varius. Quisque accumsan id mauris vel dictum. Duis non nibh at augue consectetur ultricies vitae nec purus. Nullam congue leo lacus, et gravida ipsum sollicitudin quis. Proin fermentum ex erat, viverra elementum tellus venenatis eget. Duis in eros nunc.
Aliquam vel nisi lorem. Suspendisse et elementum enim, et consequat massa. Ut sed fringilla quam, ut dapibus lorem. Cras fermentum sed nunc vitae convallis. Nulla eget diam varius, auctor mauris ac, varius tellus. Nam pharetra eros enim, ac malesuada neque ornare eget. Duis a velit convallis justo tincidunt porta sit amet at nibh. Curabitur aliquam tempus placerat. Proin ullamcorper enim gravida, sollicitudin lacus id, scelerisque dolor. Praesent varius maximus tellus vel auctor. Cras convallis sagittis condimentum. Ut id elementum metus. Nulla auctor commodo turpis id iaculis. Proin auctor imperdiet congue. Donec tristique sollicitudin augue, condimentum vulputate mauris faucibus quis. Proin eu aliquet ligula.');
SELECT * FROM type_test_07;


-- CLOB 
CREATE TABLE type_test_08 (
    data CLOB
);
INSERT INTO type_test_08 VALUES ('Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque magna mi, varius eget finibus nec, feugiat eu orci. Proin interdum erat ex, ut commodo felis eleifend non. Vivamus eu malesuada massa. Ut id est et velit porta posuere ut volutpat nibh. Integer rhoncus ex eget nunc dignissim, nec ornare ipsum cursus. Aliquam a gravida eros. Morbi porta volutpat lectus, vitae ullamcorper turpis luctus non. Vivamus eu rhoncus tortor, at viverra enim. Aenean et sollicitudin ligula.
Duis non turpis ac orci tempus iaculis non non ipsum. Vestibulum fringilla laoreet tortor, nec finibus purus interdum in. Maecenas eget ligula in ligula laoreet porta a quis ante. Quisque porttitor fringilla sem finibus semper. Curabitur maximus vitae dolor a efficitur. Donec orci urna, ultrices sit amet nisl non, pulvinar efficitur ante. Proin eleifend lorem ac libero dictum egestas. Interdum et malesuada fames ac ante ipsum primis in faucibus. Nulla in nunc non dui congue cursus nec ac tortor. Morbi metus felis, eleifend at efficitur vitae, tristique ac massa. Nulla sit amet nulla sit amet magna suscipit ornare id sed sem. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Sed elementum turpis at convallis condimentum. Phasellus interdum eros mi, tincidunt facilisis ante dapibus eget.
Nulla facilisi. Aenean nec augue consequat, tincidunt libero ac, imperdiet elit. Ut quis metus placerat, accumsan turpis sit amet, vestibulum ex. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer finibus sapien id nunc tempus, vestibulum maximus mauris aliquet. Morbi eu urna tincidunt, laoreet justo ac, ullamcorper magna. Maecenas congue, lectus ac dictum fermentum, erat magna consectetur nibh, sit amet tempor tellus mauris at metus. Cras tincidunt viverra odio nec tempus. Vestibulum fermentum justo sed sapien auctor, sit amet ultricies velit aliquam. Aliquam tempus massa nulla, eu tristique est sagittis id. Mauris ac urna vel odio gravida feugiat. Maecenas vulputate nisi non velit sodales, congue fringilla dui feugiat. Fusce et dictum nisi.
Suspendisse non eleifend est. Proin nec ultricies lectus, et tincidunt turpis. Sed semper scelerisque consectetur. In eu ex sed purus blandit laoreet. Nullam porta neque vel nisi tristique, sit amet sollicitudin massa egestas. Nullam lorem felis, efficitur ac volutpat id, malesuada vitae elit. Nunc interdum sed magna at hendrerit. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Morbi id tempor nulla. Donec finibus pharetra varius. Quisque accumsan id mauris vel dictum. Duis non nibh at augue consectetur ultricies vitae nec purus. Nullam congue leo lacus, et gravida ipsum sollicitudin quis. Proin fermentum ex erat, viverra elementum tellus venenatis eget. Duis in eros nunc.
Aliquam vel nisi lorem. Suspendisse et elementum enim, et consequat massa. Ut sed fringilla quam, ut dapibus lorem. Cras fermentum sed nunc vitae convallis. Nulla eget diam varius, auctor mauris ac, varius tellus. Nam pharetra eros enim, ac malesuada neque ornare eget. Duis a velit convallis justo tincidunt porta sit amet at nibh. Curabitur aliquam tempus placerat. Proin ullamcorper enim gravida, sollicitudin lacus id, scelerisque dolor. Praesent varius maximus tellus vel auctor. Cras convallis sagittis condimentum. Ut id elementum metus. Nulla auctor commodo turpis id iaculis. Proin auctor imperdiet congue. Donec tristique sollicitudin augue, condimentum vulputate mauris faucibus quis. Proin eu aliquet ligula.');
SELECT * FROM type_test_08;

-- LOB 일부 조회하기
SELECT DBMS_LOB.SUBSTR(data, 10, 2) FROM type_test_08;

-- LOB 전체 조회하기
SELECT DBMS_LOB.SUBSTR(data, length(data),1) FROM type_test_08;


--제약조건, 제약사항 

--사용자의 모든 제약사항(자료사전) 
SELECT * FROM USER_Constraints;

-- 컬럼에 해당하는 제약사항 (자료사전)
SELECT * FROM USER_CONS_COLUMNS;


SELECT
	SUBSTR(A.COLUMN_NAME,1,15) COLUMN_NAME,
	DECODE(B.CONSTRAINT_TYPE,
		'P','PRIMARY KEY',
		'U','UNIQUE KEY',
		'C','CHECK OR NOT NULL',
		'R','FOREIGN KEY'
	) CONSTRAINT_TYPE,
	A.CONSTRAINT_NAME,
    SEARCH_CONDITION
FROM USER_CONS_COLUMNS A, USER_CONSTRAINTS B
WHERE A.TABLE_NAME = UPPER('&table_name')
	AND A.TABLE_NAME = B.TABLE_NAME
	AND A.CONSTRAINT_NAME = B.CONSTRAINT_NAME
ORDER BY 1;

SELECT * FROM USER_CONSTRAINTS; -- 사용자의 모든 제약사항
SELECT * FROM USER_CONS_COLUMNS; -- 컬럼에 해당하는 제약사항 조회


-- CONSTRAINTS

-- NOT NULL
CREATE TABLE cons_01 (
    data VARCHAR2(10) NOT NULL
);    
desc cons_01;
SELECT * FROM USER_CONSTRAINTS
WHERE table_name = upper('cons_02');

CREATE TABLE cons_02 (
    data VARCHAR(10) CONSTRAINT cons_02_nn NOT NULL
);    

CREATE TABLE cons_03 (
    data VARCHAR(10)
);    

-- 만들어져 있는 테이블에 제약조건 반영 (CONSTRAINT 이름 필수)
ALTER TABLE cons_03 
ADD CONSTRAINT cons_03_uq UNIQUE (data);

INSERT INTO cons_03 VALUES ('111');

-- NULL 제약조건 반영하기 
ALTER TABLE cons_03
MODIFY data NOT NULL;

SELECT * FROM USER_CONSTRAINTS
WHERE table_name = upper('cons_03');


--CHECK 
CREATE TABLE cons_04 (
    data NUMBER CHECK (data>=1 AND data<= 100)
);
INSERT INTO cons_04 VALUES (10);
INSERT INTO cons_04 VALUES (333);
INSERT INTO cons_04 VALUES (100);

-- cons_05 테이블 생성 (data NUMBER)
CREATE TABLE cons_05 (
    data NUMBER
);    

-- ALTER 이용한 data 에 제약사항 check 추가 1000, 2000, 3000, 4000
ALTER TABLE cons_05
ADD CONSTRAINT cons_05_ck CHECK ( data IN (1000,2000,3000,4000));

INSERT INTO cons_05 VALUES (1000);
INSERT INTO cons_05 VALUES (1001);
INSERT INTO cons_05 VALUES (2000);

SELECT * FROM cons_05;
SELECT * FROM USER_CONSTRAINTS
WHERE table_name = upper('cons_05');


--DEFAULT
CREATE TABLE cons_06 (
    data1 NUMBER DEFAULT 10,
    data2 DATE,
    data3 VARCHAR2(10)
);    
desc cons_06;
-- 제약조건 자료사전 
SELECT * FROM USER_CONSTRAINTS
WHERE table_name = UPPER('cons_06'); -- Noting on Constraint Data dictionary. 
-- 테이블 컬럼 정보 자료사전 
SELECT * FROM USER_TAB_COLUMNS
WHERE table_name = UPPER('cons_06'); -- see 'DATA_DEFAULT' 

-- 테이블의 컬럼 변경 
ALTER TABLE cons_06
MODIFY (data2 DEFAULT sysdate);
ALTER TABLE cons_06
MODIFY (data3 DEFAULT 'HI' NOT NULL);
-- 테이블의 제약조건 추가 
--ALTER TABLE cons_06
--ADD CONSTRAINT 

--명식적으로 NULL을 INSERT 할 때에는 DEFAULT 동작 안함
INSERT INTO cons_06 VALUES ( null, null, 'AA');

INSERT INTO cons_06(data3) VALUES ('BB');
INSERT INTO cons_06(data1) VALUES (5);
--INSERT INTO cons_06 ; -- 안됨
--INSERT INTO cons_06 VALUES (); -- 안됨
SELECT * FROM cons_06;


--PRIMARY KEY
CREATE TABLE cons_07 (
    no NUMBER CONSTRAINT cons_07_pk PRIMARY KEY,
    data VARCHAR2(20) NOT NULL 
);    

CREATE TABLE cons_08 (
    no NUMBER PRIMARY KEY 
);

CREATE TABLE cons_09 (
    no NUMBER,
    data VARCHAR2(20),
    CONSTRAINT cons_09_pk PRIMARY KEY (no, data)
);

CREATE TABLE cons_10 (
    idx NUMBER,
    data VARCHAR2(20)
);
ALTER TABLE cons_10
ADD CONSTRAINT cons_10_pk PRIMARY KEY (idx);

--제약조건 삭제 (PK 삭제)
ALTER TABLE cons_10
DROP CONSTRAINT cons_10_pk;

--제약조건 비활성화 (PK 잠깐 끄기) 
ALTER TABLE cons_10
DISABLE CONSTRAINT cons_10_pk;
--다시 활성화
ALTER TABLE cons_10
ENABLE CONSTRAINT cons_10_pk;


--FOREIGN KEY
desc cons_10;
CREATE TABLE cons_11 (
    num NUMBER,
    data VARCHAR2(20),
    CONSTRAINT cons_11_fk 
        FOREIGN KEY (num) 
        REFERENCES cons_10 (idx)
);

CREATE TABLE cons_12 (
    num NUMBER,
    data VARCHAR2(20)
);
ALTER TABLE cons_12
ADD CONSTRAINT cons_12_fk
    FOREIGN KEY (num)
    REFERENCES cons_10 (idx);
    

SELECT * FROM cons_10;
INSERT INTO cons_10 VALUES ( 11, 'A');
INSERT INTO cons_10 VALUES ( 22, 'B');
INSERT INTO cons_10 VALUES ( 33, 'C');

INSERT INTO cons_12 VALUES ( 11, 'Alice');
INSERT INTO cons_12 VALUES ( 22, 'Bob');
INSERT INTO cons_12 VALUES ( 44, 'Dave'); -- It occurs ERROR. integrity constraint (SCOTT.CONS_12_FK) violated

DELETE cons_10
WHERE idx = 11; -- ERROR! integrity constraint (SCOTT.CONS_12_FK) violated - child record found

DELETE cons_10
WHERE idx = 33; -- Deleted well!

ALTER TABLE cons_12 
DROP CONSTRAINT cons_12_fk;

ALTER TABLE cons_12 
ADD CONSTRAINT cons_12_fk 
    FOREIGN KEY (num) 
    REFERENCES cons_10 (idx)
    ON DELETE CASCADE;  -- 참조중인 값이 지워지면 함께 지워짐, 사용을 권장하진 않음. 
-- ORACLE 을 제외하고는 ON UPDATE CASCADDE 를 넣으면 업데이트 할때 cascade 되게 할 수 있음. 
-- 둘다 할때에는 이어서 ON DELETE CASCADE ON UPDATE CASCADE 라고 쓰면 됨


SELECT * FROM cons_10;
SELECT * FROM cons_12;

DELETE cons_10
WHERE idx = 11; -- Now, it works! :)


--ALTER TABLE 
CREATE TABLE alter_test (
    empno NUMBER(4),
    ename VARCHAR2(30),
    CONSTRAINT pk_alter_test PRIMARY KEY (empno) 
);

INSERT INTO alter_test 
SELECT empno, ename FROM emp;

SELECT * FROM alter_test;

desc emp;

-- sal 컬럼 추가
ALTER TABLE alter_test
ADD (sal NUMBER(7,2));
-- add job column
ALTER TABLE alter_test
ADD (job VARCHAR2(9));

-- emp 테이블의 sal, job값을 alter_test에 반영 
UPDATE alter_test a SET (a.sal, a.job) = (
    SELECT sal, job FROM emp e
    WHERE a.empno = e.empno);

SELECT * FROM alter_test;

desc alter_test;
desc emp;

--COLUMN 변경 (기존 데이터의 값보단 커야한다)
ALTER TABLE alter_test
MODIFY (ename VARCHAR2(10));
desc alter_test;
SELECT * FROM alter_test;

--sal, job 을 모두 null로 
UPDATE alter_test 
SET sal = NULL, job = NULL;

--job 컬럼 data type 변경 - 데이터가 하나도 없을때만 가능
ALTER TABLE alter_test
MODIFY (job NUMBER);

--job 컬럼을 100으로 변경
UPDATE alter_test 
SET job = 100;

-- ERROR : job 컬럼에 데이터가 있는데 다른 데이터타입으로 변경 시도.
ALTER TABLE alter_test
MODIFY (job VARCHAR2(9));

--컬럼 삭제 
ALTER TABLE alter_test
DROP COLUMN job; -- 위험하고, 오래걸림. 지우는 중에는 table 락 발생하여 서비스에 차질이 생길 수 있다. 

--컬럼 비활성화 (복구 불가)
ALTER TABLE alter_test
SET UNUSED (sal);
desc alter_test;

--비활성화 된 컬럼 삭제하기 
ALTER TABLE alter_test
DROP UNUSED COLUMNS;

--비활성화 된 컬럼들 자료사전 
ALTER TABLE alter_test
SET UNUSED (ename);

SELECT * FROM USER_UNUSED_COL_TABS;

desc alter_test;

--컬럼명 변경 
ALTER TABLE alter_test
RENAME COLUMN empno to eno;

--테이블명 변경 
ALTER TABLE alter_test
RENAME TO alter_test_tb;

SELECT * FROM alter_test_tb;

--commit;

--DELETE FROM 
DELETE alter_test_tb;
SELECT * FROM alter_test_tb;
rollback;

--TRUNCATE 
TRUNCATE TABLE alter_test_tb;
SELECT * FROM alter_test_tb;

--DROP TABLE
DROP TABLE alter_test_tb;

