@echo off
setlocal enabledelayedexpansion

set "OPENSCAD=C:\Program Files\OpenSCAD (Nightly)\openscad.exe"
set "SRC=SVG"
set "DST=STL"
set "SCAD=svg2stl.scad"
set "HEIGHT=3"
set "CSV=positions.csv"

if not exist "%DST%" mkdir "%DST%"

for /f "tokens=1,2,3 delims=," %%A in (%CSV%) do (
    echo Konvertuji: %%A.svg, drzatko x=%%B y=%%C

    "%OPENSCAD%" ^
      --backend=manifold ^
      -o "%DST%\%%A.stl" ^
      -D "svg_file=\"SVG/%%A.svg\"" ^
      -D "height=%HEIGHT%" ^
      -D "handle_x=%%B" ^
      -D "handle_y=%%C" ^
      "%SCAD%"
)

echo Hotovo.
pause