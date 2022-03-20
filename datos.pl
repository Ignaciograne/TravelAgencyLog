pais(mexico).  %1
pais(canada).  %2
pais(costa_rica). %3
pais(colombia). %4
pais(venezuela). %5
pais(peru). %6
pais(chile). %7
pais(brazil). %8
pais(argentina). %9

aerolinea(delta). %dt | 10
aerolinea(avianca). %av | 12
aerolinea(copa). %cp | 13
aerolinea(jetsmart). %js | 14

/*
Arco (Aerol�nea,
      Vuelo,
      AtoOrigen,
      AtoDestino,
      TiempoEstimado,
      Clase[Econ�mica-Negocios-Ambas],
      Costo)
*/

<<<<<<< HEAD

=======
>>>>>>> 98731990557095ff1c4a29004bcbfd1a6941d5bc
arco(delta,dt1097,argentina,chile,1,ambas,350).
arco(delta,dt1079,chile,argentina,1,ambas,350).
arco(delta,dt1087,brazil,chile,4,economica,550).
arco(delta,dt1074,chile,colombia,3,ambas,450).
arco(delta,dt1067,peru,chile,2,economica,300).
arco(delta,dt1084,brazil,colombia,4,negocios,700).
arco(delta,dt1048,colombia,brazil,4,negocios,700).
arco(delta,dt1048,colombia,venezuela,4,negocios,500).
arco(delta,dt1048,colombia,peru,4,economico,350).
arco(delta,dt1058,venezuela,brazil,4,economico,400).
arco(delta,dt1061,peru,mexico,7,ambas,650).
arco(delta,dt1012,mexico,canada,8,ambas,800).
arco(delta,dt1023,canada,costa_rica,10,negocios,1100).
arco(delta,dt1034,costa_rica,colombia,3,ambas,500).

/*
arco(avianca,av1297,argentina,chile,2,economico,300).
arco(avianca,av1279,chile,argentina,2,ambas,350).
arco(avianca,av1287,brazil,chile,6,negocios,700).
arco(avianca,av1274,chile,colombia,4,ambas,450).
arco(avianca,av1267,peru,chile,3,ambas,350).
arco(avianca,av1284,brazil,colombia,5,economico,600).
arco(avianca,av1248,colombia,brazil,5,economico,600).
arco(avianca,av1258,venezuela,brazil,4,negocios,550).
arco(avianca,av1261,peru,mexico,8,ambas,650).
arco(avianca,av1212,mexico,canada,9,ambas,800).
arco(avianca,av1223,canada,costa_rica,10,negocios,1100).
arco(avianca,av1234,costa_rica,colombia,4,economico,400).

arco(copa,cp1397,argentina,chile,3,ambas,300).
arco(copa,cp1379,chile,argentina,3,ambas,300).
arco(copa,cp1387,brazil,chile,5,economica,500).
arco(copa,cp1374,chile,colombia,2,ambas,400).
arco(copa,cp1367,peru,chile,3,economica,250).
arco(copa,cp1384,brazil,colombia,6,negocios,500).
arco(copa,cp1348,colombia,brazil,6,negocios,600).
arco(copa,cp1358,venezuela,brazil,3,economico,350).
arco(copa,cp1361,peru,mexico,5,ambas,480).
arco(copa,cp1312,mexico,canada,9,ambas,650).
arco(copa,cp1323,canada,costa_rica,9,negocios,900).
arco(copa,cp1334,costa_rica,colombia,4,ambas,400).

arco(jetsmart,js1497,argentina,chile,3,economico,300).
arco(jetsmart,js1479,chile,argentina,1,negocios,500).
arco(jetsmart,js1487,brazil,chile,3,negocios,700).
arco(jetsmart,js1474,chile,colombia,2,ambas,350).
arco(jetsmart,js1467,peru,chile,2,economica,300).
arco(jetsmart,js1484,brazil,colombia,3,negocios,800).
arco(jetsmart,js1448,colombia,brazil,3,negocios,800).
arco(jetsmart,js1458,venezuela,brazil,5,economico,350).
arco(jetsmart,js1461,peru,mexico,8,economico,400).
arco(jetsmart,js1412,mexico,canada,7,ambas,800).
arco(jetsmart,js1423,canada,costa_rica,8,negocios,1300).
arco(jetsmart,js1434,costa_rica,colombia,4,ambas,500).

*/


%mas barato
path(X, Y, N, Path) :- path(X, Y, N, [], Path).

path(X, Y, N, Seen, [X]) :-
    \+ memberchk(X, Seen),
    arco(_, _, X, Y, _, _, N).
path(X, Z, N, Seen, [X|T]) :-
    \+ memberchk(X, Seen),
    arco(_, _, X, Y, _, _, N0),
    path(Y, Z, N1, [X|Seen], T),
    \+ memberchk(X, T),
    N is N0 + N1.


uniq_shortest_path(X, Y, MinCost, Path) :-
    path(X, Y, MinCost, Path),
    \+ (path(X, Y, LowerCost, OtherPath),
        OtherPath \= Path,
        LowerCost =< MinCost).


es_origen(Ubicacion):-arco(_,_,Ubicacion,_,_,_,_).

% Define la misma lista de destinos disponibles que de origenes
es_destino(Origen,Destino):- Origen\=Destino, arco(_,_,_,Destino,_,_,_).
es_destino(Origen,Destino):- Origen=Destino, write('El destino no puede ser igual al origen. \n').

% Aerolineas
es_aerolinea(Aerolinea):- arco(Aerolinea,_,_,_,_,_,_).

% Clases
es_clase(Clase):-arco(_,_,_,_,_,Clase,_).


