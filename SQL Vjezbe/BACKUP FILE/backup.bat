@ECHO OFF
SET HOUR=%time:~0,2%

SET dtStamp9=%date:~-4%%date:~4,2%%date:~7,2%_0%time:~1,1%%time:~3,2%%time:~6,2%

SET dtStamp24=%date:~-5,4%%date:~7,2%%date:~4,2%%time:~0,2%%time:~3,2%%time:~6,2%

if "%HOUR:~0,1%" == " " (SET dtStamp=%dtStamp9%) else (SET dtStamp=%dtStamp24%)

set title=backup%dtStamp%.sql

c:\xampp\mysql\bin\mysqldump -uroot edunovajp25 > d:\%title%

: path to 7zip file                      : onedrive path                              :from where
"D:\Program Files\7-Zip\7z.exe" a -tzip  D:\Users\Admin\OneDrive\Documents\%title%.zip d:\%title%

: del d:\%title%

ECHO "Done"