#!/bin/bash
notify-send 'Pinquake (Chile)' 'Esperando sismo y notificar...'
echo 'Pinquake (Chile) - Esperando sismo y notificar...'
touch /tmp/nuevo_chile /tmp/viejo_chile
while sleep 1m; (curl -s http://sismologia.cl/links/tabla.html | sed -n '26,40p' | cut -d '>' -f 4,7,9 | sed 's|</a>| - |g ; s|</td>| - |g ; s|Ml[^>]*||g' > /tmp/nuevo_chile); do diff /tmp/nuevo_chile /tmp/viejo_chile | head -n 1; done | while read line; do notify-send -t 0 "Pinquake (Chile)" "`head -n 1 /tmp/nuevo_chile`"; cp /tmp/nuevo_chile /tmp/viejo_chile; done
