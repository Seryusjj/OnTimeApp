set executable=C:\Users\Sergio\Desktop\swagger-codegen\modules\swagger-codegen-cli\target\swagger-codegen-cli.jar
set rootDir=.\


set definition=%rootDir%\api-definition.json
set outDir=%rootDir%\dart_on_time_app_api

If Not Exist %executable% (
  mvn clean package
)

REM set JAVA_OPTS=%JAVA_OPTS% -Xmx1024M -DloggerPath=conf/log4j.properties
set ags=generate -i %definition% -l dart-jaguar -o %outDir% -DhideGenerationTimestamp=true -DbrowserClient=false
REM java %JAVA_OPTS% -jar %executable% %ags%
java %JAVA_OPTS% -jar %executable% %ags%
