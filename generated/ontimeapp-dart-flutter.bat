set executable=.\modules\swagger-codegen-cli\target\swagger-codegen-cli.jar
set rootDir=C:\Users\Sergio\Desktop\OnTimeApp\generated

set definition=%rootDir%\api-definition.json
set config=%rootDir%\dart-conf.json
set outDir=%rootDir%\dart-on-time-app-api

If Not Exist %executable% (
  mvn clean package
)

REM set JAVA_OPTS=%JAVA_OPTS% -Xmx1024M
set ags=generate -i %definition% -l dart-jaguar -o %outDir% -DhideGenerationTimestamp=true -DbrowserClient=false
REM java %JAVA_OPTS% -jar %executable% %ags%
java %JAVA_OPTS% -jar %executable% %ags%
