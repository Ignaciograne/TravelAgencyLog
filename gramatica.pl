%Análisis de lenguaje estructura
%Signos de puntuacio Definidos
puntuacion-->[,];[].

%Preposiciones
preposiciones-->[].
preposiciones-->[a].
preposiciones-->[ante].
preposiciones-->[de].
preposiciones-->[en].
preposiciones-->[entre].
preposiciones-->[hacia].
preposiciones-->[hasta].
preposiciones-->[mediante].
preposiciones-->[para].
preposiciones-->[por].
preposiciones-->[segun].
preposiciones-->[sin].
preposiciones-->[so].
preposiciones-->[sobre].
preposiciones-->[tras].
preposiciones-->[versus].
preposiciones-->[al].
preposiciones-->[del].
preposiciones-->[desde].

%Articulos
articulo-->[].
articulo-->[el].
articulo-->[la].
articulo-->[las].
articulo-->[lo].
articulo-->[los].
articulo-->[un].
articulo-->[unos].
articulo-->[una].
articulo-->[unas].
articulo-->[al].
articulo-->[del].

%sustantivos
sustantivos-->[destino];[avion];[].
%Verbos
verbo-->[].
verbo-->[viaje];[viajo];[viajamos];[viajaremos].
verbo-->[voy];[vaya];[va];[vamos];[vayan];[vengo];[van].
verbo-->[pase];[paso];[pasare];[pasaria];[pasase].
verbo-->[llego];[llegue];[llegare];[llegan].
verbo-->[dirijo]; [dirigimos]; [dirigiste];[dirigire];[dirigiria];[dirigirme];[dirigirnos].
verbo-->[traslado]; [trasladamos]; [trasladare]; [trasladaremos];[trasladarme];[trasladarnos].
verbo-->[muevo];[movi];[movere];[moveremos];[moverme];[movernos].
verbo-->[acudi];[acudire];[acudo];[acudiremos];[acudiran].
verbo-->[asisto];[asistire];[asitiremos];[asistimos].
verbo-->[recorro];[recorrere];[recorreremos];[recorremos].
verbo-->[quiero];[queremos];[quisiera];[quiere].
verbo-->[estoy];[estamos];[estan],[estaria].
verbo-->[soy];[es];[eres].
verbo-->[encuentro];[encontramos];[encuentra];[encontrarme];[encontrarnos].
verbo-->[necesito];[necesitamos].
verbo-->[ocupo];[ocupamos];[ocuparemos];[ocupare].
verbo-->[gusta];[gustaria];[gustan].
verbo-->[tengo];[tenemos];[tendria];[tendriamos].
verbo-->[ubica];[ubicamos];[ubican];[ubico].
verbo-->[queda];[quedo];[quedan];[quedarme];[quedarnos];[quedaremos].
verbo-->[desplazo];[desplaza];[desplazaremos];[desplazare];[desplazarme];[desplazarnos];[desplazaremos].

%Infinitivos
infinitivo-->[].
infinitivo-->[ir];[viajar];[venir];[pasar];[llegar];[trasladar].
infinitivo-->[mover];[acudir];[asistir];[recorrer];[querer];[estar].
infinitivo-->[encontrar];[necesitar];[dirigir],[gustar];[tener];[ubicar].
infinitivo-->[desplazar].
%clases
clase --> [economica];[negocios].
%Pronombres
pronombres-->[].
pronombres-->[yo].
pronombres-->[nosotros].
pronombres-->[el].
pronombres-->[ella].
pronombres-->[ellas].
pronombres-->[ellos].
pronombres-->[me].
pronombres-->[se].
pronombres-->[nos].
pronombres-->[mi].

%locales de la ciudad
local-->[tienda].
local-->[pulperia].
local-->[supermercado].
local-->[cine].
local-->[farmacia].
local-->[hospital].
local-->[clinica].
local-->[gimnasio].
local-->[parque].
local-->[municipalidad].
local-->[banco].
local-->[plaza].
local-->[mall].
local-->[centro].
local-->[comercial].
local-->[registro].
local-->[carniceria].
local-->[verduleria].
local-->[puerto].
local-->[piscina].
local-->[ferreteria].
local-->[automercado].
local-->[casa].

%Adverbios
adverbio-->[si];[no];[ninguno];[ninguna];[tambien];[finalmente];[claro];[].

%Conjunciones
conjuncion-->[que];[].

%adjetivos
adjetivos-->[ultimo];[primero];[intermedio];[].

%oraciones
oracion --> sintagma_nominal, sintagma_verbal.

oracion--> adverbio.

%definición de sintagma
sintagma_nominal-->[].

sintagma_nominal --> pronombres.

sintagma_nominal --> preposiciones,puntuacion, articulo, puntuacion,local.

sintagma_nominal --> preposiciones, sustantivos.

sintagma_nominal --> preposiciones,puntuacion, articulo,puntuacion, preposiciones, puntuacion,{lugar(X)},[X].

sintagma_verbal --> adverbio, puntuacion, pronombres ,puntuacion, adjetivos, puntuacion, sustantivos, puntuacion, verbo, puntuacion, conjuncion, puntuacion, preposiciones, puntuacion, infinitivo,puntuacion, conjuncion, puntuacion, sintagma_nominal.

lugar(Ubicacion):- arco(Ubicacion,_,_).


arco(mexico,3,4).
arco(guatemala,1,2).
arco(barcelona,1,2).
arco(madrid,5,6).









