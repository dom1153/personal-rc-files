Dump files into path that looks like this
C:\Users\dtdd1\AppData\Local\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState
(check dom-docs for local copy of settings.json/profile.json)

Creating soft links
mklink <Link> <Target>
  /d directory symbol link (default)
  /h hard link
  /? help
  NOTE: this is the INVERSE of ln -s
  e.g. mklink /d "C:\Users\dtdd1\personal-rc-files" "D:\code\personal-rc-files"
             creates relation of D:/... -> C:/...
  remove /d for files

Other programs and utilities (wsl)
  nvm setup (node.js) 
  https://docs.microsoft.com/en-us/windows/nodejs/setup-on-wsl2
