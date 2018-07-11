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

-- 38���� ��ȿ���ڸ� ���� �������� 0���� ä����
INSERT INTO type_test_01(data1) VALUES (12345678901234567890123456789012345678901234567890);
SELECT * FROM type_test_01;

--DELETE type_test_01;

-- data2 NUMBER(10)
INSERT INTO type_test_01(data2) VALUES (123.4567);
SELECT * FROM type_test_01;

-- data3 NUMBER(5,2)
INSERT INTO type_test_01(data3) VALUES (123.4567);
INSERT INTO type_test_01(data3) VALUES (23.65);
INSERT INTO type_test_01(data3) VALUES (23.6567);   -- �Ǽ��� ��ģ�� �ݿø�
INSERT INTO type_test_01(data3) VALUES (2374.6567); -- ������ ��ģ�� ERROR
SELECT * FROM type_test_01;

-- data3 NUMBER(4,5)
INSERT INTO type_test_01(data4) VALUES (1234);      -- ����
INSERT INTO type_test_01(data4) VALUES (0.12300);   -- ���� ��ȿ���ڰ� 5�ڸ��� ����
INSERT INTO type_test_01(data4) VALUES (0.01234);   -- �Ҽ��� 5�ڸ�����, ��ȿ���ڴ� 4��������(���� ���� �ڸ������� 4�ڸ�)
SELECT * FROM type_test_01;


--VARCHAR2(10)
CREATE TABLE type_test_02 (
    data VARCHAR2(10)
);
desc type_test_02;
INSERT INTO type_test_02 VALUES ('1234567890');
INSERT INTO type_test_02 VALUES ('123456789012345');   --ERROR
INSERT INTO type_test_02 VALUES ('���̻�����ĥ�ȱ���'); --ERROR
INSERT INTO type_test_02 VALUES ('���̻�');             -- Korean is 3byte per chracter.
SELECT * FROM type_test_02;

CREATE TABLE type_test_03 (
    data1 VARCHAR2 (10 BYTE),
    data2 VARCHAR2 (10 CHAR)
);
desc type_test_03;
INSERT INTO type_test_03 VALUES ('1234567890','1234567890');
INSERT INTO type_test_03(data2) VALUES ('���̻�����ĥ�ȱ���'); --ERROR
INSERT INTO type_test_03(data1) VALUES ('���̻�');             -- Korean is 3byte per chracter.
SELECT * FROM type_test_03;

-- CHAR(n)
CREATE TABLE type_test_04 (
    data1 CHAR,
    data2 CHAR(10),
    data3 CHAR(10 CHAR)
--    , data4 VARCHAR2  -- VARCHAR2�� �ݵ�� ũ�� ���� �ʿ�
);

INSERT INTO type_test_04 
VALUES ('1', '1234567890', '1234567890');

INSERT INTO type_test_04(data2, data3)
VALUES ('������', '���̻�����ĥ�ȱ���');

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
VALUES (to_date('-2012/11/24', 'syyyy/mm/dd')); -- ������� ǥ���ϱ� ���� syyyy ���

SELECT * FROM type_test_05;
SELECT TO_CHAR(data, 'syyyy/mm/dd hh24:mi:ss') FROM type_test_05; -- syyyy�� ������ ������� ����� ǥ����� ����

