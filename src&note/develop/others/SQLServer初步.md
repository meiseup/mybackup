�� ������ݿ�
�ռ���Ϣ>��ʶʵ��(һ���Ӧһ�����е�ĳ�м�¼��ʵ�ʿ�����һ���Ӧĳ����)>��ʶʵ������(��Ӧ���е���)>��ʶʵ��֮��Ĺ�ϵ
�������
��Ҫ���
����E-R(Entity-Relationship)ʵ���ϵͼ
�þ��α�ʾʵ��
��Բ��ʾ����
���α�ʾʵ������֮��Ĺ�ϵ
�������ݿ��ϵͼ
��ϸ���
���������˵����

�Ż����ݿ����
ʹ������ʽ�����ݿ�����Ż�
��һ��ʽ��ȷ���е�ԭ���ԡ��в����ٱ�ϸ�֡�
�ڶ���ʽ���������һ��ʽ�Ļ����ϣ�ȷ��ÿһ�ж������������أ���һ����ֻ����һ�����飬����в���ص��У���Ӧ�ŵ���������
������ʽ���������һ���ڶ���ʽ�Ļ����ϣ�ȷ��ÿһ�к�����ֱ�����
�� �ڿ���̨ʹ������������SQLServer
* ����̨��SQLServer����sqlcmd��Ĭ��ʹ��windows������֤��ʽ�������Ҫ���û�����ʽ�������ݿ�����Ҫָ��-u��-p����
��ѡ����� [-u] [-p] []...
-u:ָ���û�����-p:ָ������
* ����֮ǰ��Ҫ�����ݿ���ʴ�ȡ����MSSQLSERVER(Ĭ��)
 > net start MSSQLSERVER && sqlcmd
������ӳɹ���������ʾ������
1>
* ǰ������ִ����кţ������Ķ���ͼ�ν��������ͬ
* ��ѯ�����Ҫ������ʹ��GO�ύ
* GO������������м���ִ�У���SQL��ѯ�����λ��ͬ�е�����������GO��������
ͼ�ν���
�� ʹ��SQL�������ݿ�
* ������ݿ�����ϵͳ��ĳ�����ݿ�ͬ�������ͻ�������ʹ�÷����Ž����ݿ��������������������
* [PRIMARY] �ļ���
* ÿ���ļ�����֮���Զ��ŷָ�;�����ļ��������������ŵı�ʾ��ѡ��
--��������
* NAME ָ�����ݿ��ļ����߼��ļ���
* FILENAME ָ�����ݿ�������ļ�����·��,·��������ʵ����
* FILEGROWTH ָ�������ʣ���Ϊ�ٷֱ�,Ҳ��Ϊ���������ֵ
* SIZE ָ����С,��MB����KBΪ��λ��
* MAXSIZE ָ���ļ������ֵ
* ͨ�����ڴ������ݿ�֮ǰӦ�ȼ�����ݿ��Ƿ��Ѿ�����
USE [MASTER]
GO
* ������ݿ�Ĵ�����,����Ѿ����ڴ����ݿ⣬��ɾ�������ݿ�
 -> IF NOT EXISTS( SELECT name FROM sys.databases WHERE name='Ҫɾ�������ݿ���')
���������ļ�mdfֻ������һ�������������ļ�ndf������һ�����߶��
* �﷨��
drop database Ҫɾ�������ݿ���
go
* �﷨��
 -> CREATE DATABASE [���ݿ���]
ON [PRIMARY]
(NAME=,FILENAME=,SIZE=KB|MB,MAXSIZE=KB|MB,FILEGROWTH=%|),
....,
[FILEGROUP filegourp_name]
(NAME=,FILENAME=,SIZE=KB|MB,MAXSIZE=KB|MB,FILEGROWTH=%|)
(
<�������ļ�����> [,....]
)]
LOG ON
(NAME=,FILENAME=,SIZE=KB|MB,MAXSIZE=KB|MB,FILEGROWTH=%|),
....,
(NAME=,FILENAME=,SIZE=KB|MB,MAXSIZE=KB|MB,FILEGROWTH=%|);
END
GO

