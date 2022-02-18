#!/usr/bin/bash
/home/steam/mesa/srcds_run -console -game bms +hostname $SERVER_NAME -secure -port 27016 +clientport 27017 +maxplayers 10 +mp_teamplay 1 +sv_always_run 1 +exec server.cfg +map bm_c0a0a