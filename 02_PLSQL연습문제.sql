
-- 1. ������ �� 3���� ����ϴ� �͸� ����� ����� ����. (��¹� 9���� �����ؼ� ������)
DECLARE
    A1 NUMBER := 3;    
BEGIN
    DBMS_output.put_line(TO_CHAR(A1) || 'X' || 1 || '=' || TO_CHAR(A1));
    DBMS_output.put_line(TO_CHAR(A1) || 'X' || 2 || '=' || TO_CHAR(A1*2));
    DBMS_output.put_line(TO_CHAR(A1) || 'X' || 3 || '=' || TO_CHAR(A1*3));
    DBMS_output.put_line(TO_CHAR(A1) || 'X' || 4 || '=' || TO_CHAR(A1*4));
    DBMS_output.put_line(TO_CHAR(A1) || 'X' || 5 || '=' || TO_CHAR(A1*5));
    DBMS_output.put_line(TO_CHAR(A1) || 'X' || 6 || '=' || TO_CHAR(A1*6));
    DBMS_output.put_line(TO_CHAR(A1) || 'X' || 7 || '=' || TO_CHAR(A1*7));
    DBMS_output.put_line(TO_CHAR(A1) || 'X' || 8 || '=' || TO_CHAR(A1*8));
    DBMS_output.put_line(TO_CHAR(A1) || 'X' || 9 || '=' || TO_CHAR(A1*9));
END;


-- 2. employees ���̺��� 201�� ����� �̸��� �̸��� �ּҸ� ����ϴ�
-- �͸����� ����� ����. (������ ��Ƽ� ����ϼ���.)
DECLARE
    v_emp_name employees.first_name%TYPE;
    v_emp_mail employees.email%TYPE;
BEGIN
    SELECT
        first_name, email
    INTO v_emp_name, v_emp_mail
    FROM employees
    WHERE employee_id = 201;
    
    dbms_output.put_line(v_emp_name || '`s email: ' || v_emp_mail);
END;



-- 3. employees ���̺��� �����ȣ�� ���� ū ����� ã�Ƴ� �� (MAX �Լ� ���)
-- �� ��ȣ + 1������ �Ʒ��� ����� emps ���̺�
-- employee_id, last_name, email, hire_date, job_id�� �ű� �����ϴ� �͸� ����� ���弼��.
-- SELECT�� ���Ŀ� INSERT�� ����� �����մϴ�.
/*
<�����>: steven
<�̸���>: stevenjobs
<�Ի�����>: ���ó�¥
<JOB_ID>: CEO
*/
DECLARE
    v_emp_id employees.employee_id%TYPE;    
BEGIN
    SELECT MAX(employee_id)
    INTO v_emp_id
    FROM employees;
    
    INSERT INTO emps
        (employee_id, last_name, email, hire_date, job_id)
    VALUES
        (v_emp_id + 1, 'steven', 'stevenjobs', sysdate, 'CEO');
        
    COMMIT;
        
END;

SELECT * FROM emps;

DROP TABLE emps;
CREATE TABLE emps AS (SELECT * FROM employees WHERE 1=2);











