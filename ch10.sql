CREATE TABLE ch10_departments
AS
SELECT department_id, department_name
  FROM departments;

ALTER TABLE ch10_departments ADD CONSTRAINTS pk_ch10_departments PRIMARY KEY (department_id);

CREATE OR REPLACE PROCEDURE ch10_iud_dep_proc (
                    p_department_id    ch10_departments.department_id%TYPE,
                    p_department_name  ch10_departments.department_name%TYPE,
                    p_flag             VARCHAR2 )
IS

BEGIN

   IF p_flag = 'I' THEN

      INSERT INTO ch10_departments
             VALUES ( p_department_id, p_department_name);

   ELSIF p_flag = 'U' THEN

      UPDATE ch10_departments
         SET department_name = p_department_name
       WHERE department_id   = p_department_id;

   ELSIF p_flag = 'D' THEN

      DELETE ch10_departments
       WHERE department_id   = p_department_id;

  END IF;

  COMMIT;

END;
/

EXEC ch10_iud_dep_proc (10, '총무기획부', 'I');

CREATE OR REPLACE PROCEDURE ch10_iud_dep_proc (
                    p_department_id    ch10_departments.department_id%TYPE,
                    p_department_name  ch10_departments.department_name%TYPE,
                    p_flag             VARCHAR2 )
IS

BEGIN

   IF p_flag = 'I' THEN

      INSERT INTO ch10_departments
             VALUES ( p_department_id, p_department_name);

   ELSIF p_flag = 'U' THEN

      UPDATE ch10_departments
         SET department_name = p_department_name
       WHERE department_id   = p_department_id;

   ELSIF p_flag = 'D' THEN

      DELETE ch10_departments
       WHERE department_id   = p_department_id;

  END IF;

  COMMIT;

  EXCEPTION WHEN OTHERS THEN
                 DBMS_OUTPUT.PUT_LINE(SQLCODE);
                 DBMS_OUTPUT.PUT_LINE(SQLERRM);
                 ROLLBACK;

END;
/

EXEC ch10_iud_dep_proc (10, '총무기획부', 'I');

CREATE OR REPLACE PROCEDURE ch10_iud_dep_proc (
                    p_department_id    ch10_departments.department_id%TYPE,
                    p_department_name  ch10_departments.department_name%TYPE,
                    p_flag             VARCHAR2 )
IS
  vn_cnt         NUMBER := 0;
  dept_exception EXCEPTION;
BEGIN

   IF p_flag = 'I' THEN

      INSERT INTO ch10_departments
             VALUES ( p_department_id, p_department_name);

   ELSIF p_flag = 'U' THEN

      UPDATE ch10_departments
         SET department_name = p_department_name
       WHERE department_id   = p_department_id;

   ELSIF p_flag = 'D' THEN

     SELECT COUNT(*)
       INTO vn_cnt
       FROM employees
      WHERE department_id = p_department_id;

     IF vn_cnt > 0 THEN
        RAISE dept_exception;

     END IF;

     DELETE ch10_departments
      WHERE department_id   = p_department_id;

  END IF;

  COMMIT;

  EXCEPTION WHEN dept_exception THEN
                 DBMS_OUTPUT.PUT_LINE('해당 부서에 할당된 사원이 존재해 삭제할 수 없습니다!');
                 ROLLBACK;

            WHEN OTHERS THEN
                 DBMS_OUTPUT.PUT_LINE(SQLCODE);
                 DBMS_OUTPUT.PUT_LINE(SQLERRM);
                 ROLLBACK;

END;
/

CREATE OR REPLACE PROCEDURE ch10_iud_dep_proc (
                    p_department_id    ch10_departments.department_id%TYPE,
                    p_department_name  ch10_departments.department_name%TYPE,
                    p_flag             VARCHAR2 )
IS
  vn_cnt         NUMBER := 0;
  dept_exception EXCEPTION;
  PRAGMA EXCEPTION_INIT (dept_exception, -20000 );
BEGIN

   IF p_flag = 'I' THEN

      INSERT INTO ch10_departments
             VALUES ( p_department_id, p_department_name);

   ELSIF p_flag = 'U' THEN

      UPDATE ch10_departments
         SET department_name = p_department_name
       WHERE department_id   = p_department_id;

   ELSIF p_flag = 'D' THEN

     SELECT COUNT(*)
       INTO vn_cnt
       FROM employees
      WHERE department_id = p_department_id;

     IF vn_cnt > 0 THEN
        RAISE dept_exception;

     END IF;

     DELETE ch10_departments
      WHERE department_id   = p_department_id;

  END IF;

  COMMIT;

  EXCEPTION WHEN dept_exception THEN
                 DBMS_OUTPUT.PUT_LINE(SQLCODE);
                 DBMS_OUTPUT.PUT_LINE(SQLERRM);

                 DBMS_OUTPUT.PUT_LINE('해당 부서에 할당된 사원이 존재해 삭제할 수 없습니다!');
                 ROLLBACK;

            WHEN OTHERS THEN
                 DBMS_OUTPUT.PUT_LINE(SQLCODE);
                 DBMS_OUTPUT.PUT_LINE(SQLERRM);
                 ROLLBACK;

END;
/

CREATE OR REPLACE PROCEDURE ch10_iud_dep_proc (
                    p_department_id    ch10_departments.department_id%TYPE,
                    p_department_name  ch10_departments.department_name%TYPE,
                    p_flag             VARCHAR2 )
IS
  vn_cnt         NUMBER := 0;
  dept_exception EXCEPTION;

BEGIN

   IF p_flag = 'I' THEN

      INSERT INTO ch10_departments
             VALUES ( p_department_id, p_department_name);

   ELSIF p_flag = 'U' THEN

      UPDATE ch10_departments
         SET department_name = p_department_name
       WHERE department_id   = p_department_id;

   ELSIF p_flag = 'D' THEN

     SELECT COUNT(*)
       INTO vn_cnt
       FROM employees
      WHERE department_id = p_department_id;

     IF vn_cnt > 0 THEN
      RAISE_APPLICATION_ERROR (-20000, '해당 부서에 할당된 사원이 존재해 삭제할 수 없습니다!');
      
     END IF;

     DELETE ch10_departments
      WHERE department_id   = p_department_id;

  END IF;

  COMMIT;

  EXCEPTION WHEN OTHERS THEN
                 DBMS_OUTPUT.PUT_LINE(SQLCODE);
                 DBMS_OUTPUT.PUT_LINE(SQLERRM);
                 ROLLBACK;

END;
/