* ��ѯ�����Ѿ����ڵ����ݿ���ϵͳ���ݿ�[master]��[sys.databases]��ͼ
USE [master]
GO
 -> SELECT * FROM [sys.databases] WHERE name='db_name'
go

�� ʹ��SQL�������ݿ��
���ݿ����/����/����/���ݣ�
ʹ�ô洢����������/�������ݿ⣺
sp_attach_db/sp_detach_db
ʹ��CREATE DATABASE .... ATTACH��丽�����ݿ�
CREATE DATABASE 
ON
(FILENAME=''),(FILENAME='')
FOR ATTACH | FOR ATTACH_LOG
ALTER DATABASE���
ALTER DATABASE db_name
[ADD FILE special....[TO FILEGROUP group_name]]| [ADD FILEGROUP filegroup_name];
MODIFY FILE special......
[REMOVE FILE file_name] | [REMOVE FILEGROUP filegroup_name];
[SET special......] 
..............

��������ݿ�����ʹ�ã���ô�����ݿ���ĵ����û�ģʽ
ALTER DATABASE database_name 
SET SINGLE_USER 
[WITH ROLLBACK IMMEDIATE];

ALTER TABLE���:
ALTER TABLE table_name
ADD [COLUMN] column_name column_speci...
ADD CONSTRAINT contraint_name constraint_type constraint_defeil
MODIFY COLUMN
DELETE COLUMN
DROP CONSTRAINT constraint_name
DROP INDEX index_name

�� ��������Լ��:ALTER TABLE table_name ADD CONSTRAINT���
1.���Լ��
* ���Լ��֮ǰ�����Լ��Լ���Ƿ��Ѿ�����,���������ɾ��
-> IF EXISTS(SELECT * FROM sysobjects WHERE name='Լ����')
ALTER TABLE ���� DROP COSNTRAINT Լ����
�﷨��
-> ALTER TABLE ���� 
ADD [CONSTRAINT Լ����] Լ������ �����Լ��˵��
ADD [CONSTRAINT Լ����] PRIMARY KEY(����)
ADD [CONSTRAINT Լ����] CHECK(Լ��) 
ADD [CONSTRAINT Լ����] UNIQUE(����)
ADD [CONSTRAINT Լ����] DEFAULT Ĭ��ֵ FOR ����
ADD [CONSTRAINT Լ����] FOREIGN KEY(��������) REFERENCES �������(�������)
| DROP CONSTRAINT constraint_name;
2.ɾ��Լ���μ�DROP CONSTRAINT��䡣
DBCC DATABASE��䣺
�� ʹ��SQL�������ݿ��
PS:
* ��������ͬ�����߹ؼ��ֳ�ͻ������ʹ�÷����Ž�������������
* �����֮���Զ��ŷָ������һ���޷ֺţ��еĸ����Կո�ָ�,�����ڴ������ʱ��ͽ���Լ��
* [IDENTITY(��ʶ����,����)]��ָ���Ƿ�Ϊ��ʶ�У���ʶ���ӣ�����Ӧ�ö�ΪINT�͵�
* [CHECK(Լ��)] �Ƿ���Լ��
* [PRIMARY KEY] �Ƿ�Ϊ����
* [NOT NULL | NULL] �Ƿ�����Ϊ��
* [DEFAULT Ĭ��ֵ] �趨Ĭ��ֵ
* ͬ�������ݿ��д�����ʱ��ҲӦ�ü���Ĵ�����
�� �������ݿ��
* ���Ѿ��Ĵ��ڵ����ݿ���ɾ���Ѿ����ڵı�
 IF EXISTS( SELECT * FROM SYS.DATABASES WHERE NAME='���ݿ���')
 USE [���ݿ���]
 -> IF EXISTS(SELECT * FROM SYS.OBJECTS WHERE NAME='����')
 DROP TABLE Ҫɾ���ı���
 -> CREATE TABLE ����
