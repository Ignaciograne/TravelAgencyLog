:-consult(gramatica).
:-consult(datos).

% Estos se tienen que cumplir para hacer la transferencia con exito
miembro(X,[X|_]).
miembro(X,[_|R]):-miembro(X,R).

viajar_desde(P2):-
	readln(P,_,_,_,lowercase),
	miembro(P2,P),
	oracion(P,[]),
	es_origen(P2), !
	; write('No he podido entenderte. Introduce el origen por favor: \n'),
	viajar_desde(P2).

viajar_hasta(P2,Q2):-
	readln(Q,_,_,_,lowercase),
	miembro(Q2,Q),
	oracion(Q,[]),
	es_destino(P2,Q2), !
	; write('No he podido entenderte. Introduce el destino por favor: \n'),
	viajar_hasta(P2, Q2).

preferencia_aerolinea(R2):-
	readln(R,_,_,_,lowercase),
        miembro(R2,R),
	%oracion(R,[]),
        es_aerolinea(R2), !
	; write('No he podido entenderte. Introduce la aerolinea por favor: \n'),
	preferencia_aerolinea(R2).

preferencia_clase(S2):-
	readln(S,_,_,_,lowercase),
	miembro(S2,S),
	%oracion(S,[]),
	es_clase(S2), !
	; write('No he podido entenderte. Introduce la clase por favor [economica-ejecutiva-primera clase]: \n'),
	preferencia_clase(S2).

presupuesto(T2):-
	readln(T),
	miembro(T2,T),
	%oracion(T,[]),
	number(T2), !
	; write('No he podido entenderte. Introduce el presupuesto por favor: \n'),
    	presupuesto(T2).

obtenerN(N,Lista,X):- 
	nth0(N,Lista,X).

iniciar():-
	write('Bienvenido a TravelAgencyLog, la mejor logica de llegar a su destino. \n'),

	write('Por favor indique cual es el origen de su vuelo: \n'),
	viajar_desde(P),

	write('De acuerdo. Indique su lugar de destino: \n'),
	viajar_hasta(P,Q),

	write('Tiene usted alguna aerolinea de preferencia? \n'),
	preferencia_aerolinea(R),

	write('Cuenta con alguna clase de preferencia? \n'),
	preferencia_clase(S),

	write('Tiene usted algún presupuesto? \n'),
	presupuesto(T),

	write(P), write(' '), write(Q), write(' '), write(R),
	write(' '), write(S), write(' '), write(T),


	tirar_todo([P,Q,R,S,T]).

