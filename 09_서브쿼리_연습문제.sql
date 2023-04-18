
--���� 1.
---EMPLOYEES ���̺��� ��� ������� ��ձ޿����� ���� ������� �����͸� ��� �ϼ��� ( AVG(�÷�) ���)
---EMPLOYEES ���̺��� ��� ������� ��ձ޿����� ���� ������� ���� ����ϼ���
---EMPLOYEES ���̺��� job_id�� IT_PROG�� ������� ��ձ޿����� ���� ������� �����͸� ����ϼ���

SELECT * FROM employees
WHERE salary > ANY(SELECT AVG(salary) FROM employees);

SELECT COUNT(*) FROM employees
WHERE salary > ANY(SELECT AVG(salary) FROM employees);

SELECT * FROM employees
WHERE salary > (SELECT AVG(salary) FROM employees
WHERE job_id = 'IT_PROG');
                    
                    

--���� 2.
---DEPARTMENTS���̺��� manager_id�� 100�� ����� department_id��
--EMPLOYEES���̺��� department_id�� ��ġ�ϴ� ��� ����� ������ �˻��ϼ���.
SELECT *
FROM employees
WHERE department_id in (
                        SELECT department_id
                        FROM departments
                        WHERE manager_id = 100
                        );



--���� 3.
---EMPLOYEES���̺��� ��Pat���� manager_id���� ���� manager_id�� ���� ��� ����� �����͸� ����ϼ���
---EMPLOYEES���̺��� ��James��(2��)���� manager_id�� ���� ��� ����� �����͸� ����ϼ���.


SELECT * FROM employees
WHERE manager_id > (SELECT manager_id FROM employees WHERE first_name = 'Pat');

SELECT * FROM employees
WHERE manager_id in (SELECT manager_id FROM employees WHERE first_name = 'James');

--���� 4.
---EMPLOYEES���̺� ���� first_name�������� �������� �����ϰ�, 41~50��° �������� �� ��ȣ, �̸��� ����ϼ���

SELECT * FROM
    (
    SELECT ROWNUM AS rn, tbl.* 
    FROM
        (
        SELECT * FROM employees
        ORDER BY first_name DESC
        ) tbl
    )
WHERE rn BETWEEN 41 AND 50;

--���� 5.
---EMPLOYEES���̺��� hire_date�������� �������� �����ϰ�, 31~40��° �������� �� ��ȣ, ���id, �̸�, ��ȣ, 
--�Ի����� ����ϼ���.
SELECT * FROM
    (
    SELECT ROWNUM AS rn, tbl.*
    FROM
        (
        SELECT employee_id, first_name, phone_number, hire_date FROM employees
        ORDER BY hire_date ASC
        ) tbl
    )
WHERE rn > 30 AND rn <= 40;


--���� 6.
--employees���̺� departments���̺��� left �����ϼ���
--����) �������̵�, �̸�(��, �̸�), �μ����̵�, �μ��� �� ����մϴ�.
--����) �������̵� ���� �������� ����
SELECT 
e.employee_id, CONCAT(e.first_name, e.last_name) AS �̸�, e.department_id, d.department_name
FROM employees e LEFT JOIN departments d
ON e.department_id = d.department_id
ORDER BY e.employee_id ASC;

--���� 7.
--���� 6�� ����� (��Į�� ����)�� �����ϰ� ��ȸ�ϼ���

SELECT 
    e.employee_id, 
    CONCAT(first_name, last_name) AS �̸�, 
    e.department_id,
    (
    SELECT
        department_name
    FROM departments d
    WHERE d.department_id = e.department_id
    ) AS department_name
FROM employees e
ORDER BY e.employee_id ASC;



--���� 8.
--departments���̺� locations���̺��� left �����ϼ���
--����) �μ����̵�, �μ��̸�, �Ŵ������̵�, �����̼Ǿ��̵�, ��Ʈ��_��巹��, ����Ʈ �ڵ�, ��Ƽ �� ����մϴ�
--����) �μ����̵� ���� �������� ����
SELECT d.department_id, d.department_name, 
d.manager_id, l.location_id, 
l.street_address, l.postal_code, l.city
FROM departments d LEFT JOIN locations l
ON d.location_id = l.location_id
ORDER BY department_id ASC;

