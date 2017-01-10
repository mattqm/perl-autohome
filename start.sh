set -a
appdir=/code/Dancer/AutoHome
environment=development
workers=2
port=3001
plackup -s Starman -a $appdir/bin/app.pl -I $appdir/lib -E $environment -l :$port --workers=$workers
