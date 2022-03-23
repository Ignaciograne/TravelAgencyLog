:-consult(gramatica).
:-consult(datos).

%------------------Funciones para listas------------------
sin_preferencia([no]).

/*
 Variable N = indice solicitado
 Variable Lista = Lista a evaluar
 Variable X = Valor en indice solicitado
 Retorna = Boolean
 Toma una lista y un indice y retorna el valor ubicado en ese indice
*/
obtenerN(N,Lista,X):-
	nth0(N,Lista,X).

/*
 Variable X = Elemento primero de la lista
 Variable R = Resto de la lista
 Retorna = Boolean
 Verifica si un elemento dado esta dentro de una lista, pasando uno por uno recursicamente con su cola, al llegar a la verificacion, retorna true
*/
miembro(X,[X|_]).
miembro(X,[_|R]):-miembro(X,R).

/*
 Variable Origen = Representa el valor encontrado en los origenes de grafos
 Variable Respuesta = Representa inducida por el usario separado por comas
 Retorna = Boolean
 Solicita al usuario una respuesta a ser evaluada como oracion valida y si hay alguna palabra que sea un origen evaluada en el grafo en el archivo datos
*/
viajar_desde(Origen,Respuesta):-
	write('Ingrese su origen \n'),
        readln(Respuesta,_,_,_,lowercase),
        miembro(Origen,Respuesta),
        oracion(Respuesta,[]),
        es_origen(Origen), !
        ; write('No tenemos ese origen disponible. \n'),
        viajar_desde(Origen,Respuesta).

/*
 Variable Origen = Representa el valor encontrado en los origenes de grafos
 Variable Destino = Representa el valor encontrado en los destinos de grafos
 Retorna = Boolean
 Solicita al usuario una respuesta para ser evaluada como oracion valida, y se asignaran valores que satisfagan si alguna se satisface en Destinos y que Origen sea diferente a Destino.
*/
viajar_hasta(Origen,Destino):-
	write('Ingrese su destino \n.'),
        readln(Respuesta,_,_,_,lowercase),
        oracion(Respuesta, []),
        validar_destino(Origen,Destino,Respuesta), !
        ; write('No tenemos ese destino disponible. \n'),
        viajar_hasta(Origen, Destino).

/*
 Variable Origen = Representa el valor encontrado en los origenes de grafos
 Variable Destino = Representa el valor encontrado en los destinos de grafos
 Retorna = Boolean
 Solicita al usuario una respuesta para ser evaluada como oracion valida, y se asignaran valores que satisfagan si alguna se satisface en destinos y que origen sea diferente a destino.
*/
preferencia_aerolinea(Aero):-
	write('Tiene alguna aerolinea de preferencia? \n'),
        readln(Respuesta,_,_,_,lowercase),
        sin_preferencia(Respuesta), !
        ; validar_Aero(Aero,Respuesta),
        oracion(Respuesta, []), !
        ; write('No tenemos esta aerolinea disponible \n.'),
        preferencia_aerolinea(Aero).

/*
 Variable Clase = Representa el valor encontrado para una clase encontrada en el grafo
 Retorna = Boolean
 Solicita al usuario una respuesta para ser evaluada como oracion y dentro de ella dar el valor a la Clase, en caso de no encontrarlo, devuelve un mesaje y pregunta de nuevo
*/
preferencia_clase(Clase):-
	write('Ingrese su clase [economica-ejecutiva-charter]. \n'),
        readln(Respuesta,_,_,_,lowercase),
        sin_preferencia(Respuesta), !
        ; validar_clase(Clase,Respuesta),
        oracion(Respuesta, []), !
        ; write('Entrada no valida \n.'),
        preferencia_clase(Clase).

/*
 Variable Presupuesto = Representa el valor encontrado para un presupuesto valor numero
 Retorna = Boolean
 Solicita al usuario una respuesta para ser evaluada como oracion y dentro de ella dar el valor a Presupuesto, en caso de no encontrarlo, devuelve un mesaje y pregunta de nuevo
*/
presupuesto(Presupuesto):-
	write('Ingrese su presupuesto \n'),
        readln(Respuesta,_,_,_,lowercase),
        miembro(Presupuesto,Respuesta),
        number(Presupuesto), !
        ; sin_preferencia(Respuesta),
        Presupuesto = 1000000, !
        ; write('Presupuesto no valido. \n'),
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
 Variable Clase = Representa el valor encontrado para una aerolinea dada
 Retorna = Boolean
 Verifica si la hay un elemento es una aerolinea existente en el grafo
