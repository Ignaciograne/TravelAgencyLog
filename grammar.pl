% ------------------------------------------------------------
% Lugares

es_origen(costa_rica).
es_origen(san_jose).
es_origen(madrid).
es_origen(barcelona).
es_origen(espania).
es_origen(china).
es_origen(egipto).
es_origen(paris).
es_origen(francia).


% Define la misma lista de destinos disponibles que de origenes
es_destino(X,Y):- X\=Y, es_origen(Y).
es_destino(X,Y):- X=Y, write('El destino no puede ser igual al origen. \n').

% Aerolineas
es_aerolinea(qatar_airways).
es_aerolinea(singapore_airlines).
es_aerolinea(emirates).
es_aerolinea(japan_airlines).
es_aerolinea(iberia).

% Clases
es_clase(charter).
es_clase(economica).
es_clase(ejecutiva).
es_clase(primera).


% -----------------------------------------------------------------

% Estos se tienen que cumplir para hacer la transferencia con exito
hecho(origen).
hecho(destino).
hecho(aerolinea).
hecho(clase).
hecho(presupuesto).
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
	es_origen(P2), ! 
	; viajar_desde(P2).

viajar_hasta(P2,Q2):-
	readln(Q,_,_,_,lowercase),
	miembro(Q2,Q),
	es_destino(P2,Q2), !
	; viajar_hasta(P2, Q2).

suggest():- 
	write('Bienvenido a TravelAgencyLog, la mejor logica de llegar a su destino. \n'),
	write('Por favor indique cual es el origen de su vuelo: \n'),
	
	viajar_desde(P),

	%readln(P,_,_,_,lowercase),
	%miembro(P2,P),
	%es_origen(P2),
	
	write('De acuerdo. Indique su lugar de destino: \n'),
	
	viajar_hasta(P,Q),
	%readln(Q,_,_,_,lowercase),
	%miembro(Q2,Q),
	%es_destino(P,Q2),
	
	write('Tiene usted alguna aerolinea de preferencia? \n'),
	readln(R,_,_,_,lowercase),
	miembro(R2,R),
	es_aerolinea(R2),

	write('Cuenta con alguna clase de preferencia? \n'),
	readln(S,_,_,_,lowercase),
	miembro(S2,S),
	es_clase(S2),

	write('Tiene usted algún presupuesto? \n'),
	read(T),
	number(T),

	write(P), write(' '), write(Q), write(' '), write(T).




