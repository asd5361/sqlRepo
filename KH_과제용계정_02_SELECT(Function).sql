--�� ���б� ��ũ�� ����
--SQL02_SELECT(Function)

-- 1��
-- ������а�(�а��ڵ� 002) �л����� �й��� �̸�, ���� �⵵�� ���� �⵵�� ���� ������ ǥ���ϴ� SQL������ �ۼ��Ͻÿ�.
-- (��, ����� "�й�", "�̸�", "���г⵵" �� ǥ�õǵ��� �Ѵ�.)
SELECT STUDENT_NO "�й�",STUDENT_NAME "�̸�",entrance_date "���г⵵" 
FROM TB_STUDENT WHERE department_no = '002' ORDER BY entrance_date;

-- 2��
-- �� ������б��� ���� �� �̸��� �� ���ڰ� �ƴ� ������ �� �� �ִٰ� �Ѵ�. �� ������ �̸��� �ֹι�ȣ�� ȭ�鿡 ����ϴ� SQL������ �ۼ��غ���.
-- (*�̶� �ùٸ��� �ۼ��� SQL ������ ��� ���� ����� �ٸ��� ���� �� �ִ�. ������ �������� �����غ� ��) 
SELECT PROFESSOR_NAME, professor_ssn FROM tb_professor WHERE professor_name NOT LIKE '___';
SELECT * FROM tb_professor;

-- 3��
-- �� ������б��� ���� �������� �̸��� ����ϴ� SQL ������ �ۼ��Ͻÿ�. �� �̶� ���̰� ���� ������� ���� ��� ����
-- (���̰� ���ٸ� �̸��� ������ ����)�� ȭ�鿡 ��µǵ��� ����ÿ�.
-- (��, ���� �� 2000�� ���� ����ڴ� ������ ��� ����� "�����̸�"���� �Ѵ�. ���̴� '��'���� ����Ѵ�.)
-- ���� ���� ���� ��� �� �ٸ� �� �����Ƿ� PROFESSOR_SSN ���� SELECT �ؼ� Ȯ���غ���!!
SELECT PROFESSOR_NAME FROM TB_PROFESSOR WHERE SUBSTR(PROFESSOR_SSN,8,1) = '1' ORDER BY professor_ssn DESC;

-- 4��
-- �������� �̸� �� ���� ������ �̸��� ����ϴ� SQL ������ �ۼ��Ͻÿ�. ��� ����� "�̸�"�� �������� �Ѵ�.
-- (���� 2���� ����� ������ ���ٰ� �����Ͻÿ�)
SELECT SUBSTR(professor_name,2,2) AS "�̸�" FROM tb_professor WHERE professor_name LIKE '___';

-- 5��
-- �� ������б��� ����� ������ �й��� �̸��� ǥ���Ͻÿ�.(�̶�, 19�쿡 �����ϸ� ����� ���� ���� ������ ����)
-- �������� �䱸�ϴ� ������ ������ ������� ��� ������ ������� �߷����� �� (������� ������ ����� 245��)
-- 0301���� ������ �л��� ���ܽ�Ű�� ���� 19 �ʰ� 20 ���϶�� ���ǽ� ���
SELECT * FROM tb_student WHERE EXTRACT(YEAR FROM entrance_date)-LPAD(SUBSTR(student_ssn,1,2),4,'19')>19;

-- 6��
-- 2020�� ũ���������� ���� �����ΰ�?
--'DAY': �ݿ��� 'DY': �� 'D': 6
SELECT 
    TO_CHAR(TO_DATE('2020-12-25','YYYY-MM-DD'),'DAY')
FROM DUAL;


-- 7��
-- TO_DATE('99/10/11', 'YY/MM/DD'), TO_DATE('49/10/11', 'YY/MM/DD')�� ���� �� �� �� �� �� ���� �ǹ��ұ�?
-- �� TO_DATE('99/10/11', 'RR/MM/DD'), TO_DATE('49/10/11', 'RR/MM/DD')�� ���� �� �� �� �� �� ���� �ǹ��ұ�?
-- YY�� ��� 2000���
-- RR�� 49���ϴ� 2000��� 50�̻��� 1900���
SELECT TO_CHAR(TO_DATE('99/10/11', 'YY/MM/DD'),'YYYY-MM-DD') FROM DUAL;
SELECT TO_CHAR(TO_DATE('49/10/11', 'YYYY/MM/DD'),'YYYY-MM-DD') FROM DUAL;
SELECT TO_CHAR(TO_DATE('99/10/11', 'RRRR/MM/DD'),'RRRR-MM-DD') FROM DUAL;
SELECT TO_CHAR(TO_DATE('49/10/11', 'RRRR/MM/DD'),'RRRR-MM-DD') FROM DUAL;

