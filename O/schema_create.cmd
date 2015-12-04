@echo off
set ORACLE_ADMIN=${oracle.admin}
set ORACLE_SID=${oracle.sid}
set TBS_TABLE=${tablespace.table}
set TBS_INDEX=${tablespace.index}
set TBS_LOB=${tablespace.lob}
set SCHEMA=${database.schema}
set USER=${database.jdbc.username}
set PASSWORD=${database.jdbc.password.plain}

set CWD=%~dp0
set BASEDIR=%CWD:~0,-1%
echo BASEDIR = %BASEDIR%
cd %BASEDIR%

pushd sql

echo Schema-Objekte anlegen
sqlplus %USER%/%PASSWORD%@%ORACLE_SID% @schema_sqlpluswrapper.sql %ORACLE_ADMIN% %ORACLE_SID% %TBS_TABLE% %TBS_INDEX% %TBS_LOB% %SCHEMA%        
if %errorlevel% neq 0 (
echo.
type schema.log
echo Fehler %errorlevel% beim Ausführen von schema_sqlpluswrapper.sql!
echo.
popd
exit /B %errorlevel%
)

:end
popd