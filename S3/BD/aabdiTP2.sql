/* exo 1 */

CREATE OR REPLACE FUNCTION compter1(grade SMALLINT) RETURNS INT AS $$
    DECLARE

        nbEmp INT;
    BEGIN

        SELECT count(*) INTO nbEmp FROM employe WHERE grade = grade_emp;
        RETURN nbEmp;
    END
$$ LANGUAGE PLpgSQL;


CREATE OR REPLACE FUNCTION compter2(in entrée INT, out sortie INT) RETURNS INT AS $$
    BEGIN

        sortie := count(*) FROM employe WHERE entrée = grade_emp;        
    END
$$ LANGUAGE PLpgSQL;



CREATE OR REPLACE FUNCTION moyenne1() RETURNS TABLE (id INT, grade SMALLINT, salaire numeric(10, 2)) AS $$
    
    BEGIN

        RETURN QUERY
        SELECT id_emp, grade_emp, ROUND(AVG(salaire_emp) OVER (partition by grade_emp):: numeric, 2) 
        FROM employe 
        ORDER BY grade_emp;
    END
$$ LANGUAGE PLpgSQL;



/* exo 2 */



