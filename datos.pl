arco(delta,dt1097,argentina,chile,1,ambas,350).
arco(delta,dt1079,chile,argentina,1,ambas,350).

arco(delta,dt1097,argentina,chile,1,economica,350).
arco(delta,dt1097,argentina,chile,1,negocios,450).

arco(delta,dt1079,chile,argentina,1,economica,350).
arco(delta,dt1079,chile,argentina,1,negocios,500).

arco(delta,dt1087,brazil,chile,4,economica,550).

arco(delta,dt1074,chile,colombia,3,economica,450).
arco(delta,dt1074,chile,colombia,3,negocios,450).

arco(delta,dt1067,peru,chile,2,economica,300).
arco(delta,dt1084,brazil,colombia,4,negocios,700).
arco(delta,dt1048,colombia,brazil,4,negocios,700).

arco(delta,dt1048,colombia,venezuela,4,economica,450).
arco(delta,dt1048,colombia,venezuela,4,negocios,600).


arco(delta,dt1048,colombia,peru,4,economica,350).
arco(delta,dt1058,venezuela,brazil,4,economica,400).

arco(delta,dt1061,peru,mexico,7,economica,600).
arco(delta,dt1061,peru,mexico,7,negocios,800).

arco(delta,dt1012,mexico,canada,8,economica,700).
arco(delta,dt1012,mexico,canada,8,negocios,850).

arco(delta,dt1023,canada,costa_rica,10,negocios,1100).

arco(delta,dt1034,costa_rica,colombia,3,economica,400).
arco(delta,dt1034,costa_rica,colombia,3,negocios,550).



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
arco(copa,cp1387,brazil,chile,5,economico,500).
arco(copa,cp1374,chile,colombia,2,ambas,400).
arco(copa,cp1367,peru,chile,3,economico,250).
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




% origen, destino, aerolinea,clase,presupuesto
% mas barato
path(Origen, Destino, Aerolinea, Clase, Presupuesto, Costo, Tiempo, Rutas) :-
    path(Origen, Destino, Aerolinea, Clase, Presupuesto, Costo, Tiempo, [], Rutas).

path(Origen, Destino, Aerolinea, Clase, Presupuesto, Costo, Tiempo, NodosVisitados,
     [[Aerolinea, Vuelo, Origen, Destino, Tiempo, Clase, Costo]]) :-

    \+ memberchk(Origen, NodosVisitados),
    arco(Aerolinea, Vuelo, Origen, Destino, Tiempo, Clase, Costo),
    Presupuesto >= Costo.


path(Origen, Destino, Aerolinea, Clase, Presupuesto, Costo, Tiempo, NodosVisitados,
     [[Aerolinea, Vuelo,Origen,Escala,Tiempo0,Clase,Costo0]|Cola]) :-

    \+ memberchk(Origen, NodosVisitados),
    arco(Aerolinea, Vuelo, Origen, Escala, Tiempo0, Clase, Costo0),
    path(Escala, Destino, Aerolinea, Clase, Presupuesto, Costo1, Tiempo1, [Origen|NodosVisitados], Cola),
    \+ memberchk(Origen, Cola),
    Costo is Costo0 + Costo1,
    Tiempo is Tiempo0 + Tiempo1,
    \+ fuera_de_presupuesto(Presupuesto, Costo).

/*define presupuesto*/
camino_barato(Origen, Destino, Aerolinea, Clase, Presupuesto,Costo, Ruta) :-
    path(Origen, Destino, Aerolinea, Clase, Presupuesto, Costo,_, Ruta),
    \+ (path(Origen, Destino, Aerolinea, Clase, Presupuesto, CostoBajo,_, OtraRuta),
        OtraRuta \= Ruta,
        CostoBajo =< Costo).

/*Prepuesto no*/
camino_rapido(Origen, Destino, Aerolinea, Clase, Presupuesto,Tiempo, Ruta) :-
    path(Origen, Destino, Aerolinea, Clase, Presupuesto, _, Tiempo, Ruta),
    \+ (path(Origen, Destino, Aerolinea, Clase, Presupuesto, _,TiempoBajo, OtraRuta),
        OtraRuta \= Ruta,
        TiempoBajo =< Tiempo).


fuera_de_presupuesto(Presupuesto , Costo) :- not(Presupuesto >= Costo), write('Presupuesto insuficiente. \n').

es_origen(Ubicacion):-arco(_,_,Ubicacion,_,_,_,_).

% Define la misma lista de destinos disponibles que de origenes
es_destino(Origen,Destino):- Origen\=Destino, arco(_,_,_,Destino,_,_,_).
es_destino(Origen,Destino):- Origen=Destino, write('El destino no puede ser igual al origen. \n').

% Aerolineas
es_aerolinea(Aerolinea):- arco(Aerolinea,_,_,_,_,_,_).

% Clases
es_clase(Clase):-arco(_,_,_,_,_,Clase,_).

concatenar([],L,L).
concatenar([X|L1],L2,[X|L3]):- concatenar(L1,L2,L3).


