*/
validar_Aero(Aero,Respuesta):-
	miembro(Aero,Respuesta),
	es_aerolinea(Aero).


/*
 Variable Origen = Representa el valor encontrado para un origen dado
 Variable Destino = Representa el valor encontrado para un destino dado
 Variable Respuesta = Represent la lista de atomos digitados por el usuario
 Retorna = Boolean
 Verifica dentro de la respuesta del usuario, hay destino diferente al Origen
*/
validar_destino(Origen,Destino,Respuesta):-
	miembro(Destino,Respuesta),
	Origen\=Destino,
	es_destino(Origen,Destino).


/*
 Variable Origen = Representa el valor encontrado para un origen dado
 Variable Destino = Representa el valor encontrado para un destino dado
 Variable Respuesta = Representa la lista de atomos digitados por el usuario
 Retorna = Boolean
 Verifica si los valores dados sean diferentes el uno del otro
*/
tomarInfo(Origen,Destino,Respuesta):-
	validar_destino(Origen,Destino,Respuesta).


/*
 Variable Origen = Representa el valor encontrado para un origen dado
 Variable Destino = Representa el valor encontrado para un destino dado
 Condicion de parada, si no son diferentes o no existen, vuelve a solicitarlos
*/
tomarInfo(Origen,Destino,_):-
	viajar_hasta(Origen,Destino).


/*
 Variable Aero = Representa el valor encontrado para un Aerolinea dado
 Variable Respuesta = Representa la lista de atomos digitados por el usuario
 Retorna = Boolean
 Valida si la aerolinea dada se encontra dentro de la respuesta	
*/
tomarAero(Aero,Respuesta):-
	validar_Aero(Aero,Respuesta).


/*
 Variable Aero = Representa el valor encontrado para un Origen dado
 Variable Respuesta = Representa la lista de atomos digitados por el usuario
 Retorna = Boolean
 Condicion de parada, sin importar la respuestas, envia al usuario a ingresar la informacion	
*/
tomarAero(Aero,_):-
	preferencia_aerolinea(Aero).


/*
 Variable Clase = Representa el valor encontrado para una clase dada
 Variable Respuesta = Representa la lista de atomos digitados por el usuario
 Retorna = Boolean
 Valida si la clase dada se encontra dentro de la respuesta
*/
tomarClase(Clase,Respuesta):-
	validar_clase(Clase,Respuesta).


/*
 Variable Clase = Representa el valor encontrado para un origen dado
 Variable Respuesta = Representa la lista de atomos digitados por el usuario
 Retorna = Boolean
 Condicion de parada, sin importar la respuestas, envia al usuario a ingresar la informacion
*/
tomarClase(Clase,_):-
	preferencia_clase(Clase).

respuesta(A, B, C, D, E, F, G):-
        write('Su vuelo seria con la aerolinea '),
        write(A),
        write(', en el vuelo '),
        write(B),
        write('con ruta '),
        write(C),
        write(' - '),
        write(D),
        write('. '),
        write('La duracion es de aproximadamente '),
        write(E),
        write(' hora(s), '),
        write(' en clase '),
        write(F),
        write('. '),
        write('El precio de este vuelo es de '),
        write(G),
        write('.'),
        write('\n').

recorrer([Lista | Resto]):-
        obtenerN(0, Lista, A),
        obtenerN(1, Lista, B),
        obtenerN(2, Lista, C),
        obtenerN(3, Lista, D),
        obtenerN(4, Lista, E),
        obtenerN(5, Lista, F),
        obtenerN(6, Lista, G),


        respuesta(A, B, C, D, E, F, G),
        recorrer(Resto), !
        ; write('Gracias por utilizar TravelAgencyLog').

iniciar():-
	write('Bienvenido a TravelAgencyLog, la mejor logica de llegar a su destino. \n'),
	viajar_desde(Origen,Respuesta),
	tomarInfo(Origen,Destino,Respuesta),
	tomarAero(Aerolinea,Respuesta),
	tomarClase(Clase,Respuesta),
	presupuesto(Presupuesto),
	camino_barato(Origen, Destino, Aerolinea,Clase,Presupuesto,_,Ruta),!,
	recorrer(Ruta).
