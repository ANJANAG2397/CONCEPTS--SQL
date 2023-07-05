

create table t1(a number);

create or replace procedure p1
as
begin
insert into t1(a) values(2);
end;
/

begin
p1;
end;
/



declare
x  number;
begin
x:=4;
dbms_job.submit(
what=>'p1;',
next_date=>sysdate,
interval=>'sysdate+5/24',
job=>x
);
commit;
dbms_output.put_line(x);
end;
/

begin
p1;
end;
/


select*from t1;




drop table t1;








create table t1(a number);
create or replace procedure p1
as 
i number;
begin
select nvl(max(a),0)+1 into i from t1;
insert into t1(a) values (i);
commit;
END;
/

begin
p1;
end;
/

declare
x  number;
begin
x:=4;
dbms_job.submit(
what=>'p1;',
next_date=>sysdate,
interval=>'sysdate+5/24',
job=>x
);
commit;
dbms_output.put_line(x);
end;
/

select*from t1;