([����1] �������� [IDENTITY(��ʶ����,����)] [PRIMARY KEY] [�м�Լ��]��
.......
([����N] �������� [�м�Լ��]
[CONSTRAINT Լ��]
)
ON [PRIMARY]
�� ʹ��SQL��������
* �����һ�����д��������Ҳ��Ӱ�����ݵĲ��룬���۵��в��뻹�Ƕ��в��룬����Ҫ���������в�������
* �����������������Ѿ��������������ϵ��������������в�������ʱ�����Ȳ������ݵ�������
1.���в���
* INTO�ؼ����ǿ�ѡ�ģ�����֮�������������Ҳ�ǿ�ѡ�ģ���������������в�������ʱ�ͱ�����ݱ���ʱ���е�˳�����β���
-> INSERT [INTO] ���� [(����1,...����N)] VALUES (ֵ1,....ֵN)
2.���в���
* INSERT ��䲻�����Ե��в������ݣ�ͬ������ʹ���й�������ɶ��в���
����ν���й�������ָ�ڲ�������ʱʹ�ö��Ž�������Բ������������ֵ�ֿ���һ��Բ�����е�ֵ��Ӧһ�����ݱ�ļ�¼������ҲҪ���ص��в��������﷨,ĩβ�ķֺ���Ϊ�������������
-> INSERT [INTO] ���� [(����1,...����N)] 
�� ʹ��SQL��������Լ��
1.���Լ��
* ���Լ��֮ǰ�����Լ��Լ���Ƿ��Ѿ�����,���������ɾ��
 -> if exists(select * from sysobjects where name='Լ����')
 ALTER TABLE ���� DROP COSNTRAINT Լ����
�﷨��
 -> ALTER TABLE ���� ADD CONSTRAINT Լ���� Լ������ �����Լ��˵��
* �������Լ�� 
 -> ALTER TABLE ���� ADD CONSTRAINT Լ���� PRIMARY KEY(����)

* ��Ӽ��Լ��
 -> ALTER TABLE  ���� ADD CONSTRAINT Լ���� CHECK(Լ��) 

* ���ΨһԼ��
 -> ALTER TABLE ���� ADD CONSTRAINT Լ���� UNIQUE(����)

* ���Ĭ��Լ��
 -> ALTER TABLE  ���� ADD CONSTRAINT Լ���� DEFAULT Ĭ��ֵ FOR ����

* ������Լ��
 -> ALTER TABLE ���� ADD CONSTRAINT Լ���� FOREIGN KEY(��������) REFERENCES �������(�������)

2.ɾ��Լ��
* ���Լ���Ƿ����,���������ɾ��
 -> ALTER TABLE ���� DROP COSNTRAINT Լ����


�� ʹ��SQL��������

* �����һ�����д��������Ҳ��Ӱ�����ݵĲ��룬���۵��в��뻹�Ƕ��в��룬����Ҫ���������в�������
* �����������������Ѿ��������������ϵ��������������в�������ʱ�����Ȳ������ݵ�������
1.���в���
* INTO�ؼ��ֿ�ʡ�ԣ����ʡ�Ա���֮������������ڲ�������ʱ������ݶ�����ʱ��˳�����β���
 -> INSERT [INTO] ���� [(����1,...����N)] VALUES (ֵ1,....ֵN)

2.���в���
* INSERT ��䲻�����Ե��в������ݣ�ͬ������ʹ���й�������ɶ��в���
* �й�����ʹ�ö��Ž�������Բ������������ֵ�ֿ���Բ�����еĶ���ֵ֮��ҲҪʹ�ö��ŷֿ����﷨
 -> INSERT [INTO] ���� [(����1,...����N)] 
VALUES
 (ֵ1,....ֵN),
....,
 (ֵ1,....ֵN)
GO

* �򲻴��ڵı��в����������
* ԭ��������
 -> SELECT [����1.����1],....[����N.����N] // ��ѯָ�����е�ָ���в��뵽�±�
INTO [�±���]
FROM [ԭ����]

* ���Ѵ��ڵı��в�ѯ������ӵ���Ҫ��ӵ����ݱ���
* Ҫ�����¼�ı��ԭ���������

 -> INSERT INTO [Ҫ�����¼�ı�](����1,...����N)
SELECT ����1,...����N
FROM [ԭ����]

����һ�ֶ��в������ķ�����
* ���һ�в�����䲻�����йؼ���UNION
* ����������ݿ����Ѿ�����
* ͨ���ؼ���UNION���Ѵ��ڵı��в���������ݣ����һ�в���Ҫ�ؼ���UNION

 -> -> INSERT [INTO] ���� [(����1,...����N)]
SELECT ֵ1,....ֵN UNION
.......
SELECT ֵN,....,ֵN;
�����Ķ��в��뷽ʽ��
* �򲻴��ڵı��в����������
* ԭ��������
-> SELECT [tb_name.col1],....[tb_nameN.colN] // ��ѯָ�����е�ָ���в��뵽�±�
INTO new_tb_name
FROM [ԭ����]
* ���Ѵ��ڵı��в�ѯ������ӵ���Ҫ��ӵ����ݱ���
* Ҫ�����¼�ı��ԭ���������
-> INSERT [INTO] tb_name(����1,...����N)
SELECT ����1,...����N
FROM [ԭ����]
3.�����ʶ��
 -> SELECT IDENTITY(����,����) AS ����
INTO �±�
FROM ԭ��
�ġ�ɾ������
* DELETE:ɾ�������ݣ�����ṹ����
* DROP:ɾ�������ݵ�ͬʱҲɾ����ṹ
 -> DELETE [����]
����һ����ձ�TRUNCATE,���ַ�ʽ���Ժܿ�Ľ�һ�����������գ������������������±�ţ����޷�������ڱ����������õı�
-> TRUNCATE TABLE tb_name
* ���Ҫɾ����ʹ��DROP���
-> DROP TABLE tb_name [CASCADE]|[RESTRICT]
WHERE �����б�
* ���Ҫɾ������ʹ��DROP���
 -> DROP TABLE [����] 
�塢��������
 -> UPDATE ���� 
SET ����1 = ֵ1,...[����N = ֵN]
WHERE �����б�
�� SQL��ѯ����
1.������ѯ
* SELECT�����Բ�ѯ����л��߶��������֮���Զ��ŷָ�,��ͬ���п����ڲ�ͬ�ı���(���ַ�ʽ������Ҫʹ�������ѯ)
* ʹ��AS���ߵȺŻ��߿ո�ָ���еı���
* WHERE ָ��������ֵ�����������AND����
* ORDER BY�Ӿ䣬�����ѯ���
* GROUP BY�Ӿ䣬�Բ�ѯ�������
* �﷨��
-> SELECT [����1 AS ��1�ı���,...����N AS ��N�ı���] | *
FROM [����1 AS ��1�ı���,....����N AS ��N�ı���]
[WHERE �����б�]
[ORDER BY ���� ASC|DESC]
[GROUP BY ����]
[HAVING�־�]
2.�����ѯ
* ���Ҫʹ�÷����ѯ������뽫SELECT����в�ѯ���а�����GROUP�Ӿ��л��߾ۺϺ�����
-> SELECT...WHERE.... GROUP ��1,...��N
3.ģ����ѯ
* ģ����ѯλ��WHERE�Ӿ�֮�󣬿�����LIKE,IN,NOT IN,BETWEEN..AND..
* %ƥ�����ⳤ���ַ�
* -ƥ�䵥���ַ�
* [^]
* [|]
* TOP����λ��SELECT�ؼ���֮����λ��������֮ǰ
�����ļ���ģ����ѯ
 -> SELECT...WHERE �� LIKE ''
 -> SELECT...WHERE �� BETWEEN...AND...
 -> SELECT....WHERE �� IN(ֵ1,...ֵN) ....
 -> SELECT TOP ֵ [PERSENT]|TOP ��¼�� .....
4.�����ѯ
4.1 �����Ӳ�ѯ
* ����л��߶�����Զ��ŷָ�,��ͬ���п����ڲ�ͬ�ı���
��������Ӳ�ѯ����ʹ�����ַ�ʽ��ʵ�֣�
WHERE �����б�
ʹ��where�Ӿ䣺
 1.WHERE �����б�
 -> SELECT ��1,..��N FORM [����1,...����N]
WHERE t1.column = t2.column;
 2.INNER JOIN ����2 AS ����2 ON(������)
ʹ��inner join�Ӿ䣺
-> SELECT t1.��1,..,t2.��N FORM table_1 t1
INNER JOIN ����2 AS ����2 ON(�����б�),
......
INNER JOIN ��N [AS] ���� ON(�����б�)
WHERE �����б�
[group by column..]
[having�Ӿ�]
[order by column...]
4.2 �����Ӳ�ѯ
�������Ӻ������Ӳ�ѯ���Ĳ�ͬ���Ƿ��صĽ������ͬ��
�����ӽ�����ͬʱ�������������ļ�¼����������һ����һ������ʹӱ��������������������ܻ᷵����������м�¼������ӱ���û���ҵ���֮��Ӧ�ļ�¼��
��ô����Ӧ���н�����NULL�����档
4.2.1 ��������
����ʹ����������ʱ��λ��left [outer] join��ߵı�Ϊ������������ұߵı�Ϊ�ӱ�
SELECT t1.column1,...,t2.column_n
FROM tb_1 [AS] t1
LEFT OUTER JOIN tb_2 [AS] tb2
WHERE
4.2.2 ��������
����ʹ��right [outer] join�Ӿ䣬�ұ�Ϊ�������Ϊ�ӱ��ˡ�
���������ָ���˱�������ô����ʹ�ñ���.��������ʽ��ʹ������
SELECT t1.column,...,t2.column_n
FROM table_1 t1
RIGHT [OUTER] JOIN 
table_2 t2 ON()
....
4.2.3 ȫ���Ӳ�ѯ
5.�߼���ѯ
5.1 �Ӳ�ѯ
* �Ӳ�ѯ�ǽ�WHERE�Ӿ���һ��Բ�����з��ص�ֵ�������ǰ��ֵ���������ж� 
* �Ӳ�ѯ�������һ��Բ�����У�����������κα��ʽ�У����ʹ�ñȽ���������������Ӳ�ѯ�Ľ�����ض�����¼
* ����뷵�ض�����¼����Ӧʹ��IN�ؼ��ִ���Ƚ������
�Ӳ�ѯ���﷨���£�
-> SELECT [TOP ��¼��] ��... FROM ���� 
 WHERE �� �Ƚ������ (�Ӳ�ѯ)
IN�Ӳ�ѯ�����ض�����¼�Ĳ�ѯ
NOT IN�Ӳ�ѯ //��ѯ����INƥ�䷶Χ�ڵ�������¼
SELECT �� FROM �� 
WHERE �� IN|NOT IN (�Ӳ�ѯ)

EXISTS�Ӳ�ѯ��һ������IF���Ĵ����Լ�⣬�﷨
...
SELECT ��� WHERE��� EXISTS(�Ӳ�ѯ)
....
4.2.3 ȫ���Ӳ�ѯ
��ȫ�����Ӳ�ѯ����������ӱ�����м�¼��û�еļ�¼����NULL���档
5.�߼���ѯ
5.1 �Ӳ�ѯ
* �Ӳ�ѯ�ǽ�WHERE�Ӿ���һ��Բ�����з��ص�ֵ�������ǰ��ֵ���������ж� 
* �Ӳ�ѯ�������һ��Բ�����У�����������κα��ʽ�У����ʹ�ñȽ���������������Ӳ�ѯ�Ľ�����ض�����¼
* ����뷵�ض�����¼����Ӧʹ��IN�ؼ��ִ���Ƚ������
���Ӳ�ѯ����һ�����߶�����¼�е�ĳ�У������������еģ������ص�ֵһ�����ΪWHERE�־�ıȽϲ�����
�Ӳ�ѯ���﷨���£�
-> SELECT [TOP ��¼��] ��... FROM ���� 
WHERE �� �Ƚ������ (�Ӳ�ѯ)
IN�Ӳ�ѯ�����ض�����¼�Ĳ�ѯ|NOT IN�Ӳ�ѯ //��ѯ����INƥ�䷶Χ�ڵ�������¼
EXISTS�Ӳ�ѯ | NOT EXISTS��һ������IF���Ĵ����Լ�⣬�﷨
...
SELECT �� FROM �� 
WHERE �� 
IN|NOT IN (�Ӳ�ѯ)
EXISTS(�Ӳ�ѯ)|NOT EXISTS(�Ӳ�ѯ)
6.���ϲ�ѯ UNION
* �������Ĳ�ѯ���������һ���Ⲣ���Ὣ�п�ֵ�ļ�¼������﷨
��ѯ1
UNION
��ѯ2
* �������п�ֵ�ļ�¼���﷨������UNION��ѯ
UNION ALL
�� SQL Server����
ʹ�ô洢���̡�������ͼ������
1.�洢����
* �洢������һ��Ԥ�����sql��ʹ�ô洢�����ܼӿ��ѯ�ٶȡ��ɷ�Ϊϵͳ���û��Զ���洢����
* ���������Ĵ洢���̲���Ҫ���Թؼ���exec����execute���ã��������������ʹ�ùؼ��ֽ��е���
1.1 ϵͳ�洢����
* ϵͳ�洢������'sp_'��ʼ���洢��ϵͳ���ݿ�resource��
......
exec sp_help
sp_databases
sp_helpdb -- ��ʾ���ݿ���Ϣ
sp_helplogins
sp_helpsrvrolemember
sp_tableswc
sp_renamedb [���ݿ���] [�����ݿ���] -- ���������ݿ�
sp_tables -- ��ѯ����Ϣ
sp_columns [����] --��ѯ����Ϣ
sp_helpconstranint [������] //��ѯԼ��
sp_helptext 
sp_stored_procedures
dbcc inputbuffer()
exec sp_lock
/* 
*��dbf�ļ��������ݿ�Ĵ洢���̣�����һdbnameָ�����ݿ����ƣ�filename1ָ��mdf�������ļ�����������ϵ�ȫ·����
*filename2����ָ�������ļ�
*/
sp_attach_db @dbname nvarchar(10),@filename1 nvarchar(...),@filename2 nvarchar(..),.....,@filename16 nvarchar(..);
/* 
*�����ݿ�������ݿ��ļ���ʹ�����Ա����������ƶ���������ݿ��Ѿ���ʹ���У���ô����ʹ��alter database set��佫���ݿ���ĵ����û� 
*����dbnameָ��Ҫ��������ݿ⣬skipchecsָ���Ƿ���Ҫ��飬keppfulltextindexfileָ���Ƿ���Ҫ����ȫ�������ļ�Ԫ���ݡ�
*/
sp_detach_db @dbname nvarchar(10),@skipchecks='TRUE|FALSE',@keepfulltextindexfile='TRUE|FALSE';
execute sp_who 'active'
set statistics time on
set statistics io on
set showplan_all on
set nocount on --ִ��sql��ѯʱ����ʾ��Ӱ����������ʾ
......
USE [master]
GO
CREATE LOGIN [sa] WITH PASSWORD=N'?<6PG?=i??,`?????g0?t?��i��?>f%', DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[��������], CHECK_EXPIRATION=OFF, CHECK_POLICY=ON
GO
ALTER LOGIN [sa] DISABLE
GO
ALTER SERVER ROLE [sysadmin] ADD MEMBER [sa]
GO
use [���ݿ���]
go
*
exec sp_msforeachtable 'sp_changeobjectowner "?","dbo"'
*
exec sp_addlogin @loginame='',@passwd='',@defdb= '',@sid=,@deflanguage=null;
*
exec sp_adduser @loginame= ''
*
exec sp_grantdbaccess 
*
exec sp_helpdb
*
exec sp_change_users_login @Action = null,@LoginName= '',@Password= ''
go
use master
go
*
create login qq with password='1234',default_database=QQ
go
*
create user qq for login qq with default_schema = dbo
go
*
exec sp_addrolemember '',''
go
*

exec sp_msforeachtable 'sp_changeobjectowner "?","dbo"' //�������ݿ���߱��������Ϊdbo
exec sp_addlogin @loginame,@passwd,@defdb,@deflanguage,@sid //���ĵ�¼��Ϣ
exec sp_adduser @username //����û�
grant ALL on .. to @tables //��Ȩ
grant update,insert,delete,SELECT on dbo to databasename
exec sp_addrolemember @ower,@dbname //
1.2 ��չ�洢����
xp_msver
--����ϵͳ�߼�����
sp_configure 'show advanced options',1
sp_configure 'recovery interval',1
--����xp_cmdshell
sp_configure 'xp_cmdshell',1
go
--��������xp_cmdshell
reconfigure
go
--�ر�xp_cmdshellΪ����xp_cmdshell�ķ�����
sp_configure 'xp_cmdshell',0
reconfigure 
sp_configure 'show advanced options',0
reconfigure 
go
* ��ѯ���ݿ��д��ڵĶ���
* ���� [U] ��,[S] ��ͼ,[P],[PK]����Լ��,[FN]
* [SQ],[IT],[F] ���Լ��,[UQ] ΨһԼ��
USE [���ݿ���]
GO
 -> SELECT * FROM sysobjects WHERE xtype='����'
go
1.3 �Զ���洢���̼�go�ؼ���
* ����֮ǰ��ü��һ�´����ԣ����򴴽��洢���̿��ܻ�ʧ�ܣ�Ҳ����ʹ��alter�޸Ĵ洢���̡�
* ����ڴ����洢������ʹ�����������output,���ڵ���ʱҲҪ����output�ؼ���;���ʡ��output��Ϊ���������ʵ�ʵ���ʱ��Ҫ����һ��ʵ�����͵Ĳ���
* ������һ���洢���̺󣬲�Ҫ����ʹ��go�����ύ�������ݹ����
�﷨��
...��������
create proc �洢������
@����1 �������� [OUTPUT],
...
@����n �������� [OUTPUT]
AS
sql�����
GO
* ִ�д洢���̣�û����������Ĵ洢���̣�����ʱ������execute����exec�ؼ���
����ڴ����洢����ָ����������������ڵ��ô洢����ʱ����ʹ��exec����execute�ؼ��ֵ���
EXEC �洢������ ������
2.������ͼ������
1.����
��Ϊ��ʽ����ʽ���Զ��ύʽ
* ����һ�����ݿ����ָ����ĳ��sqlָ��ִ��ʧ�ܣ���������佫�������ִ��
* ��һϵ�в����ļ��ϰ����Ĳ���ʱ�����ڷֵ�,���������������ݿ�ϵͳ���ύ��Ҫô���ɹ���Ҫô��ʧ��
��������������ԣ�ԭ���ԣ�һ���ԣ������ԣ��־���
ԭ���ԣ�������һ�����ɷָ������壬���һ������ִ��ʧ�ܣ���ô������������ύ
һ���ԣ�����ִ��ǰ��ִ�к����ݱ���һ��
�����ԣ���ͬ����֮�䲻���໥Ӱ��
�־���:һ�������ύ�ɹ������ݽ����ñ��棬����ɻ���Ƕ��
* ������ʽ����
* ��ʼ����֮�����䶼������Ϊһ������
begin transaction
 sql���
* �ع���������������ع�������ʼǰ���ͷ�������ռ����Դ
rollback transaction

* �ύ���񣬱�־����������ͷ�������ռ����Դ
commit transaction
2.��ͼ��
* ��ͼ��һ���������ͼ�е����ݲ��ܱ��޸�ɾ����һ�ǳ��ڰ�ȫ������Ϊ����Ҫ��һ�㱻����ִ�в�ѯ
* ɾ����ͼ����ɾ�����е�����
ʹ��sql��䴴����ͼ
-- as�Ӿ���ͼ�в��ܰ��������Ӿ�
* order by�Ӿ䣬����ָ����top�Ӿ�
* into �ؼ���
* ��ʱ����߱���
create view ��ͼ��
as SQL���
ִ����ͼ����Ȼ��ͼ����Ϊ���������ô������ò�ѯ�������ѯ��ͼ�е�����
ɾ����ͼ
�������ԣ�֮��ʹ��drop�Ӿ�ɾ������
.....
drop view ��ͼ��
3.����
* �������Լӿ����ݿ��ѯ���ݵ��ٶ�
��������
ȫ������
��������:����������Ϊһ������
�ۼ������ͷǾۼ�����
ʹ��sql��������
create [unique][clustered | nonclustered] index ������ 
on ���� ����1��[...����n]
with fillfactor=x
unique ָ��Ψһ����
clustered��nonclustered ָ���Ǿۼ��������ǷǾۼ�����
fillfactor ָ���������xȡֵ1-100
* ɾ������
drop index ����.������
�� SQL��̳���
SQLServer�����Ķ��弰����
* �ֲ������Ա�� @ ��ʼ�������������������
* ȫ�ֱ���ֻ�ܱ����ã������ٱ����¸�ֵ������ʱ�Ա�� @@ ��ʼ���������
* ������һ�������������,�������֮���ö��Ÿ���
declare ����1�� ��������,����2 ��������,....,����n ��������
�����ĸ�ֵ
set @������ = ֵ
���� SELECT @������ = ֵ
SELECT��set�Ĳ�֮ͬ��
SELECT ֧�ָ����������ֵ set ��֧��
ȫ�ֱ������Ա�� @@ ��ʼ
error ������һ��T-SQL���ִ�еĴ�����
identity ִ��insert�����ʶ�е�ֵ
language �������ݿ�ʹ������
version �������ݿ�汾��Ϣ
max_connections �������ݿ���������������
rowcount ������һ��ִ��SQL��Ӱ������
servername �������ݿ������������
servicename ����SQL�ڱ���ϵͳ��ʹ�õķ�����
������
 * ʹ�����������'+'�����������µı��ʽҪ���������ͱ���һ�£�������������ͣ�����Ҫ��������ת��
 + ֮ǰ��֮��ı��ʽ���߱���Ҫ����������һ��
print ���ʽ [+convert(��������[(����)],����|���ʽ)] //��ͬ������ʹ��cast������ת����������
SELECT ��� [+....]
SELECT convert(varchar(30),login_time,120) FROM Students
print 10+10+''+''

SQL������߼��������
if-else�飺��Ҫ���������жϣ��﷨��
* ��begin��ʼ end���������������䶼Ӧд��begin-end��֮��,��������ʡ��
if(����)
begin 
����
end 
else 
begin
����(�����else���򲻿�ʡ��)
end
while��
* ��Ҫ����ִ��ĳЩѭ������
��begin��ʼ end���������������䶼Ӧд��begin-end��֮��,��������ʡ�ԣ��﷨��
while(����)
begin
����
[break] | [continue]
end
case-end�飬�﷨��
��case��ʼend����
SELECT���
case 
when ����1 then ���1
......
when ����n then ���n
else �������
end
�� SQLServer�����б�
������ʽ:
* SELECT��䲻����������ִ�в�ѯ�������Գ����ڶ��в����SELECT�Ӿ䣬Ҳ���Ե���ϵͳ������ִ�������������ʹ��SELECTΪ�ֲ�������ֵ
SELECT ������(�����б�)
Ҳ�ɳ����ڸ��ӵı��ʽ�У��Բ�������ʽ����
1.�ۺϺ���
ͳ�����ݿ��ļ�¼�� count(columns_name | * | 1) --�����������ͳ���е�ֵΪ�յļ�¼
��ͳ���ظ��ļ�¼ distinct()
�������ֵ max()
������Сֵ min()
������ʽ���ܺ� sum()
����ƽ��ֵ avg()
2.��ѧ����
3.ϵͳ����
���ر��ʽ�ĳ��� datalength()
���ص�¼�� host_name()
���ص�ǰ��¼�û��� system_user()
���ص�ǰ�û��� user_name()
ת���������� convert()
���ص�ǰ�û��� current_user()
4.ʱ�亯��
��ȡ��ǰϵͳʱ�� getdate()
��ָ����ֵ dateadd(���ڲ���,����ֵ,'����')
datediff()
datename() �������ڻ���ʱ��
datepart()

5.�ַ�������
Ѱ��ָ���ַ�������һ���ַ�������ʼλ�� charindex('','',��ʼλ��)
��ȡ�ַ������� len('')
ת����д upper()
ת��Сд lower()
ltrim
rtrim
ȡ���ַ������߿ո� trim()
right()
stuff()
�滻�ַ� replace()
ת������
cast(���ʽ|���� as ��������)
convert(��������[(����)],���ʽ|����)
SQLServer�����
��������
...<>,!= //��֧��˫�Ⱥ�==�����
&&,||,!
 vim:set filetype=markdown: 
