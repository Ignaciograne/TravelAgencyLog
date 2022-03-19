% ------------------------------------------------------------
% Lugares
:-consult(gramatica).
:-consult(datos).

% -----------------------------------------------------------------

% Estos se tienen que cumplir para hacer la transferencia con exito
% ------------------

% Operadores
:-op(800,fx,si).
:-op(700,xfx,entonces).
:-op(300,xfy,o).
:-op(200,xfy,y).
% ----------

miembro(X,[X|_]).
miembro(X,[_|R]):-miembro(X,R).


%read_number(N) :-
%   read(N),  % get user input
%    number(N), !  % exit goal, is it a number?
%    ; read_number(N).  % recursive call if not number

    %conseguir_n():- read_number(N), write(N).

viajar_desde(P2):-
	readln(P,_,_,_,lowercase),
	miembro(P2,P),
	oracion(P,[]),
	es_origen(P2), !
	; viajar_desde(P2).


viajar_hasta(P2,Q2):-
	readln(Q,_,_,_,lowercase),
	miembro(Q2,Q),
	es_destino(P2,Q2), !
	; viajar_hasta(P2, Q2).

preferencia_aerolinea(R2):-
	readln(R,_,_,_,lowercase),
        miembro(R2,R),
        es_aerolinea(R2), !
	; preferencia_aerolinea(R2).

preferencia_clase(S2):-
	readln(S,_,_,_,lowercase),
	miembro(S2,S),
	es_clase(S2), !
	; preferencia_clase(S2).

/*presupuesto(Numero):-
	readln(T),
	miembro(Numero,T),
	es_Numero(Numero,T),!.

es_Numero(X,[_|R]):- X>0;es_Numero(X,R).*/


/*presupuesto(T):-
	read(T),
	number(T), !,
<<<<<<< HEAD
	; presupuesto(T).
=======
	;presupuesto(T).
>>>>>>> 164430d28473201af298115a9fd657f61cf7ca6a
*/

suggest():-
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
	write(' '), write(S), write(' '), write(T).




