#!/bin/bash
notify-send "Pinquake (Japón)" "Esperando sismo para notificar..."
echo "Pinquake (Japón) - Esperando sismo para notificar..."
touch /tmp/nuevo_japon /tmp/viejo_japon
while sleep 1m; (curl -s http://www.jma.go.jp/en/quake/quake_local_index.html | sed -n '187,225p' | cut -d '>' -f 7,9,11 | sed 's| JST||g ; s|</td>| - |g ; s|</td||g' > /tmp/nuevo_japon); do (diff /tmp/nuevo_japon /tmp/viejo_japon | head -n 1); done | while read line; do (notify-send -t 0 "Pinquake (Japón)" "`head -n 1 /tmp/nuevo_japon`"); echo "`head -n 1 /tmp/nuevo_japon`"; cp /tmp/nuevo_japon /tmp/viejo_japon; done
