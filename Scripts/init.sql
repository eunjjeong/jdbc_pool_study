-- jdbc_pool_study
drop schema if exists jdbc_pool_study;

-- jdbc_pool_study
create schema jdbc_pool_study;

-- department
CREATE TABLE jdbc_pool_study.department (
	deptno   INT(11)  NOT NULL COMMENT '부서번호',
	deptname CHAR(10) NOT NULL COMMENT '부서명',
	floor    INT(11)  NULL     COMMENT '위치'
)
COMMENT 'department';

-- department
ALTER TABLE jdbc_pool_study.department
	ADD CONSTRAINT PK_department
		PRIMARY KEY (
			deptno
		);

-- employee
CREATE TABLE jdbc_pool_study.employee (
	empno   INT(11)     NOT NULL COMMENT '사원번호',
	empname VARCHAR(20) NOT NULL COMMENT '사원명',
	title   VARCHAR(20) NULL     COMMENT '직책',
	manager INT(11)     NULL     COMMENT '관리자',
	salary  INT(11)     NULL     COMMENT '급여',
	dno     INT(11)     NULL     COMMENT '부서',
	pic     LONGBLOB    NULL     COMMENT '증명사진'
)
COMMENT 'employee';

-- employee
ALTER TABLE jdbc_pool_study.employee
	ADD CONSTRAINT PK_employee
		PRIMARY KEY (
			empno
		);

-- employee
ALTER TABLE jdbc_pool_study.employee
	ADD CONSTRAINT FK_department_TO_employee -- 부서 -> 사원
		FOREIGN KEY (
			dno -- 부서 
		)
		REFERENCES jdbc_pool_study.department (
			deptno -- 부서번호 
		);
	
-- employee
ALTER TABLE jdbc_pool_study.employee
	ADD CONSTRAINT FK_employee_TO_employee -- 사원 -> 사원
		FOREIGN KEY (
			manager -- 직속상사
		)
		REFERENCES jdbc_pool_study.employee (
			empno -- 사원번호
		);

-- 사용자 추가
drop user if exists 'user_jdbc_pool_study'@'localhost';
grant all privileges on jdbc_pool_study.* to 'user_jdbc_pool_study'@'localhost' identified by 'rootroot';
flush privileges;