@echo off

set CWD=%~dp0
set BASEDIR=%CWD:~0,-1%
echo BASEDIR = %BASEDIR%
cd "%BASEDIR%"

pushd sql

echo Schema-Objekte droppen

rem siehe http://msdn.microsoft.com/de-de/library/ms162773.aspx:
rem ${sqlserver.sqlcmd.login-options}: Anmeldeoptionen, z.B. -S [protocol:]server[\instance_name][,port] -d db_name -U user und -P password etc.
rem -v: Variablen die im Skript verwendet werden können
rem -i Skript, welches ausgeführt werden soll
rem -b abort on error

sqlcmd -b ${sqlserver.sqlcmd.login-options} -v XSCHEMA=${database.schema} XNA_TABLE=${tablespace.table} XNA_INDEX=${tablespace.index} XNA_LOB=${tablespace.lob} -i schema_drop_objects.sql -o schema_drop_objects.log -e

popd