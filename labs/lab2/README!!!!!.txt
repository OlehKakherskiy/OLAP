1. ������� �����, ��� � ������ ����
create user TASK2 identified by task2
--create tablespace 
default tablespace users quota 100M ON users 
--limit temporary tablespace 10mb 
temporary tablespace temp quota 100M ON users; 

--add grants 
grant connect, resource to task2;

2. ���� ��� ���������� �� �������� ������ � ������
3. ��������� ������ �������� ����� �� crebas.sql