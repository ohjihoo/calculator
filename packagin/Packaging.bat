ECHO OFF
TITLE Break Time Packaging...
ECHO ��Ű¡�� �ʿ��� ������ �����մϴ�.
copy /Y "..\Readme.md" "..\bin\Release\Readme.md"
copy /Y "..\License.md" "..\bin\Release\License.md"
copy /Y "..\Images\icons8_calculator.ico" "..\bin\Release\Calculator.ico"
ECHO ��Ű¡�� �ʿ��� ������ ����Ǿ����ϴ�.
ECHO ��Ű¡�� �����մϴ�.
..\..\NSIS\makensis.exe .\Packaging.nsi
ECHO ��Ű¡�� �Ϸ� �Ǿ����ϴ�.
PAUSE