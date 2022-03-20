:-consult(gramatica).
:-consult(datos).

% Estos se tienen que cumplir para hacer la transferencia con exito
miembro(X,[X|_]).
miembro(X,[_|R]):-miembro(X,R).

viajar_desde(Origen,Respuesta):-
	write('Ingrese su Origen \n'),
	readln(Respuesta,_,_,_,lowercase),
	miembro(Origen,Respuesta),
	oracion(Respuesta,[]),
	es_origen(Origen), !
	; write('No tenemos ese Origen disponible.'),
	viajar_desde(Origen,Respuesta).

viajar_hasta(Origen,Destino):-
	write('Ingrese su Destino \n.'),
	readln(Respuesta,_,_,_,lowercase),
	validar_destino(Origen,Destino,Respuesta), !
	; write('No tenemos ese Destino disponible.'),
	viajar_hasta(Origen, Destino).

preferencia_aerolinea(Aero):-
	write('Ingrese su Aerolinea. \n'),
	readln(Respuesta,_,_,_,lowercase),
        validar_Aero(Aero,Respuesta), !
	; write('No tenemos esta aerolinea disponible \n.'),
	preferencia_aerolinea(Aero).

preferencia_clase(Clase):-
	write('Ingrese su Clase [economica-ejecutiva-primera clase]. \n'),
	readln(Respuesta,_,_,_,lowercase),
	validar_clase(Clase,Respuesta), !
	; write('No tenemos esta clase disponible \n.'),
	preferencia_clase(Clase).

presupuesto(T2):-
	readln(T),
	miembro(T2,T),
	%oracion(T,[]),
	number(T2), !
	; write('No he podido entenderte. Introduce el presupuesto por favor: \n'),
	presupuesto(T2).

tomarInfo(Origen,Destino,Respuesta):-
	validar_destino(Origen,Destino,Respuesta).

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

/*preguntar([Origen,Destino]):-
	viajar_desde(Origen,Respuesta),
	validar().*/
iniciar():-
	write('Bienvenido a TravelAgencyLog, la mejor logica de llegar a su destino. \n'),
	viajar_desde(Origen,Respuesta),
	tomarInfo(Origen,Destino,Respuesta),
	tomarAero(Aerolinea,Respuesta),
	tomarClase(Clase,Respuesta),
	write(Origen), write(' '), write(Destino), write(' '), write(Aerolinea), write(' '), write(Clase).
	/*

	write('Tiene usted alguna aerolinea de preferencia? \n'),
	preferencia_aerolinea(Aerolinea),

	write('Cuenta con alguna clase de preferencia? \n'),
	preferencia_clase(Clase),

	write('Tiene usted algún presupuesto? \n'),
	presupuesto(Presupuesto),

	write(Origen), write(' '), write(Destino), write(' '), write(Aerolinea),
	write(' '), write(Clase), write(' '), write(Presupuesto).*/




