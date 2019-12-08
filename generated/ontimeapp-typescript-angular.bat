set executable=C:\Users\Sergio\Desktop\swagger-codegen\modules\swagger-codegen-cli\target\swagger-codegen-cli.jar
set rootDir=.\

set definition=%rootDir%\api-definition.json
set config=%rootDir%\typescript-conf.json
set outDir=%rootDir%\typescript-on-time-app-api

If Not Exist %executable% (
  mvn clean package
)

REM set JAVA_OPTS=%JAVA_OPTS% -Xmx1024M
set ags=generate -i %definition% -c %config% -l typescript-angular -o %outDir% --additional-properties ngVersion=4.3

REM java %JAVA_OPTS% -jar %executable% %ags%
java %JAVA_OPTS% -jar %executable% %ags%
