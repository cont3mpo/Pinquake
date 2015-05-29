#!/bin/bash
notify-send 'Pinquake (Global)' 'Esperando sismo y notificar...'
echo 'Pinquake (Global) - Esperando sismo y notificar...'
touch /tmp/nuevo_usgs /tmp/viejo_usgs 
touch /tmp/nuevo_geofon /tmp/viejo_geofon 
touch /tmp/nuevo_emsc /tmp/viejo_emsc 
while sleep 1m; (curl -s http://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/4.5_day.csv | cut -d ',' -f 1,5,14- | cut -c -19,25- | sed '1d ; s/T/ / ; s/,/ - /g ; s/"//g' | cut -d '-' -f -6 | cut -c 23- > /tmp/nuevo_usgs); do (diff /tmp/nuevo_usgs /tmp/viejo_usgs | head -n 1); done | while read line; do (notify-send -t 0 "Pinquake (Global)" "<b>USGS</b>: `head -n 1 /tmp/nuevo_usgs`"); cp /tmp/nuevo_usgs /tmp/viejo_usgs; done | while sleep 1m; (curl -s http://geofon.gfz-potsdam.de/eqinfo/list.php?fmt=rss | grep -e title -e description | cut -d '>' -f 2 | cut -d '<' -f 1 | sed '1,3d ; N;s/\n/ /' | cut -c 3- | cut -d ':' -f -2 > /tmp/nuevo_geofon); do (diff /tmp/nuevo_geofon /tmp/viejo_geofon | head -n 1); done | while read line; do (notify-send -t 0 "Pinquake (Global)" "<b>GEOFON</b>: `head -n 1 /tmp/nuevo_geofon`"); cp /tmp/nuevo_geofon /tmp/viejo_geofon; done | while sleep 1m; (curl -s 'http://www.emsc-csem.org/service/rss/rss.php?typ=emsc&magmin=4' | cut -d '>' -f 3,15 | sed '1,7d ; s\</title>\ \g ; s/UTC//g' | cut -c 4- | cut -d '<' -f -1 > /tmp/nuevo_emsc); do (diff /tmp/nuevo_emsc /tmp/viejo_emsc | head -n 1); done | while read line; do (notify-send -t 0 "Pinquake (Global)" "<b>EMSC</b>: `head -n 1 /tmp/nuevo_emsc`"); cp /tmp/nuevo_emsc /tmp/viejo_emsc; done
