SELECT empno, empno+10, hiredate, hiredate+10 
FROM emp;

DESC EMP;
--SELECT (실습 select1) --

-- lprod 테이블에서 모든 데이터를 조회하는 쿼리를 작성하시오.
SELECT *
FROM lprod;

-- buyer 테이블에서 buyer_id buyer_name 컬럼만 조회하는 쿼리를 작성하시오.
SELECT buyer_id, buyer_name
FROM buyer;

-- cart 테이블에서 모든 데이터를 조회하는 쿼리를 작성하시오.
SELECT *
FROM cart;

-- member 테이블에서 mem_id, mem_pass, mem_name 컬럼만 조회하는 쿼리를 작성하시오.
SELECT mem_id, mem_pass, mem_name
FROM member;

-- column alias( 실습 select2 ) --
-- prod 테이블에서 prod_id, prod_name 두 컬럼을 조회하는 쿼리를 작성하시오(단 prod_id -> id, prod_name -> name으로 별칭변경)
SELECT prod_id id, prod_name name
FROM prod;

--lprod 테이블에서 lprod_gu, lprod_nm 두 컬럼을 조회하는 쿼리를 작성하시오 ( 단 Iprod_gu -> gu lprod_nm -> nm으로 별칭변경)
SELECT lprod_gu gu, lprod_nm nm
FROM lprod;

-- buyer 테이블에서 buyer_id buyer_name 두 컬럼을 조회하는 쿼리를 작성하시오. ( 단 buyer_id -> 바이어아이디 buyer_name -> 이름 으로 별칭변경)
SELECT buyer_id 바이어아이디, buyer_name 이름 -- 실무에서는 한글명을 잘 쓰지 않는다.
FROM buyer;

SELECT empno + 10, ename || ', World',
        CONCAT(ename, ', World')
FROM emp;

DESC emp;

-- 아이디 : brown
-- 아이디 : apeach
SELECT '아이디 : '|| userid 
FROM users;

SELECT 'select * '|| table_name || ';' QUERY,
        CONCAT('select * ' || table_name,  ';') QUERY,
        CONCAT(CONCAT('select * ' ,table_name), ';') QUERY
FROM user_tables; -- 테이블의 목록을 볼 수 있음 --

-- users 테이블에서 userid 컬럼의 값이 brown 인 사용자만 조회 --
-- *** SQL 키워드는 대소문자를 가리지 않지만 데이터 값은 대소문자를 가린다 *** --
SELECT *
FROM users
WHERE userid = 'brown';

SELECT *
FROM emp
WHERE deptno != 20;

SELECT empno, ename, hiredate
FROM emp
WHERE hiredate >= TO_DATE ('1981/03/01', 'yyyy/mm/dd');  -- 중요 --

--문자열을 날짜 타입으로 변환하는 방법
--TO_DATE(날짜, 문자열, 날짜 문자열의 포맷팅)
--TO_DATE('1981/12/11', 'yyyy/mm/dd')

-- 오늘 배운것 (별칭, 결합, 필터, 시간)

--별칭
SELECT empno 이름
FROM EMP;

--결합
SELECT EMPNO || '번' EMPNO,
      CONCAT(CONCAT('번호 : ', empno), '번')empno
FROM EMP;

--필터
SELECT *
FROM emp
WHERE deptno < 20;































