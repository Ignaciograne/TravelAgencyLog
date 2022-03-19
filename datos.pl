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

arco(delta,dt1097,argentina,chile,1,ambas,350).
arco(delta,dt1079,chile,argentina,1,ambas,350).
arco(delta,dt1087,brazil,chile,4,economica,550).
arco(delta,dt1074,chile,colombia,3,ambas,450).
arco(delta,dt1067,peru,chile,2,economica,300).
arco(delta,dt1084,brazil,colombia,4,negocios,700).
arco(delta,dt1048,colombia,brazil,4,negocios,700).
arco(delta,dt1058,venezuela,brazil,4,economico,400).
arco(delta,dt1061,peru,mexico,7,ambas,650).
arco(delta,dt1012,mexico,canada,8,ambas,800).
arco(delta,dt1023,canada,costa_rica,10,negocios,1100).
arco(delta,dt1034,costa_rica,colombia,3,ambas,500).

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


es_origen(Ubicacion):-arco(_,_,Ubicacion,_,_,_,_).

conexion(Inicio,Final,Intermedio,Precio) :-
    arco(_,_,Inicio,Intermedio,_,_,Precio1),
    arco(_,_,Intermedio,Final,_,_,Precio2),
    Precio is Precio1+Precio2.

camino(Inicio,Final) :- arco(_,_,Inicio,Final,_,_,_), ! .
camino(Inicio,Final) :- arco(_,_,Inicio,Intermedio,_,_,_),
    camino(Intermedio,Final).

% Clases
es_clase(Clase):-arco(_,_,_,_,_,Clase,_).


/*
%Implementacion de Dijkstra
%definimos un grafo

grafo(a,c,60).
grafo(a,e,80).
grafo(b,a,30).
grafo(b,d,20).
grafo(d,e,10).
grafo(d,a,60).
grafo(c,e,50).
grafo(c,x,40).
grafo(e,f,20).
grafo(f,x,50).
grafo(x,g,30).
grafo(g,c,20).



%nodo inicial, nodo destino, distancia, ruta

%dijkstra(I,F,S,C,L), donde I es el nodo inicio,F el nodo Final,
%S la lista de nodos seleccionados, C la lista de nodos candidatos,
%L la lista de respuesta del camino y R de salida igual,L indica si
% hay camino de I a F.

dijkstra(_,_,_,[],L):- L=[].


%en el siguiente predicado se ejecuta cuando se encuentra la
%solucion: se determina la menorArista del Nodo I y se guarda
%en A el nodo ke hace posible esto, luego se verifica si es el final
% y por ultimo se agrega a la lista de salida.

dijkstra(I,F,S,_,L):- menorArista(I,A),
    A==F,
    append(S,A,Lista),
    L = Lista.



%caso que A(nodo de menor arista) sea diferente de del nodo
%final, luego agregamos a la lista de seleccionados el nodo A y
%lo eliminamos de la lista de candidatos y llamamos de nuevo
%a la funci�n dijkstra.

dijkstra(I,F,S,C,L):-
    menorArista(I,A),
    A\=F, %siA es diferente de F,osea no es el nodo destino
    append(S,A,Lista1),
    eliminar(A,C,Lista2),
    dijkstra(A,F,Lista1,Lista2,L).




menorArista(I,A):- findall(P,grafo(I,_,P),L),
    menorlista(L,Menor),
    grafo(I,A,Menor).





%Detectar el menor elemento de una lista
menorlista([],0).
menorlista([X],X).
menorlista([X|L],X):- menorlista(L,Y),
    menor(X,Y).
menorlista([X|L],Y):- menorlista(L,Y),
    menor(Y,X).
menor(X,Y):- X =< Y.


%agregar un elemento al final de la lista
append([],L,[L]).
append([H|T],N,[H|S]):-append(T,N,S).



%eliminamos un elemento X de la lista
eliminar(_,[],[]):-fail.
append(S,A,Lista1),
eliminar(A,C,Lista2),
dijkstra(A,F,Lista1,Lista2,L).
eliminar(X,[X|R],R).
eliminar(X,[C|R],[C|R1]):- eliminar(X,R,R1).


*/










