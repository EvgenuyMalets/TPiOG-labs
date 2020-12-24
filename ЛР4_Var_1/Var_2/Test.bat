@echo off
set Program="%~1"

if %Program%=="" (
	 "Full path of the program is empty"
	exit /B 1
)

:: Test 1 - �������� �������������� ���������� ����������, ���������� �� ���� ���������::
%Program% "file.txt" > nul && goto err
 echo "Test 1 passed"

:: Test 2 - �������� �� ��������� ����������, ���������� �� ���� ���������
%Program% > nul && goto err
 echo "Test 2 passed"

:: Test  3 - �������� ��� ����� ��������� � ������ ��������������� �����
%Program% _input.txt > nul && goto err
 echo "Test 3 passed"

:: Test 4 - �������� ����� ��������������� ������� �����
%Program% "z:\\lol.txt" 1.txt > nul && goto err
 echo "Test 4 passed"

:: Test 5 - �������� ����� ��������������� ������� �����
%Program% 1.txt "z:\\lol.txt" > nul && goto err
 echo "Test 5 passed"

:: Test 6 - �������� ����������� ������������ ������ ��������� ��� ��������� ���������� ������
%Program% 1.txt 2.txt > output_1.txt || goto err
fc output_1.txt output_diff_ethalon.txt > nul|| goto err
echo "Test 6 passed"

:: Test 7 - �������� ����������� ������������ ������ ��������� ��� ���������� ���������� ������
%Program% 3.txt 4.txt > output2.txt || goto err
fc output2.txt output_same_ethalon.txt > nul || goto err
echo "Test 7 passed"

echo "All tests passed successfully"
exit /B 0

:err
echo "Test failed"
exit /B 1