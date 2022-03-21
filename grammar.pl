:-consult(gramatica).
:-consult(datos).

<<<<<<< HEAD
% Estos se tienen que cumplir para hacer la transferencia con exito
sin_preferencia([no]).

miembro(X,[X|_]).
miembro(X,[_|R]):-miembro(X,R).

viajar_desde(P2):-
	readln(P,_,_,_,lowercase),
	miembro(P2,P),
	oracion(P,[]),
	es_origen(P2), !
	; write('La entrada no es valida. Introduce el origen nuevamente por favor: \n'),
	viajar_desde(P2).

viajar_hasta(P2,Q2):-
	readln(Q,_,_,_,lowercase),
	miembro(Q2,Q),
	oracion(Q,[]),
	es_destino(P2,Q2), !
	; write('La entrada no es valida. Introduce el destino por favor: \n'),
	viajar_hasta(P2, Q2).

/*
preferencia_aerolinea(_):-
	readln(R,_,_,_,lowercase),
	sin_preferencia(R),!.
*/
preferencia_aerolinea(R2):-
	readln(R,_,_,_,lowercase),
        miembro(R2,R),
	%oracion(R,[]),
        es_aerolinea(R2), !
	; write('La entrada no es valida. Introduce la aerolinea por favor: \n'),
	preferencia_aerolinea(R2).

/*
preferencia_clase(_):-
	readln(S,_,_,_,lowercase),
        sin_preferencia(S),!.
*/
preferencia_clase(S2):-
	readln(S,_,_,_,lowercase),
	miembro(S2,S),
	%oracion(S,[]),
	es_clase(S2), !
	; write('La entrada no es valida. Introduce la clase por favor [economica-ejecutiva-primera clase]: \n'),
	preferencia_clase(S2).
/*
presupuesto(_):-
	readln(T,_,_,_,lowercase),
	sin_preferencia(T),!.
*/
presupuesto(T2):-
	readln(T),
	miembro(T2,T),
	%oracion(T,[]),
	number(T2), !
	; write('La entrada no es valida. Introduce el presupuesto por favor: \n'),
    	presupuesto(T2).

obtenerN(N,Lista,X):- 
	nth0(N,Lista,X).
=======
%------------------Funciones para listas------------------

/*
	Variable N = índece solicitado
	Variable Lista = Lista a evaluar
	Variable X = Valor en indice solicitado
	Retorna = Boolean
	Toma una lista y un índice y retorna el valor ubicado en ese índice
*/
obtenerN(N,Lista,X):-
	nth0(N,Lista,X).


/*
	Variable X = Elemento primero de la lista
	Variable R = Resto de la lista
	Retorna = Boolean
	Verifica si un elemento dado está dentro de una lista, pasando uno por
	uno recursicamente con su cola, al llegar a la verificación, retorna
	true
*/
miembro(X,[X|_]).
miembro(X,[_|R]):-miembro(X,R).


/*
	Variable Origen = Representa el valor encontrado en los origenes de grafos
	Variable Respuesta = Representa inducida por el usario separado por comas
	Retorna = Boolean
	Solicita al usuario una respuesta a ser evaluada como oración valida y si hay alguna palabra que sea un origen evaluada en el grafo en el archivo datos
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
	Variable Origen = Representa el valor encontrado en los orígenes de grafos
	Variable Destino = Representa el valor encontrado en los destinos de grafos
	Retorna = Boolean
	Solicita al usuario una respuesta para ser evaluada como oración válida, y se asignarán valores que satisfagan si alguna se satisface en Destinos y que Origen sea diferente a Destino.
*/
viajar_hasta(Origen,Destino):-
	write('Ingrese su Destino \n.'),
	readln(Respuesta,_,_,_,lowercase),
	oracion(Respuesta,[]),
	validar_destino(Origen,Destino,Respuesta), !
	; write('No tenemos ese Destino disponible. \n'),
	viajar_hasta(Origen, Destino).


/*
	Variable Origen = Representa el valor encontrado en los origenes de grafos
	Variable Destino = Representa el valor encontrado en los destinos de grafos
	Retorna = Boolean
	Solicita al usuario una respuesta para ser evaluada como oración válida, y se asignarán valores que satisfagan si alguna se satisface en Destinos y que Origen sea diferente a Destino.
*/
preferencia_aerolinea(Aero):-
	write('Ingrese su Aerolinea. \n'),
	readln(Respuesta,_,_,_,lowercase),
	oracion(Respuesta,[]),
        validar_Aero(Aero,Respuesta), !
	; write('No tenemos esta aerolinea disponible \n.'),
	preferencia_aerolinea(Aero).

/*
	Variable Clase = Representa el valor encontrado para una clase encontrada en el grafo
	Retorna = Boolean
	Solicita al usuario una respuesta para ser evaluada como oración y dentro de ella dar el valor a la Clas, en caso de no encontrarlo, devuelve un mesaje y pregunta de nuevo
	*/
preferencia_clase(Clase):-
	write('Ingrese su Clase [economica-ejecutiva-charter]. \n'),
	readln(Respuesta,_,_,_,lowercase),
	oracion(Respuesta,[]),
	validar_clase(Clase,Respuesta), !
	; write('No tenemos esta clase disponible \n.'),
	preferencia_clase(Clase).


/*
	Variable Presupuesto = Representa el valor encontrado para un presupuesto valor numero
	Retorna = Boolean
	Solicita al usuario una respuesta para ser evaluada como oracion y dentro de ella dar el valor a Presupuesto, en caso de no encontrarlo, devuelve un mesaje y pregunta de nuevo
	*/
