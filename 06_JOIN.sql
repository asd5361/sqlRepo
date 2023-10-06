/*
    <JOIN>
        �� ���� �̻��� ���̺��� �����͸� ��ȸ�ϰ��� �� �� ����ϴ� �����̴�.
        
        1. � ����(EQUAL JOIN) / ���� ����(INNER JOIN)
            �����Ű�� Į���� ���� ��ġ�ϴ� ��鸸 ���εǼ� ��ȸ�Ѵ�.(��ġ�ϴ� ���� ���� ���� ��ȸ X)
            
            1) ����Ŭ ���� ����
                [ǥ����]
                    SELECT Į��, Į��, ...
                    FROM ���̺�1, ���̺�2
                    WHERE ���̺�1.Į���� = ���̺�2.Į����;
                
                - FROM ���� ��ȸ�ϰ��� �ϴ� ���̺���� �޸�(,)�� �����Ͽ� �����Ѵ�.
                - WHERE ���� ��Ī ��ų Į���� ���� ������ �����Ѵ�.
            
            2) ANSI ǥ�� ����
                [ǥ����]
                    SELECT Į��, Į��, ...
                    FROM ���̺�1
                    [INNER] JOIN ���̺�2 ON (���̺�1.Į���� = ���̺�2.Į����);
                
                - FROM ���� ������ �Ǵ� ���̺��� ����Ѵ�.
                - JOIN ���� ���� ��ȸ�ϰ��� �ϴ� ���̺��� ��� �� ��Ī ��ų Į���� ���� ������ ����Ѵ�.
                - ���ῡ ����Ϸ��� Į������ ���� ��� ON ���� ��ſ� USING(Į����) ������ ����Ѵ�.
*/

-- �����, �μ��ڵ�,�μ��� ��ȸ
SELECT EMP_NAME,DEPT_CODE, DEPT_TITLE
FROM EMPLOYEE INNER JOIN DEPARTMENT ON DEPT_CODE = DEPT_ID;

SELECT EMP_NAME,DEPT_CODE
FROM EMPLOYEE E, DEPARTMENT D
WHERE E.DEPT_CODE = D.DEPT_ID;

SELECT * FROM JOB;

--�����, �����ڵ�, ���޸� ��ȸ
SELECT E.EMP_NAME,E.JOB_CODE, J.JOB_NAME
FROM EMPLOYEE E JOIN JOB J ON E.JOB_CODE = J.JOB_CODE;

/*
    2. ���� JOIN
        ���� ���� ���̺� �����ϴ� ��쿡 ����Ѵ�.
*/

-- ����̸�, �μ��ڵ�, �μ���, �μ��� ���� ����
SELECT EMP_NAME,DEPT_CODE,DEPT_TITLE,NATIONAL_CODE
FROM EMPLOYEE E
JOIN DEPARTMENT D ON E.DEPT_CODE = D.DEPT_ID
JOIN LOCATION L ON D.LOCATION_ID = L.LOCAL_CODE
;

/*
    3. �ܺ� ���� (OUTTER JOIN)
        ���̺� ���� JOIN �� ��ġ���� �ʴ� �൵ ���Խ��Ѽ� ��ȸ�� �����ϴ�.
        ��, �ݵ�� �����̵Ǵ� ���̺�(�÷�)�� �����ؾ� �Ѵ�. (LEFT/RIGHT/(+))
*/
--�����, �μ��̸�
--RIGHT OUTER JOIN
SELECT EMP_NAME, DEPT_TITLE FROM EMPLOYEE E
RIGHT OUTER JOIN DEPARTMENT D ON E.DEPT_CODE = D.DEPT_ID
;
--LEFT OUTER JOIN 
SELECT EMP_NAME, DEPT_TITLE FROM EMPLOYEE E
LEFT OUTER JOIN DEPARTMENT D ON E.DEPT_CODE = D.DEPT_ID
;
--FULL OUTER JOIN
SELECT EMP_NAME, DEPT_TITLE FROM EMPLOYEE E
FULL OUTER JOIN DEPARTMENT D ON E.DEPT_CODE = D.DEPT_ID
;

/*
    4. ī�׽þȰ�(CARTESIAN PRODUCT) / ���� ����(CROSS JOIN)
        ���εǴ� ��� ���̺��� �� ����� ���μ��� ��� ���ε� �����Ͱ� �˻��ȴ�.
        ���̺��� ����� ��� ������ ����� ������ ��� -> ����ȭ�� ����
*/
--�μ��̸� �����ڵ�
SELECT DEPT_TITLE, LOCATION_ID FROM DEPARTMENT D CROSS JOIN LOCATION L ;

