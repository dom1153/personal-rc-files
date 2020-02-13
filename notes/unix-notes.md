## To recursively give directories read&execute privileges:

`find /path/to/base/dir -type d -exec chmod 755 {} +`

## To recursively give files read privileges:

`find /path/to/base/dir -type f -exec chmod 644 {} +`

Source:

https://superuser.com/questions/91935/how-to-recursively-chmod-all-directories-except-files

## Snap commands

```
# update packages
snap refresh
snap refresh --list
snap revert <package>
snap remove <package>
```