--�⵵ YY, RR 
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
    --, data2 LONG --LONG �� ���̺�� �ϳ��� ����
);
INSERT INTO type_test_07 VALUES ('�ȳ��ϼ���');
INSERT INTO type_test_07 VALUES ('�ູ������ �ʹ� ���� ���̴�. ���ϴ� Ǯ�� �����ϵ� ������ ��� �̰��� ���ٶ��̴�. �̰��� ���� �ִ� ������ �׸��Ͽ��°�? ���ٶ��� �̻� ���ٳ���, ����� �縷�̴�. �󸶳� ������ ��ī�ο쳪 ��ģ �׵鿡�� �η��� ������ Ŀ�ٶ� �̰��̴�. ������ �λ��� ������ �ִ�. �ʹ� �ǰ� �׵��� �׵��� �ұ��̶� ���ٶ��̴�. ���� �ҷ� �ǰ� �ӿ��� �����̽��� Ǯ�� ������ �縷�̴�. Ǯ�� �̻� �λ��� ũ�� �̹��� �ξ�, ��� �ƴϴ�. ���� ��ġ�� ������ ����� ���ϴ� ������ �ƴϴ���, ���̸�, û���� �ൿ�ϴ�.
������, ����, �°� û���� �ִ� ���´�. �̻��� ���, �ٳ�� ���̸�, ���Ͽ���. õ�� �Ҿ� �׵��� ǳ���ϰ� ��õ���� ��� �̻��� ���� �縷�̴�. ��ġ�� ���� ���ٳ���, ���̴�. ���� ���� ������ ������, �󸶳� �Ǻΰ� ���� ������ ���ִ�. �Ƿ� �̻��� �ڽŰ� ���� �̰��� ���� ���ٶ��̴�. ���� ������ ����� �����ϰ� ���ڴ� �������, ��°� ���̸� ���� �̰��̴�. �� �츮 ������ ������ ǰ����, ���� ������ ���� �װ��� ���̴�. ��Ȳ�Ͽ�����, ��ģ �Ƹ���� �̻� ������ ������ ���� �ӿ� �Ҿ� ���Ͽ���. ���꿡�� ������ ���踦 �ξ�, �̼��� �𷡻��� �縷�̴�. ������ ����� �Ȱ�, �ൿ�ϴ�.
���� ���� û���� ��� ���� ������, ���� ������ ������ ���ٶ��̴�. �Ҿ� ���踦 ǰ�� �Ƹ��ٿ��? ����� ǰ�� ���� ǰ�� ���� ���̴�. ��ģ ���Ͽ� ���� ���� ���̴�. �Ƹ���� ������ ���Ÿ� Ÿ������ ��ġ�� ���� ������ ����� ���̴�. �����ϱ� �����ϵ� ������ �� ���Ͽ� ���̴� ǰ����, ��⸸ ��´�. ������ ���� ���� ����� �Ǿ�� ���̸�, �Ǵ�. ���߿��� û�� ���� �Ͽ��� Į�̴�. ���� �����ϱ� ���Ͽ���, �׿� ǰ�� �׵��� ���� ������ ���.
�����ϱ� �׵��� �ִ� ���� �׵��� ��´�. �̻��� �̻��� ���� �°� ������ �ູ������ ���� �Ǵ�. �Ȱ�, ������ ���꿡�� �Ǿ�� ������ �Ǵ� ���ִ�. �̰��̾߸��� ������ ������ ���� ��Ȳ�Ͽ�����, ǰ�� ���� Ȳ�ݽô��. �츮�� �밨�ϰ� �� ���� ���� �׷��Ƿ� ���� ǳ���ϰ� ���ٶ��̴�. �������� ���� ������ �Ȱ�, �����̴�. �����ϸ�, ���� �̰��̾߸��� ���踦 ���Ͽ� ���Ͽ���. ������ ǰ�� �׵��� ���� �Ǻΰ� ������ ���̴�. Ȳ�ݽô��� �׸��ڴ� ������ ������ ������ ������ �縷�̴�.
õ�ڸ�ȫ�� ����� �λ��� ���� �̹��� �׸��Ͽ��°�? �߰ſ�����, �����ϴ� �ִ� �Ȱ�, ���߿��� ���� ������ �ִ°�? Ȳ�ݽô��� ���̴� �η��� �׵��� ���Ͽ� ���� �Ǿ�� û���� �̻��� öȯ�Ͽ��°�? �������̸�, ������ ������ �׵鿡�� �̻� Ȳ�ݽô��. �׵鿡�� ���� ������ ����, ���̴�. ������ �ٸ� �ǿ� �ϴ� �ΰ��� ���� �Ҿ� ���л��̴�. ���� ���, �߰�, �Ǵ�. �̹��� �̰��� ��⿡�Լ� �λ��� ������ ������ �ڽŰ� ���̴�. �� �̻��� �ʴ� �ִ°�?');
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

-- LOB �Ϻ� ��ȸ�ϱ�
SELECT DBMS_LOB.SUBSTR(data, 10, 2) FROM type_test_08;

-- LOB ��ü ��ȸ�ϱ�
SELECT DBMS_LOB.SUBSTR(data, length(data),1) FROM type_test_08;


--��������, ������� 

--������� ��� �������(�ڷ����) 
SELECT * FROM USER_Constraints;

-- �÷��� �ش��ϴ� ������� (�ڷ����)
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

SELECT * FROM USER_CONSTRAINTS; -- ������� ��� �������
SELECT * FROM USER_CONS_COLUMNS; -- �÷��� �ش��ϴ� ������� ��ȸ


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

-- ������� �ִ� ���̺� �������� �ݿ� (CONSTRAINT �̸� �ʼ�)
ALTER TABLE cons_03 
ADD CONSTRAINT cons_03_uq UNIQUE (data);

INSERT INTO cons_03 VALUES ('111');

-- NULL �������� �ݿ��ϱ� 
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

-- cons_05 ���̺� ���� (data NUMBER)
CREATE TABLE cons_05 (
    data NUMBER
);    

-- ALTER �̿��� data �� ������� check �߰� 1000, 2000, 3000, 4000
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
-- �������� �ڷ���� 
SELECT * FROM USER_CONSTRAINTS
WHERE table_name = UPPER('cons_06'); -- Noting on Constraint Data dictionary. 
-- ���̺� �÷� ���� �ڷ���� 
SELECT * FROM USER_TAB_COLUMNS
WHERE table_name = UPPER('cons_06'); -- see 'DATA_DEFAULT' 

-- ���̺��� �÷� ���� 
ALTER TABLE cons_06
MODIFY (data2 DEFAULT sysdate);
ALTER TABLE cons_06
MODIFY (data3 DEFAULT 'HI' NOT NULL);
-- ���̺��� �������� �߰� 
--ALTER TABLE cons_06
--ADD CONSTRAINT 

--��������� NULL�� INSERT �� ������ DEFAULT ���� ����
INSERT INTO cons_06 VALUES ( null, null, 'AA');

INSERT INTO cons_06(data3) VALUES ('BB');
INSERT INTO cons_06(data1) VALUES (5);
--INSERT INTO cons_06 ; -- �ȵ�
--INSERT INTO cons_06 VALUES (); -- �ȵ�
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

--�������� ���� (PK ����)
ALTER TABLE cons_10
DROP CONSTRAINT cons_10_pk;

--�������� ��Ȱ��ȭ (PK ��� ����) 
ALTER TABLE cons_10
DISABLE CONSTRAINT cons_10_pk;
--�ٽ� Ȱ��ȭ
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
    ON DELETE CASCADE;  -- �������� ���� �������� �Բ� ������, ����� �������� ����. 
-- ORACLE �� �����ϰ�� ON UPDATE CASCADDE �� ������ ������Ʈ �Ҷ� cascade �ǰ� �� �� ����. 
-- �Ѵ� �Ҷ����� �̾ ON DELETE CASCADE ON UPDATE CASCADE ��� ���� ��


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

-- sal �÷� �߰�
ALTER TABLE alter_test
ADD (sal NUMBER(7,2));
-- add job column
ALTER TABLE alter_test
ADD (job VARCHAR2(9));

-- emp ���̺��� sal, job���� alter_test�� �ݿ� 
UPDATE alter_test a SET (a.sal, a.job) = (
    SELECT sal, job FROM emp e
    WHERE a.empno = e.empno);

SELECT * FROM alter_test;

desc alter_test;
desc emp;

--COLUMN ���� (���� �������� ������ Ŀ���Ѵ�)
ALTER TABLE alter_test
MODIFY (ename VARCHAR2(10));
desc alter_test;
SELECT * FROM alter_test;

--sal, job �� ��� null�� 
UPDATE alter_test 
SET sal = NULL, job = NULL;

--job �÷� data type ���� - �����Ͱ� �ϳ��� �������� ����
ALTER TABLE alter_test
MODIFY (job NUMBER);

--job �÷��� 100���� ����
UPDATE alter_test 
SET job = 100;

-- ERROR : job �÷��� �����Ͱ� �ִµ� �ٸ� ������Ÿ������ ���� �õ�.
ALTER TABLE alter_test
MODIFY (job VARCHAR2(9));

--�÷� ���� 
ALTER TABLE alter_test
DROP COLUMN job; -- �����ϰ�, �����ɸ�. ����� �߿��� table �� �߻��Ͽ� ���񽺿� ������ ���� �� �ִ�. 

--�÷� ��Ȱ��ȭ (���� �Ұ�)
ALTER TABLE alter_test
SET UNUSED (sal);
desc alter_test;

--��Ȱ��ȭ �� �÷� �����ϱ� 
ALTER TABLE alter_test
DROP UNUSED COLUMNS;

--��Ȱ��ȭ �� �÷��� �ڷ���� 
ALTER TABLE alter_test
SET UNUSED (ename);

SELECT * FROM USER_UNUSED_COL_TABS;

desc alter_test;

--�÷��� ���� 
ALTER TABLE alter_test
RENAME COLUMN empno to eno;

--���̺�� ���� 
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

