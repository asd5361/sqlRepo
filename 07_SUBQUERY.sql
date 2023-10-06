/*
    <SUBQUERY>
        �ϳ��� SQL �� �ȿ� ���Ե� �� �ٸ� SQL ���� ���Ѵ�. 
        ���� ����(���� ����)�� �����ϴ� ������ �ϴ� �������̴�.
*/
SELECT (SELECT 10 FROM DUAL) + 20
FROM DUAL;

--���ö ����� ���� �μ� ������� ����� ��ȸ
SELECT * 
FROM EMPLOYEE 
WHERE DEPT_CODE = (SELECT DEPT_CODE FROM EMPLOYEE
WHERE EMP_NAME = '���ö')
;
/*
    <���� ���� ����>
        ���� ������ ���� ������ ������ ������� ��� ���� ������ ���� �з��� �� �ִ�.
        
        1) ������, ���Ͽ� ���� ����  : ���� ������ ��ȸ ��� ���� ��� ���� ������ 1�� �� ��
        2) ������ ���� ����         : ���� ������ ��ȸ ��� ���� ���� ������ ���� �� �� ��
        3) ���߿� ���� ����         : ���� ������ ��ȸ ��� ���� �� �������� Į���� ������ �϶�
        4) ������, ���߿� ���� ����  : ���� ������ ��ȸ ��� ���� ������, ������ �� ��
        
        * ���� ������ ������ ���� ���� ���� �տ� �ٴ� �����ڰ� �޶�����.
 */
 
 
 /*
    <������ ���Ͽ� ���� ����>
        ���� ������ ��ȸ ��� ���� ��� ���� ������ 1�� �� �� (������, ���Ͽ�)
        �� ������(������ ������) ��� ���� (=, !=, <>, ^=, >, <, >=, <=, ...)
*/

-- 1) �� ������ ��� �޿����� �޿��� ���� �޴� �������� �̸�, ���� �ڵ�, �޿� ��ȸ
SELECT EMP_NAME, JOB_CODE,SALARY 
FROM EMPLOYEE WHERE SALARY < (SELECT AVG(SALARY) FROM EMPLOYEE)
;

-- 2) ���� �޿��� �޴� ������ �̸�, �޿� ��ȸ
SELECT EMP_NAME, JOB_CODE,SALARY 
FROM EMPLOYEE WHERE SALARY = (SELECT MIN(SALARY) FROM EMPLOYEE)
;

-- 3) ���ö ����� �޿����� �� ���� �޿��� �޴� ������� �����, �޿� ��ȸ
SELECT EMP_NAME , SALARY 
FROM EMPLOYEE WHERE SALARY > (SELECT SALARY FROM EMPLOYEE WHERE EMP_NAME = '���ö');

-- 4) �μ��� �޿��� ���� ���� ū �μ��� �μ� �ڵ�, �޿��� �� ��ȸ
;
SELECT DEPT_CODE, SUM(SALARY) FROM EMPLOYEE GROUP BY DEPT_CODE HAVING SUM(SALARY) = 17700000;
SELECT DEPT_CODE, SUM(SALARY) 
FROM EMPLOYEE GROUP BY DEPT_CODE 
HAVING SUM(SALARY) = (
                        SELECT MAX(A) FROM (SELECT DEPT_CODE,SUM(SALARY)AS A FROM EMPLOYEE GROUP BY DEPT_CODE)
                    );
-- 5) ������ ����� �����ִ� �μ����� ��ȸ (��, ������ ����� ����)




