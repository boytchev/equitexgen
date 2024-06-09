@echo off
rem next if is used to not close the window in case of error
if not defined in_subprocess (cmd /k set in_subprocess=y ^& %0 %*) & exit )

call npx eslint --fix src\*.js

call npx eslint --fix src\patterns\*.js

call npx eslint --fix online\*.js

call npx eslint --fix online\*.html

call npx eslint --fix examples\*.html

pause
exit

