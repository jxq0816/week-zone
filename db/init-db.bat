@echo off
rem /**
rem  * Copyright &copy; jiangxingqi All rights reserved.
rem  *
rem  * Author: jiangxingqi
rem  */
echo.
echo [��Ϣ] �ؽ��������ݿⲢ�����ʼ���ݡ�
echo.
pause
echo.
echo [��Ϣ] �˲���������������ݱ�����ݣ����ָ���ʼ״̬��
echo.
echo [��Ϣ] ȷ�ϼ����𣿷�����رմ��ڡ�
echo.
pause
echo.
echo [��Ϣ] �����ȷ�ϼ����𣿷�����رմ��ڡ�
echo.
pause
echo.

cd %~dp0
cd ..

call mvn antrun:run -Pinit-db

cd db
pause