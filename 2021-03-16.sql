연산자 우선순위 ( AND가 OR 보다 우선순위가 높다 )
==> 햇갈리면 ()를 사용하여 우선순위를 조정하자

SELECT *
FROM emp
WHERE ename = 'SMITH' OR ename = 'ALLEN' AND job = 'SALESMAN'
==> 직원의 이름이 'ALLEN' 이면서 직업이 'salesman' 이거나 
    직원의 이름이 'SMITH'인 사람을 조회

    
SELECT *
FROM emp
WHERE ename = ('SMITH' OR ename = 'ALLEN') and job = 'SALESMAN';
==> 직원의 이름이 'ALLEN' 이거나 'SMITH' 이면서 직업이 'salesman' 인 사람을 조회

SELECT *
FROM emp
WHERE job = 'SALESMAN' 
OR empno like '78%' 
AND hiredate >= TO_DATE('1981.06.01' , 'yyyy.mm.dd');

데이터 정렬이 필요한 이유
1. table 객체는 순서를 보장하지 않는다
   ==> 오늘 실행한 쿼리를 내일 실행할 경우 동일한 순서로 조회가 되지 않을 수도 있다.
2. 현실세계에서는 정렬된 데이터가 필요한 경우가 있다.
   ==> 게시판의 게시글은 보편적으로 가장 최신글이 처음에 나오고, 가장 오래된 글이 맨 밑에 있다.
   
SQL 에서 정렬 : ORDER BY ===> SELECT -> FROM -> [WHERE] -> ORDER BY

SELECT *
FROM emp
ORDER BY ename desc --오름차순이 기본값 내림차수 할거면 desc --

SELECT *
FROM emp
ORDER BY job, sal desc --오름차순이 기본값 내림차수 할거면 desc --
-- 정렬 : 컬럼명이 아니라 select 절의 컬럼 순서 (index)

SELECT empno 순번
FROM emp
ORDER BY 순번;

SELECT *
FROM dept
ORDER BY dname;

SELECT *
FROM dept
ORDER BY loc desc;

SELECT *
FROM emp
WHERE comm is  not null and comm != 0
ORDER BY comm desc, empno desc

SELECT *
FROM emp
WHERE mgr is not null
ORDER BY job asc,empno desc;

SELECT *
FROM emp
WHERE deptno IN(10, 30) AND sal > 1500
order by ename desc ;

페이징 처리 : 전체 데이터를 조회하는게 아닌 원하는 데이터만 가져오는 방법
(1. 400건을 조회하고 필요한 20건만 사용하는 방법 -> 전체조회
(2. 400건의 데이터중 원하는 페이지의 20건만 조회 -> 페이징 처리
페이징 처리(게시글) ==> 기준이 뭔데??(일반적으로는 게시글의 작성일시 역순)
 > 고려할 변수 : 페이지 번호, 페이지 사이즈
 
ROWNUM : 행번호를 부여하는 특수 키워드( 오라클만 가능)
       * ROWNUM은 WHERE 절에서도 사용 가능! *
       - 단  ROWNUM의 사용을 1부터 사용하는 경우에만 사용 가능
ALIAS : 별명
인라인 뷰 : 
 
 
 -- ROWNUM -- 
 SELECT ROWNUM empno, ename
 FROM emp
 WHERE ROWNUM BETWEEN 1 AND 5 ;
 
 SELECT ROWNUM, empno, ename
 FROM emp
 ORDER BY ename
 order by 와 rownum을 동시에 사용하면 정렬된 기준으로 rownum이 부여되지 않는다.
 
 -- 인라인 뷰 --
 
SELECT *
FROM
(SELECT ROWNUM rn empno, ename
 FROM (SELECT empno, ename 
       FROM emp
       ORDER BY ename))
WHERE rn BETWEEN (:page-1)* :PageSize+1 AND :page * :pageSize;

PageSize : 5건
1 page : rn BETWEEN 1 AND 5 ;
2 page : rn BETWEEN 6 AND 10 ;
3 page : rn BETWEEN 11 AND 15 ;
5 page : rn BETWEEN n*PageSize-4 AND n*PageSize ;

SELECT ROWNUM rn , empno, ename
FROM emp
WHERE ROWNUM Between 1 and 10;

SELECT *
FROM 
(SELECT ROWNUM rn, empno, ename
FROM emp)
WHERE rn BETWEEN 11 AND 14;

SELECT *
FROM 
(SELECT ROWNUM rn , empno, ename
FROM
(SELECT empno, ename
FROM emp
ORDER BY ename))
WHERE rn BETWEEN 11 AND 14
ORDER BY rn; 

SELECT ROWNUM rn, e.*
FROM emp e;