/*
    5. �� ����(NON EQUAL JOIN)
        ���� ���ǿ� ��ȣ(=)�� ������� �ʴ� ���ι��� �� �����̶�� �Ѵ�.
        ������ �÷� ���� ��ġ�ϴ� ��찡 �ƴ�, ���� ������ ���ԵǴ� ����� �����ϴ� ����̴�.
        ( = �̿ܿ� �� ������ >, <, >=, <=, BETWEEN AND, IN, NOT IN ���� ����Ѵ�.)
        
        -- ANSI �������δ� JOIN ON �������θ� ����� �����ϴ�. (USING ��� �Ұ�)
*/
--�����, �޿�, �޿����
SELECT * FROM SAL_GRADE;
SELECT EMP_NAME ,SALARY ,SAL_LEVEL FROM EMPLOYEE 
JOIN SAL_GRADE ON SALARY BETWEEN MIN_SAL AND MAX_SAL;

/*
    6. ��ü ����(SELF JOIN)
        ���� ���̺��� �ٽ� �ѹ� �����ϴ� ��쿡 ����Ѵ�.
*/
--�����ȣ, �����, �����ȣ, �����
SELECT  
     A.EMP_ID       AS "�����ȣ"
    ,A.EMP_NAME     AS "�����"
    ,A.MANAGER_ID   AS "�����ȣ"
    ,NVL(B.EMP_NAME ,'�������')    AS "�����" 
FROM EMPLOYEE A
LEFT OUTER JOIN EMPLOYEE B ON A.MANAGER_ID = B.EMP_ID
ORDER BY A.EMP_ID
;
---------------------------------------------------------------------------------

-- 1. DEPARTMENT ���̺�� LOCATION ���̺��� �����Ͽ� �μ� �ڵ�, �μ���, ���� �ڵ�, �������� ��ȸ
SELECT D.DEPT_ID,D.DEPT_TITLE,L.LOCAL_CODE,L.LOCAL_NAME 
FROM DEPARTMENT D LEFT JOIN LOCATION L ON D.LOCATION_ID = L.LOCAL_CODE
;
-- 2. EMPLOYEE ���̺�� DEPARTMENT ���̺��� �����ؼ� ���ʽ��� �޴� ������� ���, �����, ���ʽ�, �μ����� ��ȸ
SELECT E.EMP_ID, E.EMP_NAME, E.BONUS, D.DEPT_TITLE
FROM EMPLOYEE E
LEFT JOIN DEPARTMENT D ON E.DEPT_CODE = D.DEPT_ID
WHERE BONUS IS NOT NULL
;
-- 3. EMPLOYEE ���̺�� DEPARTMENT ���̺��� �����ؼ� �λ�����ΰ� �ƴ� ������� �����, �μ���, �޿��� ��ȸ
SELECT E.EMP_NAME, D.DEPT_TITLE,E.SALARY
FROM EMPLOYEE E
LEFT JOIN DEPARTMENT D ON E.DEPT_CODE = D.DEPT_ID
WHERE DEPT_TITLE != '�λ������' OR DEPT_TITLE IS NULL
--WHERE DEPT_TITLE NOT IN '�λ������'
;
-- 4. EMPLOYEE ���̺�, DEPARTMENT ���̺�, LOCATION ���̺��� �����ؼ� ���, �����, �μ���, ������ ��ȸ
SELECT E.EMP_ID , E.EMP_NAME, D.DEPT_TITLE, L.LOCAL_NAME
FROM EMPLOYEE E
LEFT JOIN DEPARTMENT D ON E.DEPT_CODE = D.DEPT_ID
LEFT JOIN LOCATION L ON D.LOCATION_ID = L.LOCAL_CODE
;
-- 5. ���, �����, �μ���, ������, ������ ��ȸ
SELECT E.EMP_ID, E.EMP_NAME, D.DEPT_TITLE, L.LOCAL_NAME, L.NATIONAL_CODE
FROM EMPLOYEE E
LEFT JOIN DEPARTMENT D ON E.DEPT_CODE = D.DEPT_ID
LEFT JOIN LOCATION L ON D.LOCATION_ID = L.LOCAL_CODE
;
-- 6. ���, �����, �μ���, ������, ������, �޿� ��� ��ȸ
SELECT E.EMP_ID, E.EMP_NAME, D.DEPT_TITLE, L.LOCAL_NAME, L.NATIONAL_CODE, E.SALARY
FROM EMPLOYEE E
LEFT JOIN DEPARTMENT D ON E.DEPT_CODE = D.DEPT_ID
LEFT JOIN LOCATION L ON D.LOCATION_ID = L.LOCAL_CODE
JOIN SAL_GRADE ON SALARY BETWEEN MIN_SAL AND MAX_SAL
;
------------------------- ���� �ǽ� ���� -------------------------
-- 1. ������ �븮�̸鼭 ASIA �������� �ٹ��ϴ� �������� ���, �����, ���޸�, �μ���, �ٹ�����, �޿��� ��ȸ�ϼ���.
SELECT E.EMP_ID, E.EMP_NAME,J.JOB_NAME,D.DEPT_TITLE, L.LOCAL_NAME, E.SALARY FROM EMPLOYEE E
LEFT OUTER JOIN JOB J ON E.JOB_CODE = J.JOB_CODE
LEFT OUTER JOIN DEPARTMENT D ON E.DEPT_CODE = D.DEPT_ID
LEFT OUTER JOIN LOCATION L ON L.LOCAL_CODE = D.LOCATION_ID
WHERE J.JOB_CODE = 'J6' AND D.LOCATION_ID != 'L4' OR D.LOCATION_ID != 'L5';

