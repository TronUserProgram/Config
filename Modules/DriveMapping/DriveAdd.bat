echo off
cls

set "password=*"
set "user=*"

:remove_drives
echo Removing 'S:' Drive 1
net use S: /d /y > nul

echo Removing 'T:' Drive 2
net use T: /d /y > nul

echo Removing 'U:' Drive 3
net use U: /d /y > nul

echo Removing 'J:' JottaCloud
net use J: /d /y > nul

echo.

timeout 3 > nul

:add_drives
echo Adding 'S:' Drive 1
net use S: \\Plex\Drive1 /savecred /persistent:Yes
if errorlevel 1 (
    net use T: \\Plex\Drive1 /user:%user% %password% > nul
    goto add_t_drive
) else (
    goto add_t_drive
)

:add_t_drive
echo Adding 'T:' Drive 2
net use T: \\Plex\Drive2 /persistent:Yes
if errorlevel 1 (
    net use T: \\Plex\Drive2 /user:%user% %password% > nul
    goto add_u_drive
) else (
    goto add_u_drive
)

:add_u_drive
echo Adding 'U:' Drive 3
net use U: \\Plex\Drive3 /persistent:Yes
if errorlevel 1 (
    net use T: \\Plex\Drive3 /user:%user% %password% > nul
    goto add_j_drive
) else (
    goto add_j_drive
)


:add_j_drive
echo Adding 'J:' JottaCloud
net use J: \\Plex\JottaCloud /persistent:Yes
if errorlevel 1 (
    net use T: \\Plex\Jottacloud /user:%user% %password% > nul
    goto add_drive_finish
) else (
    goto add_drive_finish
)

:add_drive_finish
echo.

timeout 3 > nul

echo Renaming Drives
start /wait wscript "\\Plex\Share\Software Share\Modification & Customization\Add Network Drives\DriveName.vbs"
echo.
echo Done
timeout 3 > nul
