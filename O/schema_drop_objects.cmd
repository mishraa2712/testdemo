@echo off
set ORACLE_ADMIN=${oracle.admin}
set ORACLE_SID=${oracle.sid}
set SCHEMA=${database.schema}
set USER=${database.jdbc.username}
set PASSWORD=${database.jdbc.password.plain}

set CWD=%~dp0
set BASEDIR=%CWD:~0,-1%
echo BASEDIR = %BASEDIR%
cd %BASEDIR%

pushd sql

echo Schema-Objekte droppen
sqlplus %USER%/%PASSWORD%@%ORACLE_SID% @schema_drop_objects.sql %ORACLE_ADMIN% %ORACLE_SID% %SCHEMA%

if %errorlevel% neq 0 (
echo.
type schema_drop_objects.log
echo Fehler %errorlevel% beim Ausführen von schema_drop_objects.sql!
echo.
popd
exit /B %errorlevel%
)

popd