--���� 9.
--���� 8�� ����� (��Į�� ����)�� �����ϰ� ��ȸ�ϼ���
SELECT 
    d.department_id, d.department_name, d.manager_id,
    (
    SELECT location_id
    FROM locations l
    WHERE l.location_id = d.location_id
    ),
    (
    SELECT street_address
    FROM locations l
    WHERE l.location_id = d.location_id
    ),
    (
    SELECT city
    FROM locations l
    WHERE l.location_id = d.location_id
    ),
    (
    SELECT postal_code
    FROM locations l
    WHERE l.location_id = d.location_id
    )
FROM departments d
ORDER BY d.department_id ASC;



--���� 10.
--locations���̺� countries ���̺��� left �����ϼ���
--����) �����̼Ǿ��̵�, �ּ�, ��Ƽ, country_id, country_name �� ����մϴ�
--����) country_name���� �������� ����
SELECT 
    l.location_id, l.street_address, l.city, 
    c.country_id, c.country_name
FROM locations l LEFT JOIN countries c
ON l.country_id = c.country_id
ORDER BY c.country_name ASC;


--���� 11.
--���� 10�� ����� (��Į�� ����)�� �����ϰ� ��ȸ�ϼ���
SELECT 
    loc.location_id, loc.street_address, loc.city, 
        (
        SELECT 
            country_id
        FROM countries c
        WHERE c.country_id = loc.country_id
        ) AS country_id,
        (
        SELECT 
            country_name
        FROM countries c
        WHERE c.country_id = loc.country_id
        ) AS country_name
FROM locations loc
ORDER BY country_name ASC;


--���� 12. 
--employees���̺�, departments���̺��� left���� hire_date�� �������� �������� 1-10��° �����͸� ����մϴ�
--����) rownum�� �����Ͽ� ��ȣ, �������̵�, �̸�, ��ȭ��ȣ, �Ի���, �μ����̵�, �μ��̸� �� ����մϴ�.
--����) hire_date�� �������� �������� ���� �Ǿ�� �մϴ�. rownum�� Ʋ������ �ȵ˴ϴ�.
SELECT e.employee_id, CONCAT(e.first_name, e.last_name), e.phone_number, e.hire_date,
d.department_id, d.department_name
FROM
    (
    SELECT ROWNUM AS rn
    FROM employees e LEFT JOIN departments d
    ON e.department_id = d.department_id
    ORDER BY e.hire_date ASC
    )
WHERE rn > 1 OR rn <11;



--���� 13. 
--EMPLOYEES �� DEPARTMENTS ���̺��� JOB_ID�� SA_MAN ����� ������ LAST_NAME, JOB_ID, 
--DEPARTMENT_ID,DEPARTMENT_NAME�� ����ϼ���.
SELECT e.last_name, e.job_id, e.department_id,
    (
    SELECT d.department_name
    FROM departments d
    WHERE e.department_id = d.department_id
    )AS dName
FROM employees e
WHERE job_id = 'SA_MAN';



--���� 14
--DEPARTMENT���̺��� �� �μ��� ID, NAME, MANAGER_ID�� �μ��� ���� �ο����� ����ϼ���.
--�ο��� ���� �������� �����ϼ���.
--����� ���� �μ��� ������� ���� �ʽ��ϴ�.
SELECT department_id, department_name, manager_id,
(
SELECT COUNT(department_id)
FROM departments d2
WHERE d1.department_id = d2.department_id
GROUP BY COUNT(department_id)
ORDER BY COUNT(department_id) DESC
)
FROM departments d1;


--���� 15
--�μ��� ���� ���� ���ο�, �ּ�, �����ȣ, �μ��� ��� ������ ���ؼ� ����ϼ���.
--�μ��� ����� ������ 0���� ����ϼ���.
SELECT *,
(
SELECT street_address
FROM locations
)
FROM departmens



--���� 16
---���� 15 ����� ���� DEPARTMENT_ID�������� �������� �����ؼ� ROWNUM�� �ٿ� 1-10������ ������
--����ϼ���.



















