@echo off
setlocal enabledelayedexpansion
for /f "tokens=1-4 delims=:.," %%a in ("!time: =0!") do set /a "t1=((((1%%a-1000)*60+(1%%b-1000))*60+(1%%c-1000))*100)+(1%%d-1000),t2=t1"
set fadeout=255
for /l %%. in () do (
	for /f "tokens=1-4 delims=:.," %%a in ("!time: =0!") do set /a "t1=((((1%%a-1000)*60+(1%%b-1000))*60+(1%%c-1000))*100)+(1%%d-1000)", "DeltaTime=(t1-t2)", "t2=t1", "fadeout-=deltaTime*400/fadeout"
	if "!deltaTime!" neq "0" (
		set /p "=%\e%[38;2;!fadeout!;!fadeout!;!fadeout!;48;2;;;m%\e%[!sst.boot.logoY!;!sst.boot.logoX!H!spr.[bootlogo.spr]!%\e%[!sst.boot.msgY!;!sst.boot.msgX!H%\e%[2K!sst.boot.msg!"
	) < nul
	if !fadeout! lss 1 (
		<nul set /p "=%\e%[48;2;;;m%\e%[2J
		exit 0
	)
)