-- 8��
-- �� ������б��� 2000�⵵ ���� �����ڵ��� �й��� A�� �����ϰ� �Ǿ��ִ�. 
-- 2000�⵵ ���� �й��� ���� �л����� �й��� �̸��� �����ִ� SQL ������ �ۼ��Ͻÿ�.
SELECT student_no,student_name FROM tb_student WHERE student_no LIKE 'A%';

-- 9��
-- �й��� A517178�� �ѾƸ� �л��� ���� �� ������ ���ϴ� SQL���� �ۼ��Ͻÿ�.
-- ��, �̶� ��� ȭ���� ����� "����"�̶�� ������ �ϰ�, ������ �ݿø��Ͽ� �Ҽ��� ���� ���ڸ������� ǥ���Ѵ�.
SELECT TRUNC(AVG(POINT),1) "����" FROM tb_GRADE WHERE student_no LIKE 'A517178';

-- 10��
-- �а��� �л� ���� ���Ͽ� "�а���ȣ", "�л���(��)"�� ���·� Į������ ����� ������� ��µǵ��� �Ͻÿ�.
SELECT DEPARTMENT_NO "�а���ȣ", CAPACITY "�л���(��)"  FROM tb_department;

-- 11��
-- ���� ������ �������� ���� �л��� ���� �� �� ���� �Ǵ��� �˾Ƴ��� SQL���� �ۼ��Ͻÿ�
SELECT COUNT(*) FROM tb_student WHERE coach_professor_no IS NULL;

-- 12��
-- �й��� A112113�� ���� �л��� �⵵ �� ������ ���ϴ� SQL���� �ۼ��Ͻÿ�.
-- ��, �̶� ���ȭ���� ����� "�⵵", "�⵵ �� ����"�̶�� ������ �ϰ�, ������ �ݿø��Ͽ� �Ҽ��� ���� ���ڸ������� ǥ���Ѵ�.
SELECT SUBSTR(term_no,1,4) "�⵵" , ROUND(AVG(POINT),1)"�⵵ �� ����" FROM tb_GRADE WHERE student_no LIKE 'A112113' GROUP BY SUBSTR(term_no,1,4) ORDER BY 1;

-- 13��
-- �а� �� ���л� ���� �ľ��ϰ��� �Ѵ�. �а� ��ȣ�� ���л� ���� ǥ���ϴ� SQL������ �ۼ��Ͻÿ�.
-- COUNT(DECODE(ABSENCE_YN, 'Y', 1, NULL)) �� �ο�����
-- ���� ABSENCE_YN�� ���� 'Y'���� ��� COUNT(1)�� �Ǿ� ������ ���� �ǰ�
--     ABSENCE_YN�� ���� 'Y'�� �ƴϿ��� ��� COUNT(NULL)�� �Ǿ� ������ ���� �ʰԵǴ� ����!!
SELECT department_no,COUNT(DECODE(ABSENCE_YN, 'Y', 1, NULL)) AS "���л� ��" 
FROM tb_student WHERE ABSENCE_YN = 'Y' GROUP BY department_no ORDER BY department_no;

-- 14��
-- �� ���б��� �ٴϴ� �������� �л����� �̸��� ã���� �Ѵ�.
-- � SQL ������ ����ϸ� �����ϰڴ°�?
SELECT STUDENT_NAME AS �������� , COUNT(*) AS "������ ��" 
FROM tb_student GROUP BY STUDENT_NAME HAVING COUNT(*)>1 ORDER BY 1;

-- 15��
-- �й��� A112113�� ���� �л��� �⵵, �б� �� ������ �⵵ �� ���� ����, �� ������ ���ϴ� SQL���� �ۼ��Ͻÿ�.
-- (��, ������ �Ҽ��� 1�ڸ������� �ݿø��Ͽ� ǥ���Ѵ�.)

SELECT 
    NVL(SUBSTR(term_no,1,4),' ') "�⵵"
    ,NVL(SUBSTR(term_no,5,2),' ') �б� 
    ,ROUND(AVG(POINT),1) "����" 
FROM tb_grade 
WHERE student_no ='A112113'
GROUP BY ROLLUP(SUBSTR(term_no,1,4),SUBSTR(term_no,5,2));