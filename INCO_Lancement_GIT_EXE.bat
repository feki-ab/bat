set Environnement=RECETTE

set PathSaveReport=Z:\Inco\
set currentpath=%~dp0%debug

cd C:\Ranorex\Automates\Inco
rmdir "incoplu" /s /q
git clone https://bitbucket.agilefabric.fr.carrefour.com/scm/qod/incoplu.git 
cd incoplu

c:\Windows\Microsoft.NET\Framework64\v4.0.30319\msbuild.exe /p:Configuration=Debug /t:Rebuild ..\incoplu\INCO\INCO.csproj
c:\Windows\Microsoft.NET\Framework64\v4.0.30319\msbuild.exe /p:Configuration=Debug /t:Rebuild ..\incoplu\INCO.sln

cd ../Dossier_Lancement_EXE

rmdir "Debug" /s /q
xcopy "..\incoplu\INCO\bin\Debug" "Debug\" /e /i
c:

cd %currentpath%
INCO.exe /ts:INCO.rxtst /rf:%PathSaveReport%\Report_%Environnement%_%%S_%%Y%%M%%D_%%T.html


#Test


