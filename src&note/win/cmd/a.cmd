@echo off
echo �ر��������.......
echo �޸Ŀ���̨������С��ɫ......
mode con cols=192 lines=52 & color 0d
pause

cd /D C:\
echo �����ļ������߲��޸��ļ�����.........
if exist autorun.inf cacls autorun.inf /G everyone:F && attrib +s +r -h *.inf && cacls autorun.inf /G everyone:R
cacls *.ico /G everyone:F && attrib +s +r -h *.ico && cacls *.ico /G everyone:R

cd /D D:\
echo �����ļ������߲��޸��ļ�����.........
cacls *.inf /G everyone:F && attrib +s +r -h *.inf && cacls *.inf /G everyone:R
cacls *.ico /G everyone:F && attrib +s +r -h *.ico && cacls *.ico /G everyone:R

cd /D G:\
echo �����ļ������߲��޸��ļ�����.........
cacls *.inf /G everyone:F && attrib +s +r -h *.inf && cacls *.inf /G everyone:R
cacls *.ico /G everyone:F && attrib +s +r -h *.ico && cacls *.ico /G everyone:R

cd /D I:\
echo �����ļ������߲��޸��ļ�����.........
cacls *.inf /G everyone:F && attrib +s +r -h *.inf && cacls *.inf /G everyone:R
cacls *.ico /G everyone:F && attrib +s +r -h *.ico && cacls *.ico /G everyone:R
echo ִ�����.......
pause



