@echo off
chcp 65001 >nul
setlocal
set "current_dir=%~dp0"
title [^+] %current_dir%SKIDMENU\FakeStrapper


call :banner
echo.
echo --------------------------------------------------------------------------
echo.
echo [4;38;5;48m[TIP: Press any key to speed up this process][0m
timeout 1 >nul
echo.
echo [4;38;5;48m[%USERNAME%][0m Fetching endpoint...  [
timeout 1   >nul
echo [4;38;5;48m[%USERNAME%][0m Bootstrapper up to date.  [
timeout 1   >nul
echo [4;38;5;48m[%USERNAME%][0m Killing conflicting processes...  [
timeout 1   >nul
echo [4;38;5;48m[%USERNAME%][0m Ensuring essential directories...  [
timeout 1   >nul
echo [4;38;5;48m[%USERNAME%][0m Ensuring essential dependencies...  [
timeout 1   >nul
echo [4;38;5;48m[%USERNAME%][0m Up to date.  [
timeout 1   >nul
echo [4;38;5;48m[%USERNAME%][0m Starting SKID-WARE..  [
timeout 1   >nul
goto :start1


:start1
title [^+] %current_dir%SKIDMENU\CommandLine
cls
for /f %%A in ('"prompt $h &echo on &for %%B in (1) do rem"') do set BS=%%A
echo [0m [0m╔═══════════════════════════════════════════════════════════════════════╗[0m
echo  ║                                                                       ║
echo  ║  [38;5;153m███████╗██╗  ██╗██╗██████╗       ██╗    ██╗ █████╗ ██████╗ ███████╗[0m  ║
echo  ║  [38;5;117m██╔════╝██║ ██╔╝██║██╔══██╗      ██║    ██║██╔══██╗██╔══██╗██╔════╝[0m  ║
echo  ║  [38;5;81m███████╗█████╔╝ ██║██║  ██║█████╗██║ █╗ ██║███████║██████╔╝█████╗[0m    ║
echo  ║  [38;5;229m╚════██║██╔═██╗ ██║██║  ██║╚════╝██║███╗██║██╔══██║██╔══██╗██╔══╝[0m    ║
echo  ║  [38;5;230m███████║██║  ██╗██║██████╔╝      ╚███╔███╔╝██║  ██║██║  ██║███████╗[0m  ║
echo  ║  [38;5;229m╚══════╝╚═╝  ╚═╝╚═╝╚═════╝        ╚══╝╚══╝ ╚═╝  ╚═╝╚═╝  ╚═╝╚══════╝[0m  ║
echo  ║               [7m [7mType ".cmds" to view available commands  [0m              ║
echo  ║                                                                       ║
echo  ╚═══════════════════════════════════════════════════════════════════════╝ 
echo.
set /p input=.%BS%     [[4;38;5;48m%username%[0m^]  ^| 

if /I %input% EQU .cmds (
goto :cmds
)

if /I %input% EQU .help (
goto :cmds
)


if /I %input% EQU .netcmd (
goto :netcmd
)

if /I %input% EQU .net-a (
goto :netstat-a
)

if /I %input% EQU .net-n (
goto :netstat-n
)

if /I %input% EQU .net-e (
goto :netstat-e
)

if /I %input% EQU .net-r (
goto :netstat-r
)

if /I %input% EQU .creator (
goto :creator
)

if /I %input% EQU .activeprogramlist (
call :activeprograms
goto :start1
)

if /I %input% EQU .apl (
call :activeprograms
goto :start1
)

if /I %input% EQU .installedprogramlist (
call :installedprograms
goto :start1
)

if /I %input% EQU .ipl (
call :installedprograms
goto :start1
)

if /I %input% EQU .sys-info (
    cls
    call :banner
    echo.
	echo.
    cmd /c "wmic cpu get name, maxclockspeed, currentclockspeed, numberofcores, numberoflogicalprocessors"
	echo.
    cmd /c "wmic memorychip get capacity, speed, manufacturer, partnumber"
	echo.
	cmd /c "wmic diskdrive get model, size, status"
	echo.
	cmd /c "wmic bios get serialnumber, version, manufacturer"
	echo.
	cmd /c "wmic os get caption, version, architecture"
	echo.
	cmd /c "wmic nic get name, macaddress, speed"
	echo.
	echo.
	echo.
	echo.
echo.
call :display_cpu_usage
call :display_disk_usage

echo.
	timeout 2 >nul
	echo.
    echo [31m[^+]  [4;38;5;48mInternet Protocol Information[0m
	echo.
	echo [31m[^X] [4;38;5;48mWARNING | This may show your Internet Protocol (IP) Adress | Caution Advised[0m
	echo.
	echo [31m[^X] [4;38;5;48mPress any key to continue..[0m
	pause >nul
	echo.
	cmd /c "ipconfig /all"
	echo.
	timeout 3 >nul
    echo.
    echo.
    echo [4;38;5;48m[TIP: Press any key to return to CommandLine][0m
    pause >nul
    goto :start1
)


if /I %input% EQU .ut (
    goto :uptime
)

if /I %input% EQU .dc (
echo 	Opening Discord Profile..
echo.
timeout 1 >nul
start https://www.discord.com/users/1170913646583492734
timeout 2 >nul
goto :start1
)



if /I %input% EQU .quit (
goto :quit
) else (
    call :invalid
)


:quit
title [^+] %current_dir%SKIDMENU\QUIT
cls
call :banner
echo      [[31mAre you sure you want to quit [Y/N] ^?[0m]
set /p input=.%BS%     [[4;38;5;48m%username%[0m^]  ^| 
if /I %input% EQU y (
echo      Closing in 3
timeout 1 >nul
echo      Closing in 2
timeout 1 >nul
echo      Closing in 1
timeout 1 >nul
exit /b

if /I %input% EQU n (
goto :start1
)

:invalid
echo.
echo      [[31mBad Input! Type .help for a list of commands.[0m]
timeout 1 >nul
goto :start1


:cmds
title [^+] %current_dir%SKIDMENU\.cmds
cls
for /f %%A in ('"prompt $h &echo on &for %%B in (1) do rem"') do set BS=%%A
call :banner
echo.
echo.
echo [4;38;5;48m[TIP: Press any key to return to CommandLine][0m
echo [38;5;74m[TIP: All commands must start with the prefix "." before the input][0m
echo.
echo --------------------------------------------------------------------------
echo.
echo [[4;38;5;183m.quit (Alias: .q)[0m] ^| Closes the active .bat.
echo.
echo [[4;38;5;183m.creator[0m] ^| Displays information about the creator; GhostScum
echo.
echo [[4;38;5;183m.netcmd[0m] ^| Displays all netstat commands that are usable in SKID-WARE
echo.
echo [[4;38;5;183m.dc[0m] ^| Displays the creator, GhostScum's discord profile.
echo.
echo [[4;38;5;183m.installedprogramlist (Alias: .ipl)[0m] ^| Displays all programs installed on your C: Drive. [Long Process]
echo.
echo [[4;38;5;183m.activeprogramlist (Alias: .apl)[0m] ^| Displays all programs currently running on your device
echo.
echo [[4;38;5;183m.sys-info[0m] ^| Displays basic system information [Changes font for the .bat temporarily]
echo.
echo.
pause >nul
goto :start1

:creator
cls
call :banner
echo.
echo.
echo Hello! I started this project as a little thing i can do instead of actually doing my school work, and get away with it.
echo.
echo discord.gg/duckycentral | discord.gg/silenthub | duckycentral.xyz | silenthub.cc | guns.lol/ilovekatelyn | fraud.lol/q
echo.
pause >nul
goto :start


:netcmd 
title [^+] %current_dir%SKIDMENU\.netcmd
cls
for /f %%A in ('"prompt $h &echo on &for %%B in (1) do rem"') do set BS=%%A
call :banner
echo [4;38;5;48m[TIP: Press any key to return to CommandLine][0m
echo [38;5;74m[TIP: All commands must start with the prefix "." before the input][0m
echo.
echo --------------------------------------------------------------------------
echo.
echo [[4;38;5;183m.net-a[0m] ^| Displays all active TCP connections and the TCP and UDP ports on which the computer is listening.
echo.
echo [[4;38;5;183m.net-n[0m] ^| Displays active TCP connections, however, addresses and port numbers are expressed numerically and no attempt is made to determine names.
echo.
echo [[4;38;5;183m.net-e[0m] ^| Displays Ethernet statistics, such as the number of bytes and packets sent and received.
echo.
echo [[4;38;5;183m.net-r[0m] ^| Displays the contents of the IP routing table. This is equivalent to the route print command.
pause >nul
goto :start1


:netstat-a
cls
call :banner
echo.
echo.
echo --------------------------------------------------------------------------
echo.
echo.
netstat -a
timeout 1 >nul
echo.
echo [4;38;5;48m[TIP: Press any key to return to CommandLine][0m
echo.
echo.
pause >nul
goto :start1

:netstat-n
cls
call :banner
echo.
echo.
echo --------------------------------------------------------------------------
echo.
echo.
netstat -n
timeout 1 >nul
echo.
echo [4;38;5;48m[TIP: Press any key to return to CommandLine][0m
echo.
echo.
pause >nul
goto :start1

:netstat-e
cls
call :banner
echo.
echo.
echo --------------------------------------------------------------------------
echo.
echo.
netstat -e
timeout 1 >nul
echo.
echo [4;38;5;48m[TIP: Press any key to return to CommandLine][0m
echo.
echo.
pause >nul
goto :start1

:netstat-r
cls
call :banner
echo.
echo.
echo --------------------------------------------------------------------------
echo.
echo.
netstat -r
timeout 1 >nul
echo.
echo [4;38;5;48m[TIP: Press any key to return to CommandLine][0m
echo.
echo.
pause >nul
goto :start1


:activeprograms
cls
call :banner
echo.
echo.
echo [31m[The program will list every active/running program in 3 seconds...]
timeout 1  >nul
echo [31m[The program will list every active/running program in 2 seconds..]
timeout 1 >nul
echo [31m[The program will list every active/running program in 1 second.]
timeout 1 >nul
echo.
echo.
echo --------------------------------------------------------------------------
echo.
echo.
tasklist
echo.
echo.
echo [4;38;5;48m[TIP: Press any key to return to CommandLine][0m
pause >nul
goto :start1


:installedprograms
cls
call :banner
echo.
echo.
echo [31m[The program will list every installed program in 3 seconds...]
echo.
timeout 1  >nul
echo [31m[The program will list every installed program in 2 seconds..]
echo.
timeout 1 >nul
echo [31m[The program will list every installed program in 1 second.]
echo.
timeout 1 >nul
echo.
echo.
echo --------------------------------------------------------------------------
echo.
echo.
dir C:\ /s /b
echo.
echo.
echo [4;38;5;48m[TIP: Press any key to return to CommandLine][0m
pause >nul
goto :start1


:uptime
cls
call :banner
echo.
for /f "tokens=1,*" %%A in ('systeminfo ^| find "System Boot Time"') do (
    echo System Uptime:  %%B
)
echo.
echo [4;38;5;48m[TIP: Press any key to return to CommandLine][0m
pause >nul
goto :start1




:display_cpu_usage
echo [31m[^+][4;38;5;48m[CPU Usage][0m
wmic cpu get loadpercentage /value
echo.


:display_disk_usage
echo [31m[^+] [4;38;5;48m[Disk Usage][0m
wmic logicaldisk get caption,freespace,size /format:list
echo.

goto :eof



:banner
echo [0m [0m╔═══════════════════════════════════════════════════════════════════════╗[0m
echo  ║                                                                       ║
echo  ║  [38;5;153m███████╗██╗  ██╗██╗██████╗       ██╗    ██╗ █████╗ ██████╗ ███████╗[0m  ║
echo  ║  [38;5;117m██╔════╝██║ ██╔╝██║██╔══██╗      ██║    ██║██╔══██╗██╔══██╗██╔════╝[0m  ║
echo  ║  [38;5;81m███████╗█████╔╝ ██║██║  ██║█████╗██║ █╗ ██║███████║██████╔╝█████╗[0m    ║
echo  ║  [38;5;229m╚════██║██╔═██╗ ██║██║  ██║╚════╝██║███╗██║██╔══██║██╔══██╗██╔══╝[0m    ║
echo  ║  [38;5;230m███████║██║  ██╗██║██████╔╝      ╚███╔███╔╝██║  ██║██║  ██║███████╗[0m  ║
echo  ║  [38;5;229m╚══════╝╚═╝  ╚═╝╚═╝╚═════╝        ╚══╝╚══╝ ╚═╝  ╚═╝╚═╝  ╚═╝╚══════╝[0m  ║
echo  ║                                                                       ║
echo  ║                                                                       ║
echo  ╚═══════════════════════════════════════════════════════════════════════╝ 

