
/*
- NUMBER(2) -> ������ 2�ڸ����� ������ �� �ִ� ������ Ÿ��.
- NUMBER(5, 2) -> ������, �Ǽ��θ� ��ģ �� �ڸ��� 5�ڸ�, �Ҽ��� 2�ڸ�
3.1415 -> 3.14
31.415 -> 31.42
314.1514 -> 314.15
3141.514 -> X
- NUMBER -> ��ȣ�� ������ �� (38, 0)���� �ڵ� �����˴ϴ�.
- VARCHAR2(byte) -> ��ȣ �ȿ� ���� ���ڿ��� �ִ� ���̸� ����. (4000byte ����)
- CLOB -> ��뷮 �ؽ�Ʈ ������ Ÿ�� (�ִ� 4Gbyte)
- BLOB -> ������ ��뷮 ��ü (�̹���, ���� ���� �� ���)
- DATE -> BC 4712�� 1�� 1�� ~ AD 9999�� 12�� 31�ϱ��� ���� ����
- ��, ��, �� ���� ����
*/

CREATE TABLE dept2(
    dept_no NUMBER(2),
    dept_name VARCHAR2(14),
    loca VARCHAR2(15),
    dept_date DATE,
    dept_bonus NUMBER(10)
);

ROLLBACK;

DESC dept2;

SELECT * FROM dept2;

-- NUMBER�� VARCHAR2 Ÿ���� ���̸� Ȯ��
INSERT INTO dept2
VALUES(30, '�濵����', '����', sysdate, 2000000000);

-- �÷� �߰�
ALTER TABLE dept2
ADD (dept_count NUMBER(3));

-- �� �̸� ����
ALTER TABLE dept2
RENAME COLUMN dept_count TO emp_count;

-- �� �Ӽ� ����
-- ���� �����ϰ��� �ϴ� �÷��� �����Ͱ� �̹� �����Ѵٸ� �׿� �´� Ÿ������ �����ؾ� �մϴ�.
-- ���� �ʴ� Ÿ�����δ� ������ �Ұ����մϴ�.
ALTER TABLE dept2
MODIFY (dept_name VARCHAR2(20));
--MODIFY (dept_name NUMBER(20)); X

DESC dept2;

-- �� ����
ALTER TABLE dept2
DROP COLUMN emp_count;

SELECT * FROM dept3;

-- ���̺� �̸� ����
ALTER TABLE dept2
RENAME TO dept3;

-- ���̺� ���� (������ ���ܵΰ� ���� �����͸� ��� ����)
TRUNCATE TABLE dept3;

SELECT * FROM dept3;

DROP TABLE dept3;

ROLLBACK;
















