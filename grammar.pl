% ------------------------------------------------------------
% Lugares

es_origen([costa_rica]).
es_origen([san_jose]).
es_origen([madrid]).
es_origen([barcelona]).
es_origen([espania]).
es_origen([china]).
es_origen([egipto]).
es_origen([paris]).
es_origen([francia]).

% Define la misma lista de destinos disponibles que de origenes
es_destino(X):- es_origen(X).

% Aerolineas
es_aerolinea([qatar_airways]).
es_aerolinea([singapore_airlines]).
es_aerolinea([emirates]).
es_aerolinea([japan_airlines]).
es_aerolinea([iberia]).

% Clases
es_clase([charter]).
es_clase([economica]).
es_clase([ejecutiva]).
es_clase([primera]).

% -----------------------------------------------------------------

% Estos se tienen que cumplir para hacer la transferencia con exito
hecho(origen).
hecho(destino).
hecho(aerolinea).
hecho(clase).
hecho(presupuesto).
% ------------------

% Operadores :-op(800,fx,si).
:-op(700,xfx,entonces).
:-op(300,xfy,o).
% :-op(200,xfy).
% ----------


suggest():- 
	
	write('Bienvenido a TravelAgencyLog, la mejor logica de llegar a su destino. Por favor indique cual es el origen de su vuelo: '), 
	read(P), 
	es_origen(P),
	
	write('De acuerdo. Indique su lugar de destino: '),
	read(Q),
	es_destino(Q),
	
	write('Tiene usted alguna aerolinea de preferencia? '),
	read(R),
	es_aerolinea(R),

	write('Cuenta con alguna clase de preferencia? '),
	read(S),
	es_clase(S),

	write('Tiene usted algún presupuesto? '),
	read(T)

	write(P), write(' '), write(Q),!.




