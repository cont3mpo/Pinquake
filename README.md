# Pinquake (Linux)
Notificación de terremotos para Linux (Earthquakes notification for Linux)
<ul>
<li>pinquake_global.sh - Un bash script que notifica de los terrremotos a nivel global desde tres fuentes de medición (USGS, GEOFON, EMSC), todos los sismos que notifica son sobre los 4.0/4.5 grados de magnitud.</li>
<li>pinquake_chile.sh - Notifica de los nuevos sismos que ocurren en Chile, sobre los 3.0 grados de magnitud (Centro Sismológico de la Universidad de Chile).</li>
<li>pinquake_japon.sh - Notifica de los nuevos sismos en Japón (Japan Meteorological Agency).</li>
</ul>
Todos utilizan <code>notify-send</code> para las notificaciones en Linux. La notificación queda en frente hasta que la cierres.

Dar permisos a ejecutables en terminal: chmod +x *.sh
