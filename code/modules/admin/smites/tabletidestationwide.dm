// Tableslams the target across every table on the station
/datum/smite/tabletidestationwide
	name = "TABLETIDE STATION WIDE"

/datum/smite/tabletidestationwide/effect(client/user, mob/living/target)
	priority_announce("[target] has brought the wrath of the gods upon themselves and is now being tableslammed across the station. Please stand by.")
	var/list/areas = list()
	for(var/area/A in world)
		if(A.z == SSmapping.station_start)
			areas += A
	SEND_SOUND(target, sound('sound/misc/slamofthenorthstar.ogg',volume=40))
	for(var/area/A in areas)
		for(var/obj/structure/table/TABLE in A)
			TABLE.tablepush(target, target)
			sleep(1)