presupuesto(Presupuesto):-
	write('Ingresa tu presupuesto \n'),
	readln(Respuesta,_,_,_,lowercase),
	miembro(Presupuesto,Respuesta),
	number(Presupuesto), !
	; write('No he podido entenderte. \n'),
	presupuesto(Presupuesto).


/*
	Variable Clase = Representa el valor encontrado para una clase dada
	Retorna = Boolean
	Verifica si la hay un elemento es una clase existente en el grafo
	*/
validar_clase(Clase,Respuesta):-
	miembro(Clase,Respuesta),
	es_clase(Clase).


/*
	Variable Clase = Representa el valor encontrado para una Aerolinea dada
	Retorna = Boolean
	Verifica si la hay un elemento es una aerolinea existente en el grafo
	*/
validar_Aero(Aero,Respuesta):-
	miembro(Aero,Respuesta),
	es_aerolinea(Aero).


/*
	Variable Origen = Representa el valor encontrado para un Origen dado
	Variable Destino = Representa el valor encontrado para un Destino dado
	Variable Respuesta = Represent la lista de átomos digitados por el usuario
	Retorna = Boolean
	Verifica dentro de la respuesta del usuario, hay destino diferente al Origen
	*/
validar_destino(Origen,Destino,Respuesta):-
	miembro(Destino,Respuesta),
	Origen\=Destino,
	es_destino(Origen,Destino).


/*
	Variable Origen = Representa el valor encontrado para un Origen dado
	Variable Destino = Representa el valor encontrado para un Destino dado
	Variable Respuesta = Represenat la lista de átomos digitados por el usuario
	Retorna = Boolean
	Verifica si los valores dados sean diferentes el uno del otro
	*/
tomarInfo(Origen,Destino,Respuesta):-
	validar_destino(Origen,Destino,Respuesta).


/*
	Variable Origen = Representa el valor encontrado para un Origen dado
	Variable Destino = Representa el valor encontrado para un Destino dado
	Condición de parada, si no son difernetes o no existen, vuelve a solicitarlos
	*/
tomarInfo(Origen,Destino,_):-
	viajar_hasta(Origen,Destino).


/*
	Variable Aero = Representa el valor encontrado para un Aerolinea dado
	Variable Respuesta = Representa la lista de átomos digitados por el usuario
	Retorna = Boolean
	Valida si la Aerolinea dada se encontra dentro de la respuesta	*/
tomarAero(Aero,Respuesta):-
	validar_Aero(Aero,Respuesta).


/*
	Variable Aero = Representa el valor encontrado para un Origen dado
	Variable Respuesta = Representa la lista de átomos digitados por el usuario
	Retorna = Boolean
	Condición de parada, sin importar la respuestas, envía al usuario a ingresar la información	*/
tomarAero(Aero,_):-
	preferencia_aerolinea(Aero).


/*
	Variable Clase = Representa el valor encontrado para un Clase dado
	Variable Respuesta = Representa la lista de átomos digitados por el usuario
	Retorna = Boolean
	Valida si la clase dada se encontra dentro de la respuesta	*/
tomarClase(Clase,Respuesta):-
	validar_clase(Clase,Respuesta).


/*
	Variable Clsae = Representa el valor encontrado para un Origen dado
	Variable Respuesta = Representa la lista de átomos digitados por el usuario
	Retorna = Boolean
	Condición de parada, sin importar la respuestas, envía al usuario a ingresar la información	*/
tomarClase(Clase,_):-
	preferencia_clase(Clase).
>>>>>>> 1c266565e893a6235671ed0d50f373a5151e07df

tirar_todo(Lista):- write(Lista).

respuesta([]):-
	write('Lamentablemente no tenemos un vuelo que se ajuste a sus necesidades. \n'),
	write('Muchas gracias por utilizar TravelAgencyLog').

respuesta(A, B, C, D, E):-
	write('Su vuelo seria el '),
	write(A),
	write(', con ruta '),
	write(B),
	write(' con la aerolinea '),
	write(C),
	write(' en clase '),
	write(D),
	write('. El tiempo estimado es de '),
	write(E),
	write('.'),
	write('\n'),
	write('Muchas gracias por utilizar TravelAgencyLog').

/*
	Función Principal, da la bienvenida al usuario y solicita la información necesaria para encontrar una ruta de avión */
iniciar():-
	write('Bienvenido a TravelAgencyLog, la mejor logica de llegar a su destino. \n'),
	viajar_desde(Origen,Respuesta),
	tomarInfo(Origen,Destino,Respuesta),
	tomarAero(Aerolinea,Respuesta),
	tomarClase(Clase,Respuesta),
	presupuesto(Presupuesto),
	camino_barato(Origen, Destino, Aerolinea,Clase,Presupuesto,_,Ruta),!,
	write(Ruta).
	/*write(Origen), write(' '), write(Destino), write(' '), write(Aerolinea), write(' '), write(Clase),  write(' '), write(Presupuesto).*/
	/*tirar_todo([Origen,Destino,Aerolinea,Clase,400]).*/








	% Se recibe Lista
	% A = numero de vuelo 	obtenerN(0, Lista, A) 
	% B = ruta 		obtenerN(1, Lista, B)
	% C = aerolinea		obtenerN(2, Lista, C)
	% D = clase		obtenerN(3, Lista, D)
	% E = tiempo estimado	obtenerN(4, Lista, E)
	%respuesta(A, B, C, D, E).
