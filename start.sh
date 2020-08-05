set -a
appdir=~/code/Dancer/AutoHome
environment=development
workers=20
port=3001
kato=1
rto=5
plackup -s Starman -a $appdir/bin/app.pl -I $appdir/lib -E $environment -l :$port --workers=$workers --keepalive-timeout=$kato --read-timeout=$rto
