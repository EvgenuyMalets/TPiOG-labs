@echo off

SET MyProgram="%~1"

if %MyProgram%=="" (
echo "You should type path to our program"
exit /B 1
)

:: Test1 - Проверка создания пустого файла из другого пустого файла
%MyProgram% input_empty.txt output.txt || goto err
fc input_empty.txt output.txt > nul || goto err
echo "Test 1 passed"

:: Test2 - Проверка копирования файла с данными
%MyProgram% input_not_empty.txt output.txt || goto err
fc input_not_empty.txt output.txt > nul || goto err
echo "Test 2 passed"

:: Test3 - Проверка недостаточного количества аргументов подаваемых на вход программе
%MyProgram% input_not_empty.txt > nul && goto err
echo "Test 3 passed"

:: Test4 _ Проверка работы при отсуствии аргументов
%MyProgram% > nul && goto err
echo "Test 4 passed"

:: Test5 - Проверка при одном аргументе с именем несуществующего файла
%MyProgram% input1234.txt > nul && goto err
echo "Test 5 passed"

:: Test6 - Проверка копирования несуществующего файла
%MyProgram% input1234.txt output.txt > nul && goto err
echo "Test 6 passed"

:: Test7 - Проверка записи файла в несуществующую директорию
%MyProgram% input_not_empty.txt "M:\bntu\output.txt" > nul && goto err
echo "Test 7 passed"

echo "All tests passed suxxessfully"
exit /B 0

:err
echo "Tests failed"
exit /B 1