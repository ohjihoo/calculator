ECHO OFF
TITLE Break Time Packaging...
ECHO 패키징에 필요한 파일을 복사합니다.
copy /Y "..\Readme.md" "..\bin\Release\Readme.md"
copy /Y "..\License.md" "..\bin\Release\License.md"
copy /Y "..\Images\icons8_calculator.ico" "..\bin\Release\Calculator.ico"
ECHO 패키징에 필요한 파일이 복사되었습니다.
ECHO 패키징을 시작합니다.
..\..\NSIS\makensis.exe .\Packaging.nsi
ECHO 패키징이 완료 되었습니다.
PAUSE