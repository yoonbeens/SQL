--���� 1.
---EMPLOYEES ���̺��, DEPARTMENTS ���̺��� DEPARTMENT_ID�� ����Ǿ� �ֽ��ϴ�.
---EMPLOYEES, DEPARTMENTS ���̺��� ������� �̿��ؼ�
--���� INNER , LEFT OUTER, RIGHT OUTER, FULL OUTER ���� �ϼ���. (�޶����� ���� ���� Ȯ��)
SELECT *
FROM employees e 
INNER JOIN departments d 
ON e.department_id = d.department_id;

SELECT *
FROM employees e 
LEFT JOIN departments d 
ON e.department_id = d.department_id;

SELECT *
FROM employees e 
RIGHT JOIN departments d 
ON e.department_id = d.department_id;

SELECT *
FROM employees e 
FULL JOIN departments d 
ON e.department_id = d.department_id;

--���� 2.
---EMPLOYEES, DEPARTMENTS ���̺��� INNER JOIN�ϼ���
--����)employee_id�� 200�� ����� �̸�, department_id�� ����ϼ���
--����)�̸� �÷��� first_name�� last_name�� ���ļ� ����մϴ�
SELECT
e.first_name || ' ' || e.last_name AS name,
d.department_id
FROM employees e 
JOIN departments d
ON e.employee_id = d.department_id
WHERE e.employee_id = 200;


--���� 3.
---EMPLOYEES, JOBS���̺��� INNER JOIN�ϼ���
--����) ��� ����� �̸��� �������̵�, ���� Ÿ��Ʋ�� ����ϰ�, �̸� �������� �������� ����
--HINT) � �÷����� ���� ����� �ִ��� Ȯ��
SELECT
e.first_name, j.job_id, j.job_title
FROM employees e 
JOIN jobs j
ON e.job_id = j.job_id
ORDER BY first_name;

--���� 4.
--JOBS���̺�� JOB_HISTORY���̺��� LEFT_OUTER JOIN �ϼ���.
SELECT *
FROM jobs j 
LEFT JOIN job_history jh
ON j.job_id = jh.job_id;

--���� 5.
--Steven King�� �μ����� ����ϼ���.
SELECT
e.first_name || ' ' || e.last_name AS full_name, d.department_name
FROM employees e 
JOIN departments d
ON e.department_id = d.department_id
WHERE e.first_name || ' ' || e.last_name = 'Steven King';

-- WHERE e.first_name = 'Steven'
-- AND e.last_name = 'King'

--���� 6.
--EMPLOYEES ���̺�� DEPARTMENTS ���̺��� Cartesian Product(Cross join)ó���ϼ���
SELECT *
FROM employees e
CROSS JOIN departments d;

-- �� ���� ��
SELECT COUNT(*)
FROM employees e
CROSS JOIN departments d;

-- ����Ŭ ����
SELECT * FROM employees, departments;


--���� 7.
--EMPLOYEES ���̺�� DEPARTMENTS ���̺��� �μ���ȣ�� �����ϰ� SA_MAN ������� �����ȣ, �̸�, 
--�޿�, �μ���, �ٹ����� ����ϼ���. (Alias�� ���)
SELECT
e.employee_id, e.first_name, e.salary, d.department_name, l.city
FROM employees e
JOIN departments d ON e.department_id = d.department_id
JOIN locations l ON d.location_id = l.location_id
WHERE e.job_id = 'SA_MAN';


--���� 8.
-- employees, jobs ���̺��� ���� �����ϰ� job_title�� 'Stock Manager', 'Stock Clerk'�� ���� ������ ����ϼ���.
SELECT *
FROM employees e
JOIN jobs j
ON e.job_id = j.job_id
WHERE j.job_title = 'Stock Manager'
OR j.job_title = 'Stock Clerk';

-- WHERE job_title IN('Stock Manager', 'Stock Clerk');


--���� 9.
-- departments ���̺��� ������ ���� �μ��� ã�� ����ϼ���. LEFT OUTER JOIN ���
SELECT d.department_name
FROM departments d
LEFT JOIN employees e
ON d.department_id = e.department_id
WHERE e.employee_id IS NULL;


--���� 10. 
---join�� �̿��ؼ� ����� �̸��� �� ����� �Ŵ��� �̸��� ����ϼ���
--��Ʈ) EMPLOYEES ���̺�� EMPLOYEES ���̺��� �����ϼ���.
SELECT
e1.first_name || ' ' || e1.last_name, e2.first_name || ' ' || e2.last_name AS manager_name
FROM employees e1
JOIN employees e2
ON e1.manager_id = e2.employee_id;



--���� 11. 
--6. EMPLOYEES ���̺��� left join�Ͽ� �Ŵ��� ���̵��, �Ŵ����� �̸�, �Ŵ����� �޿� ���� ����ϼ���
--�Ŵ��� ���̵� ���� ����� �����ϰ� �޿��� �������� ����ϼ���
SELECT 
    e1.employee_id, e1.first_name, e1.manager_id,
    e2.first_name, e2.salary
FROM employees e1
LEFT JOIN employees e2
ON e1.manager_id = e2.employee_id
WHERE e1.manager_id IS NOT NULL
ORDER BY e1.salary DESC;







