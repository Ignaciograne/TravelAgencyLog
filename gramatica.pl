/*
Sintaxis del espaniol por
Andy Ramirez Fonseca
Ignacio Grane
Juan Rodriguez*/

/*Consulta a grafo*/
:-consult(datos).

/*El operador funciona como ([_|R],R) donde puede tomar cual forma de las definidas
Siempre peuden ser vacias en caso de no existir*/

/*Verbos congujados en presente simple y futuro simple*/
verbo--> [].
verbo--> [dirijo];[diriges];[dirige];[dirigimos];[dirigen].
verbo--> [dirigire];[dirigiras];[dirigira];[digiremos];[dirigiran];[dirigirnos].
verbo--> [desplazo];[desplazas];[desplaza];[desplazamos];[desplazan].
verbo--> [desplazare];[desplazaras];[desplazara];[desplazaremos].
verbo--> [estoy];[estas];[esta];[estamos];[estan].
verbo--> [estare];[estaras];[estara];[estaremos];[estaran];[estado].
verbo--> [encuentro];[encuentras];[encuentra];[encontramos];[encuentran].
verbo--> [gusta];[gustaria];[gustan];[gustarian].
verbo--> [voy];[vas];[va];[vamos];[van].
verbo--> [ire];[iras];[ira];[iremos];[iran].
verbo--> [llego];[lelgas];[llega];[llegamos];[llegan].
verbo--> [llegare];[llegaras];[llegara];[llegaremos];[llegaran].
verbo--> [muevo];[mueves];[mueve];[movemos];[mueven].
verbo--> [movere];[moveras];[movera];[moveremos];[moveran].
verbo--> [necesito];[necesitas];[necesita];[necesitamos];[necesitan].
verbo--> [necesitare];[necesitaras];[necesitara];[necesitaremos];[necesitaran].
verbo--> [ocupo];[ocupas];[ocupa];[ocupamos];[ocupan].
verbo--> [ocupare];[ocuparas];[ocupara];[ocuparemos];[ocuparan].
verbo--> [quiero];[queres];[quiere];[queremos];[quieren].
verbo--> [querra];[querras];[querra];[querremos];[querran].
verbo--> [salgo];[salis];[sale];[salimos];[salen].
verbo--> [saldre];[saldria];[saldra];[saldremos];[saldran].
verbo--> [tengo];[tenes];[tiene];[tenemos];[tienen].
verbo--> [tendre];[tendras];[tendra];[tendremos];[tendran].
verbo--> [vengo];[vienes];[viene];[venimos];[venis];[venimos];[vienen].
verbo--> [vendre];[vendras];[vendran];[vendra];[vendremos].
verbo--> [viajo];[viajas];[viaja];[viajamos];[viajan].
verbo--> [viajare];[viajaras];[viajara];[viajaremos];[viajaran].
verbo--> [vuelvo];[vuelvas];[vuelve];[volvemos];[vuelven].
verbo--> [volvere];[volverias];[volvera];[volveremos];[volveran].


/*Verbos infinitivos*/
infinitivo-->[].
infinitivo-->[dirigir];[desplazar];[estar];[encontrar];[gustar];[ir];[llegar].
infinitivo-->[mover];[necesitar];[ocupar];[querer];[salir].
infinitivo-->[tener];[venir];[viajar];[volver].


/*Pronombres personales*/
pronombre-->[].
pronombre-->[yo];[tu];[vos];[usted];[nosotros];[nosotras];[ellos];[ellas];[ustedes];[el];[ella].
pronombre-->[me];[mi];[te];[ti];[si];[se];[nos].


/*Preposiciones mas usadas*/
preposicion-->[];[a];[al];[ante];[bajo];[con];[contra];[de];[del];[desde];[en];[entre];[hacia];[hasta].
preposicion-->[durante];[mediante];[para];[por];[pro];[sin];[so];[segun];[sobre];[tras];[versus];[via].


/*Articulos*/
articulo-->[].
articulo-->[el];[lo];[los];[un];[unos].
articulo-->[la];[las];[una];[unas].
articulo-->[al];[del].

/*Posibles sustantivos dentro de desplazamientos*/
sustantivos-->[];[destino];[avion];[origen];[aerolinea];[clase];[presupuesto];[lugar];[pais];[ciudad];[dolares];[viaje];[vacaciones];[actividad];[navidad].


/*Adverbios: funcionan para respuetas concretas*/
adverbio-->[];[si];[no];[ninguno];[ninguna];[tambien];[claro].


/*Adjetivos: En caso de varios pasos*/
adjetivo--> [];[primero];[luego].


/*Conjunciones*/
conjuncion-->[];[que].


/*Signos de puntuacion*/
signo-->[];[,].


/*Sintagmas utilizados en una oracion*/
sintagma_nominal-->[].
sintagma_nominal --> pronombre.
sintagma_nominal --> preposicion,signo, articulo, signo.
sintagma_nominal --> preposicion,signo,sustantivos.
sintagma_nominal --> preposicion,signo, articulo,signo, preposicion,signo,{es_informacion(X)},[X],sintagma_nominal.

sintagma_verbal --> adverbio,signo, pronombre ,signo, adjetivo,signo, sustantivos,signo, verbo, signo, conjuncion, signo, preposicion, signo, infinitivo,signo, conjuncion, signo, sintagma_nominal.


/*
      Entrada X = Palabra sin reconocer en la estrucura de sintagmas
      Verifica si esta palabra pertenece a alguna informacion dentro del
      grafo.*/
es_informacion(X):- es_aerolinea(X);es_clase(X);es_lugar(X).
es_lugar(Lugar):- arco(_,_,Lugar,_,_,_,_), arco(_,_,_,Lugar,_,_,_).


/*    Entrada (oracion,[]) = Respuesta del usuario.
      Verifica que todas las palabras dentro de la oracion sean validas.
      Puede ser una oracion completa, o solo un si, no, ninguno etc.*/
oracion --> sintagma_nominal, sintagma_verbal.
oracion --> adverbio.


















