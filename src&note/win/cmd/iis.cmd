@echo off
::��������Ѿ��򿪹�����ֹͣ
::net start AppHostSvc && if errorlevel 2 (pause & goto stopapp) else echo �Ѿ���������.....

::��������Ѿ��򿪹�����ֹͣ
::net start W3SVC && if errorlevel 2 (pause & goto stopiis ) else echo ������������

:stopapp
::net stop AppHostSvc

:stopiis
::net stop W3SVC
start %windir%\system32\inetsrv\InetMgr.exe
net start apphostsvc && net start w3svc & pause
net stop apphostsvc && net stop w3svc & pause & exit