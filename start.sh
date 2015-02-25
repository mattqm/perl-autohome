set -a
appdir=/code/websites/autohome/WebApp
environment=development
workers=2
port=3001
plackup -s Starman -a $appdir/bin/app.pl -I $appdir/lib -E $environment -l 192.168.128.50:$port --workers=$workers
