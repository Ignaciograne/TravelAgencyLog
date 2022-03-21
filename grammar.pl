:-consult(gramatica).
:-consult(datos).

%------------------Funciones para listas------------------

/*
	Variable N = �ndece solicitado
	Variable Lista = Lista a evaluar
	Variable X = Valor en �ndice solicitado
	Retorna = Boolean
	Toma una lista y un �ndice y retorna el valor ubicado en ese �ndice
*/

obtenerN(N,Lista,X):-
	nth0(N,Lista,X).


/*
	Variable X = Elemento primero de la lista
	Variable R = Resto de la lista
	Retorna = Boolean
	Verifica si un elemento dado est� dentro de una lista, pasando uno por
	uno recursicamente con su cola, al llegar a la verificaci�n, retorna
	true
*/
miembro(X,[X|_]).
miembro(X,[_|R]):-miembro(X,R).


/*
	Variable Origen = Representa el valor encontrado en los or�genes de grafos
	Variable Respuesta = Representa inducida por el usario separado por comas
	Retorna = Boolean
	Solicita al usuario una respuesta a ser evaluada como oraci�n v�lida y si hay alguna palabra que sea un origen evaluada en el grafo en el archivo datos
*/
viajar_desde(Origen,Respuesta):-
	write('Ingrese su Origen \n'),
	readln(Respuesta,_,_,_,lowercase),
	miembro(Origen,Respuesta),
	oracion(Respuesta,[]),
	es_origen(Origen), !
	; write('No tenemos ese Origen disponible. \n'),
	viajar_desde(Origen,Respuesta).


/*
	Variable Origen = Representa el valor encontrado en los or�genes de grafos
	Variable Destino = Representa el valor encontrado en los destinos de grafos
	Retorna = Boolean
	Solicita al usuario una respuesta para ser evaluada como oraci�n v�lida, y se asignar�n valores que satisfagan si alguna se satisface en Destinos y que Origen sea diferente a Destino.
*/
viajar_hasta(Origen,Destino):-
	write('Ingrese su Destino \n.'),
	readln(Respuesta,_,_,_,lowercase),
	validar_destino(Origen,Destino,Respuesta), !
	; write('No tenemos ese Destino disponible. \n'),
	viajar_hasta(Origen, Destino).


/*
	Variable Origen = Representa el valor encontrado en los or�genes de grafos
	Variable Destino = Representa el valor encontrado en los destinos de grafos
	Retorna = Boolean
	Solicita al usuario una respuesta para ser evaluada como oraci�n v�lida, y se asignar�n valores que satisfagan si alguna se satisface en Destinos y que Origen sea diferente a Destino.
*/
preferencia_aerolinea(Aero):-
	write('Ingrese su Aerolinea. \n'),
	readln(Respuesta,_,_,_,lowercase),
        validar_Aero(Aero,Respuesta), !
	; write('No tenemos esta aerolinea disponible \n.'),
	preferencia_aerolinea(Aero).

preferencia_clase(Clase):-
	write('Ingrese su Clase [economica-ejecutiva-charter]. \n'),
	readln(Respuesta,_,_,_,lowercase),
	validar_clase(Clase,Respuesta), !
	; write('No tenemos esta clase disponible \n.'),
	preferencia_clase(Clase).

presupuesto(Presupuesto):-
	write('Ingresa tu presupuesto \n'),
	readln(Respuesta,_,_,_,lowercase),
	miembro(Presupuesto,Respuesta),
	number(Presupuesto), !
	; write('No he podido entenderte. \n'),
	presupuesto(Presupuesto).


validar_clase(Clase,Respuesta):-
	miembro(Clase,Respuesta),
	oracion(Respuesta,[]),
	es_clase(Clase).

validar_Aero(Aero,Respuesta):-
	oracion(Respuesta,[]),
	miembro(Aero,Respuesta),
        es_aerolinea(Aero).

validar_destino(Origen,Destino,Respuesta):-
	oracion(Respuesta,[]),
	miembro(Destino,Respuesta),
	Origen\=Destino,
	es_destino(Origen,Destino).


tomarInfo(Origen,Destino,Respuesta):-
	validar_destino(Origen,Destino,Respuesta). /*se pueden validar todos en un solo tomar info o validarlos antes del validar_tal*/

tomarInfo(Origen,Destino,_):-
	viajar_hasta(Origen,Destino).

tomarAero(Aero,Respuesta):-
	validar_Aero(Aero,Respuesta).

tomarAero(Aero,_):-
	preferencia_aerolinea(Aero).

tomarClase(Clase,Respuesta):-
	validar_clase(Clase,Respuesta).

tomarClase(Clase,_):-
	preferencia_clase(Clase).

iniciar():-
	write('Bienvenido a TravelAgencyLog, la mejor logica de llegar a su destino. \n'),
	viajar_desde(Origen,Respuesta),
	tomarInfo(Origen,Destino,Respuesta),
	tomarAero(Aerolinea,Respuesta),
	tomarClase(Clase,Respuesta),
	presupuesto(Presupuesto),
	/*camino_barato(Origen, Destino, Aerolinea,Clase,Presupuesto,_,Ruta),!*/

	write(Origen), write(' '), write(Destino), write(' '), write(Aerolinea), write(' '), write(Clase),  write(' '), write(Presupuesto).
	/*tirar_todo([Origen,Destino,Aerolinea,Clase,400]).*/








