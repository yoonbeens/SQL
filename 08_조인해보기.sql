
/*
# �����̶�?
- ���� �ٸ� ���̺��� ������ ���谡 �����Ͽ�
1�� �̻��� ���̺��� �����͸� ��ȸ�ϱ� ���� ����մϴ�

SELECT �÷�����Ʈ FROM ���� ����� �Ǵ� ���̺� (1�� �̻�)
WHERE ���� ���� -> ����Ŭ ���� ����

*/

-- employees ���̺��� �μ� id�� ��ġ�ϴ� departments ���̺��� �μ� id�� ã�Ƽ�
-- SELECT ���Ͽ� �ִ� �÷����� ����ϴ� ������
SELECT
    e.first_name, last_name, e.hire_date,
    salary, job_id, e.department_id, department_name
FROM employees e, departments d
WHERE e.department_id = d.department_id; -- ����Ŭ ����

SELECT
    first_name, last_name, hire_date,
    salary, job_id, e.department_id, department_name
FROM employees e
INNER JOIN departments d
ON e.department_id = d.department_id; -- ANSI ǥ�� ���� ����

/*
������ ���̺� ���������� �����ϴ� �÷��� ��쿡��
���̺� �̸��� �����ص� �����մϴ�. �׷���, �ؼ��� ��Ȯ���� ����
���̺� �̸��� �ۼ��ϼż� �Ҽ��� ǥ���� �ִ� ���� �ٶ����մϴ�.
���̺� �̸��� �ʹ� �� �ÿ��� ALIAS�� �ۼ��Ͽ� Ī�մϴ�.
�� ���̺� ��� ������ �ִ� �÷��� ��� �ݵ�� ����� �ּž� �մϴ�.
*/

-- 3���� ���̺��� �̿��� ���� ���� (INNER JOIN)
-- ���� ����: �� ���̺� ��ο��� ��ġ�ϴ� ���� ���� �ุ ��ȯ�մϴ�.
SELECT
    e.first_name, e.last_name, e.department_id,
    d.department_name,
    j.job_title
FROM employees e, departments d, jobs j
WHERE e.department_id = d.department_id
AND e.job_id = j.job_id;

SELECT
    e.first_name, e.last_name,
    d.department_id, d.department_name,
    j.job_title,
    loc.city
FROM
    employees e,
    departments d,
    jobs j,
    locations loc
WHERE 
    e.department_id = d.department_id -- 4
AND
    e.job_id = j.job_id --3
AND
    d.location_id = loc.location_id -- 2
AND
    loc.state_province = 'California'; -- 1

/*
1. loc ���̺��� province = 'california' ���ǿ� �´� ���� �������
2. location_id ���� ���� ���� ������ �����͸�
    departments���� ã�Ƽ� ����
3. ���� ����� ������ department_id�� ����
    employees ���̺��� �����͸� ã�Ƽ� ����
4. ���� ����� jobs ���̺��� ���Ͽ� �����ϰ� ���� ����� ���.
*/

-- �ܺ� ����
/*
��ȣ ���̺� ���� ��ġ�Ǵ� ������ ����Ǵ� ���� ���ΰ��� �ٸ���
��� �� ���̺� ���� ���� ������ �ش� row���� ��ȸ �����
��� ���ԵǴ� ������ ���մϴ�.
*/

SELECT
    first_name, last_name, hire_date,
    salary, job_id, e.department_id, department_name
FROM employees e, departments d, locations loc
WHERE e.department_id = d.department_id(+)
AND d.location_id = loc.location_id;
/*
employees ���̺��� �����ϰ�, department ���̺��� �������� �ʾƵ�
(+)�� ���� ���� ���̺��� �������� �Ͽ� departments ���̺��� ���ο�
�����϶�� �ǹ̸� �ο��ϱ� ���� ��ȣ�� ���Դϴ�.
�ܺ� ������ ����ߴ���, ���Ŀ� ���� ������ ����ϸ�
���������� �켱������ �ν��մϴ�.
*/

/*
-- �ܺ� ���� ���� �� ��� ���ǿ� (+)�� �ٿ��� �ܺ� ������ �����˴ϴ�.
-- �Ϲ� ���ǿ��� (+)�� ������ ������ �ܺ� ������ Ǯ���� ������ �߻�.(������ ����)
*/

SELECT
    e.employee_id, e.first_name,
    e.department_id,
    j.start_date, j.end_date, j.job_id
FROM employees e, job_history j
WHERE e.employee_id = j.employee_id(+)
AND j.department_id(+) = 80;