-- 2. 70���� �̸鼭 �����̰�, ���� �� ���� �������� �����, �ֹι�ȣ, �μ���, ���޸��� ��ȸ�ϼ���.
SELECT EMP_NAME, EMP_NO, DEPT_TITLE, JOB_NAME
FROM EMPLOYEE E
LEFT OUTER JOIN DEPARTMENT D ON E.DEPT_CODE = D.DEPT_ID
LEFT OUTER JOIN JOB J ON E.JOB_CODE = J.JOB_CODE
WHERE SUBSTR(EMP_NO,1,2) BETWEEN 70 AND 79
AND SUBSTR(EMP_NO,8,1) LIKE '2'
AND EMP_NAME LIKE '��%'
;

-- 3. ���ʽ��� �޴� �������� �����, ���ʽ�, ����, �μ���, �ٹ������� ��ȸ�ϼ���.
SELECT EMP_NAME, NVL(BONUS*SALARY,0), SALARY*12, DEPT_TITLE,LOCAL_NAME
FROM EMPLOYEE E
LEFT OUTER JOIN DEPARTMENT D ON E.DEPT_CODE = D.DEPT_ID
LEFT OUTER JOIN LOCATION L ON L.LOCAL_CODE = D.LOCATION_ID
; 

-- 4. �ѱ��� �Ϻ����� �ٹ��ϴ� �������� �����, �μ���, �ٹ�����, �ٹ� ������ ��ȸ�ϼ���.
SELECT E.EMP_NAME, D.DEPT_TITLE, L.LOCAL_NAME, L.NATIONAL_CODE
FROM EMPLOYEE E
LEFT OUTER JOIN DEPARTMENT D ON E.DEPT_CODE = D.DEPT_ID
LEFT OUTER JOIN LOCATION L ON L.LOCAL_CODE = D.LOCATION_ID
WHERE NATIONAL_CODE LIKE 'KO' OR NATIONAL_CODE LIKE 'JP';

-- 5. �� �μ��� ��� �޿��� ��ȸ�Ͽ� �μ���, ��� �޿�(���� ó��)�� ��ȸ�ϼ���.
SELECT D.DEPT_TITLE, ROUND(AVG(E.SALARY),0) AS "��� �޿�"
FROM EMPLOYEE E
LEFT OUTER JOIN DEPARTMENT D ON E.DEPT_CODE = D.DEPT_ID
GROUP BY D.DEPT_TITLE
;

-- 6. �� �μ��� �� �޿��� ���� 1000���� �̻��� �μ���, �޿��� ���� ��ȸ�Ͻÿ�.
SELECT D.DEPT_TITLE
FROM EMPLOYEE E
LEFT OUTER JOIN DEPARTMENT D ON E.DEPT_CODE = D.DEPT_ID
GROUP BY D.DEPT_TITLE
;
--�̿ϼ���
SELECT * FROM EMPLOYEE;
SELECT * FROM JOB;
SELECT * FROM LOCATION;
SELECT * FROM DEPARTMENT;
-- 7. ���, �����, ���޸�, �޿� ���, ���������� ��ȸ
-- 8. ���ʽ��� ���� �ʴ� ������ �� ���� �ڵ尡 J4 �Ǵ� J7�� �������� �����, ���޸�, �޿��� ��ȸ�Ͻÿ�.
-- 9. �μ��� �ִ� �������� �����, ���޸�, �μ���, �ٹ� ������ ��ȸ�Ͻÿ�.
-- 10. �ؿܿ������� �ٹ��ϴ� �������� �����, ���޸�, �μ� �ڵ�, �μ����� ��ȸ�Ͻÿ�
-- 11. �̸��� '��'�ڰ� ����ִ� �������� ���, �����, ���޸��� ��ȸ�Ͻÿ�.
