![Logo](icon.png)

Credits to [cmccambridge/ocrmypdf-auto](https://github.com/cmccambridge/ocrmypdf-auto)

## Prepare
go to ssh / terminal and create the following directories:

``` bash
mkdir /share/ocrmypdfauto/
mkdir /share/ocrmypdfauto/input  # incoming pdfs (from scanner)
mkdir /share/ocrmypdfauto/output # outgoing pdfs
mkdir /share/ocrmypdfauto/archive # archive (never tested)
chmod 777 /share/ocrmypdfauto/ -R
```
## Infos

*  All files are stored in `/share/ocrmypdfauto/(input|output|archive)`
*  Environment-Variables are prepared, for details see at [source](https://github.com/cmccambridge/ocrmypdf-auto)
*  If the addon crash with inotify exception, the directory creation didn't work
