; Sat May 04 18:58:24 CEST 2019
;
;+ (version "3.3.1")
;+ (build "Build 430")


(defclass %3ACLIPS_TOP_LEVEL_SLOT_CLASS "Fake class to save top-level slot information"
	(is-a USER)
	(role abstract)
	(single-slot Grasas
;+		(comment "Nombre de grasas")
		(type INTEGER)
		(default 0)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(single-slot Familia
;+		(comment "Indica a la familia general d'aliments a la que pertany.")
		(type SYMBOL)
		(allowed-values Carn Peix Verdura Llegum L%C3%A0ctic Fruita Fruits_secs Ous Cereals)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(multislot Temporada
		(type SYMBOL)
		(allowed-values Hivern Primavera Estiu Tardor)
		(cardinality 1 4)
		(create-accessor read-write))
	(multislot Nutrients
;+		(comment "Aqui contenim les instàncies dels diferents nutrients que conté")
		(type INSTANCE)
;+		(allowed-classes Nutrient)
		(cardinality 1 ?VARIABLE)
		(create-accessor read-write))
	(single-slot Hidrats+de+carboni
;+		(comment "Nombre d'hidrats de carboni")
		(type INTEGER)
		(default 0)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(multislot Apat
;+		(comment "Indica si pot ser un plat per esmorzar, dinar o sopar (o diversos)")
		(type SYMBOL)
		(allowed-values Esmorzar Dinar Sopar)
		(cardinality 1 ?VARIABLE)
		(create-accessor read-write))
	(single-slot Dinar
;+		(comment "Indica si és un plat per a un dinar")
		(type SYMBOL)
		(allowed-values FALSE TRUE)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(single-slot Esmorzar
;+		(comment "Indica si és un plat per a un esmorzar")
		(type SYMBOL)
		(allowed-values FALSE TRUE)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(single-slot Quantitat
;+		(comment "Quantitat que porta d'un ingredient general")
		(type INTEGER)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(multislot Tipus_nutrient
;+		(comment "Indica el tipus de nutrient que estem tractant (dins de tota la familia general de nutrients i micronutrients).\n\nEls greixos mono o poliinsaturats són positius per la alimentació. Els greixos trans no.")
		(type SYMBOL)
		(allowed-values Aigua Minerals Proteines Vitamines Fibra Hidrats_de_carboni Greixos_mono_o_poliinsat Greixos_trans)
		(cardinality 1 ?VARIABLE)
		(create-accessor read-write))
	(single-slot Sopar
;+		(comment "Indica si és un plat per a un sopar")
		(type SYMBOL)
		(allowed-values FALSE TRUE)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(single-slot Nom_ingredient
;+		(comment "Nom del ingredient")
		(type STRING)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot Valor_energetic%28kcal%29
;+		(comment "Nombre de kilocaloríes")
		(type INTEGER)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot Quantitat_nutrient
;+		(comment "Valor en grams de nutrient")
		(type INTEGER)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(multislot Ingredients
;+		(comment "Ingredients principals del plat")
		(type INSTANCE)
;+		(allowed-classes IngredientConcret)
		(cardinality 1 ?VARIABLE)
		(create-accessor read-write))
	(single-slot Nom
;+		(comment "Nom del plat")
		(type STRING)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(single-slot Proteines
;+		(comment "Nombre de proteines")
		(type INTEGER)
		(default 0)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot Cocci%C3%B3
;+		(comment "Manera com cuinem el ingredient")
		(type SYMBOL)
		(allowed-values Planxa Al_forn Fregit Fresc Saltejat Bullit)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot Ingredient_general
;+		(comment "Ingredient general al que fa referència aquest ingredient concret.")
		(type INSTANCE)
;+		(allowed-classes InfoIngredient)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(multislot Tipus_plat
;+		(comment "Indica si el plat és un 1r, 2n, postres o beguda (pot ser varios)")
		(type SYMBOL)
		(allowed-values 1r 2n Postres Beguda)
		(cardinality 1 ?VARIABLE)
		(create-accessor read-write)))

(defclass Plat
	(is-a USER)
	(role concrete)
	(single-slot Nom
;+		(comment "Nom del plat")
		(type STRING)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(multislot Tipus_plat
;+		(comment "Indica si el plat és un 1r, 2n, postres o beguda (pot ser varios)")
		(type SYMBOL)
		(allowed-values 1r 2n Postres Beguda)
		(cardinality 1 ?VARIABLE)
		(create-accessor read-write))
	(multislot Apat
;+		(comment "Indica si pot ser un plat per esmorzar, dinar o sopar (o diversos)")
		(type SYMBOL)
		(allowed-values Esmorzar Dinar Sopar)
		(cardinality 1 ?VARIABLE)
		(create-accessor read-write))
	(multislot Ingredients
;+		(comment "Ingredients principals del plat")
		(type INSTANCE)
;+		(allowed-classes IngredientConcret)
		(cardinality 1 ?VARIABLE)
		(create-accessor read-write)))

(defclass InfoIngredient
	(is-a USER)
	(role concrete)
	(single-slot Familia
;+		(comment "Indica a la familia general d'aliments a la que pertany.")
		(type SYMBOL)
		(allowed-values Carn Peix Verdura Llegum L%C3%A0ctic Fruita Fruits_secs Ous Cereals)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot Nom_ingredient
;+		(comment "Nom del ingredient")
		(type STRING)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot Valor_energetic%28kcal%29
;+		(comment "Nombre de kilocaloríes")
		(type INTEGER)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(multislot Temporada
		(type SYMBOL)
		(allowed-values Hivern Primavera Estiu Tardor)
		(cardinality 1 4)
		(create-accessor read-write))
	(multislot Nutrients
;+		(comment "Aqui contenim les instàncies dels diferents nutrients que conté")
		(type INSTANCE)
;+		(allowed-classes Nutrient)
		(cardinality 1 ?VARIABLE)
		(create-accessor read-write)))

(defclass IngredientConcret
	(is-a USER)
	(role concrete)
	(single-slot Quantitat
;+		(comment "Quantitat que porta d'un ingredient general")
		(type INTEGER)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(single-slot Cocci%C3%B3
;+		(comment "Manera com cuinem el ingredient")
		(type SYMBOL)
		(allowed-values Planxa Al_forn Fregit Fresc Saltejat Bullit)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot Ingredient_general
;+		(comment "Ingredient general al que fa referència aquest ingredient concret.")
		(type INSTANCE)
;+		(allowed-classes InfoIngredient)
;+		(cardinality 1 1)
		(create-accessor read-write)))

(defclass Nutrient
	(is-a USER)
	(role concrete)
	(single-slot Quantitat_nutrient
;+		(comment "Valor en grams de nutrient")
		(type INTEGER)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(multislot Tipus_nutrient
;+		(comment "Indica el tipus de nutrient que estem tractant (dins de tota la familia general de nutrients i micronutrients).\n\nEls greixos mono o poliinsaturats són positius per la alimentació. Els greixos trans no.")
		(type SYMBOL)
		(allowed-values Aigua Minerals Proteines Vitamines Fibra Hidrats_de_carboni Greixos_mono_o_poliinsat Greixos_trans)
		(cardinality 1 ?VARIABLE)
		(create-accessor read-write)))


;;;------------------------------------------------------------------------------------------------------------------------------------------------------
;;;----------  					INSTANCIAS					 		---------- 								INSTANCIAS
;;;------------------------------------------------------------------------------------------------------------------------------------------------------



;;;------------------------------------------------------------------------------------------------------------------------------------------------------
;;;----------  					TEMPLATES					 		---------- 								TEMPLATES
;;;------------------------------------------------------------------------------------------------------------------------------------------------------

;;; deftemplat para almacenar la informacion que se infiere del expediente



;INFORMACION PARA LA SOLUCION FINAL
;;; deftemplat para almacenar la informacion de la solucion final ordenada
;;; distinguimos entre tipos de platos. Los ordenamos y luego los iremos mezclando en orden

(deftemplate solucionOrdenadaPrimers "solucion final primeros platos"
	(slot posicion (type INTEGER))
	(slot recomendacion (type INSTANCE) (allowed-values Plat))
)


(deftemplate solucionOrdenadaSegons "solucion final segundos platos"
	(slot posicion (type INTEGER))
	(slot recomendacion (type INSTANCE) (allowed-values Plat))
)

(deftemplate solucionOrdenadaPostres "solucion final postres"
	(slot posicion (type INTEGER))
	(slot recomendacion (type INSTANCE) (allowed-values Plat))
)

(deftemplate solucionOrdenadaBegudes "solucion final bebida"
	(slot posicion (type INTEGER))
	(slot recomendacion (type INSTANCE) (allowed-values Plat))
)


(deftemplate solucionOrdenadaBegudes "solucion final bebida"
	(slot posicion (type INTEGER))
	(slot recomendacion (type INSTANCE) (allowed-values Plat))
)



;;;------------------------------------------------------------------------------------------------------------------------------------------------------
;;;----------  					FUNCIONES					 		---------- 								EXTRAS
;;;-------------------------------------------------------------------------------------------------------------------------------------------------------

;;; Funcion para hacer una pregunta general
(deffunction pregunta-general (?pregunta)
	(format t "%s" ?pregunta)
	(bind ?respuesta (read))
	?respuesta
)

;;; Funcion para hacer una pregunta con respuesta en un rango dado
(deffunction pregunta-numerica (?pregunta ?rangini ?rangfi)
	(format t "%s [%d, %d] " ?pregunta ?rangini ?rangfi)
	(bind ?respuesta (read))
	(while (not(and(>= ?respuesta ?rangini)(<= ?respuesta ?rangfi))) do
		(format t "�%s? [%d, %d] " ?pregunta ?rangini ?rangfi)
		(bind ?respuesta (read))
	)
	?respuesta
)

;;; Funcion para hacer una pregunta con un conjunto definido de valores de repuesta
(deffunction pregunta-lista (?pregunta $?valores_posibles)
	(format t "%s" ?pregunta)
	(bind ?resposta (readline))
	(bind ?res (str-explode ?resposta))
	?res
)

;;;------------------------------------------------------------------------------------------------------------------------------------------------------
;;;----------  					MENSAJES					 		---------- 								MENSAJES
;;;------------------------------------------------------------------------------------------------------------------------------------------------------

;;; Mensajes a las clases
;;; Aqui aun podem completar mas para que imprima mas información. Dependerá de como se muestre por pantalla


(defmessage-handler Plat imprimeixNom primary ()
	(printout t " Plat:  " ?self:Nom crlf)
)

(defmessage-handler Ingredient imprimeixNom primary()
	(printout t ?self:Nom_ingredient crlf)
)

;;;------------------------------------------------------------------------------------------------------------------------------------------------------
;;;----------  					 MAIN					 		---------- 								MAIN
;;;------------------------------------------------------------------------------------------------------------------------------------------------------

;; Este es el modulo principal, en este se comprobara l existencia del estudiante
;; en el conjunto de instancias del sistema

(defmodule MAIN (export ?ALL))

(defrule comienzo "regla inicial"
	(initial-fact)
	=>
	(printout t crlf)
	(printout t "--------------------------------------------------------------" crlf)
	(printout t "------ Sistema de Recomendacion de un Menú semanal -----" crlf)
	(printout t "--------------------------------------------------------------" crlf)
	(printout t crlf)
	(assert (nou_usuari))	;;aixo ens permet crear un fact
	(focus (hacer_preguntas))
)


;;;------------------------------------------------------------------------------------------------------------------------------------------------------
;;;----------  				MODULO DE PREGUNTAS				 		---------- 							MODULO DE PREGUNTAS
;;;------------------------------------------------------------------------------------------------------------------------------------------------------

;; En este se le haran las preguntas al estudiantes
;; para obtener la informacion de sus restricciones y/o preferencias

(defmodule hacer_preguntas
    (import MAIN ?ALL)
    (export ?ALL)
)

(defrule preguntar_sexe "regla para saber el sexo del usuario"
	(nou_usuari)
	=>
	(bind ?q (pregunta-general "Indica tu genero [M F Indef]:  "))
	(switch ?q
		(case M then (assert(Genere M)))
		(case F then (assert(Genere F)))
		(case Indef then (assert(Genere Indef)))
	)
)

(defrule preguntar_edat "regla para saber la franja de edad en que se encuantra"
	(nou_usuari)
	=>
	(bind ?q (pregunta-general "Indica la franja d'edat a la que es troba  [65-75(1) 75-90(2) >90(3)]:  "))
	(switch ?q
		(case 1 then (assert(Edat 1)))
		(case 2 then (assert(Edat 2)))
		(case 3 then (assert(Edat 3)))
	)
)

(defrule preguntar_activitat_fisica "regla para saber la cantidad de actividad física que realiza el usuario"
	(nou_usuari)
	=>
	(bind ?q (pregunta-general "Indica la cantidad de ejercicio que realiza [poco(P) regularmente(R) mucho(M)]:  "))
	(switch ?q
		(case P then (assert(Actividad P)))
		(case R then (assert(Actividad R)))
		(case M then (assert(Actividad M)))
	)
)

(defrule preguntar_temporada "regla para saber la temporada del año en que nos encontramos"
	(nou_usuari)
	=>
	(bind ?q (pregunta-general "Indica la estació actual de l'any [Hivern(1) Primavera(2) Estiu(3) Tardor(4)]:  "))
	(switch ?q
		(case 1 then (assert(Hivern)))
		(case 2 then (assert(Primavera)))
		(case 3 then (assert(Estiu)))
		(case 4 then (assert(Tardor)))
	)
)


;DEFINIM LES RESTRICCIONS
(defrule preguntar_alergies_restriccions "regla para saber si tiene algun tipo de alergia o restricción"
	(nou_usuari)
	=>
		(bind ?q (pregunta-general "Tens alguna restricció o alèrgia alimentària [Si(S) No(N)]:  "))
		(switch ?q
			(case S then (assert(Restriccio S)))
			(case N then (assert(Restriccio N)))
		)
)

(defrule definir_alergies_restriccions"regla para saber si tiene algun tipo de alergia o restricción"
	(nou_usuari)
	(Restriccio S)
	=>
	;;AQUI CALDRIA AMPLIAR-HO MÉS A PODER SER
	(printout t "Restriccions o alèrgies: " crlf)
	(printout t "1. Carn " crlf)
	(printout t "2. Peix " crlf)
	(printout t "3. Fruita" crlf)
	(printout t "4. Gluten" crlf)
	(bind ?rest (pregunta-lista "Escriu l'identificador dels aliments als què ets alèrgic o no pots consumir. Usa un espai entre cadascún: "))

	(progn$ (?it ?rest)	;Per a cadascun dels elements seleccionats
		(switch ?it
			(case 1 then   (assert(Carn)))
			(case 2 then   (assert(Peix)))
			(case 3 then   (assert(Fruita)))
			(case 4 then   (assert(Gluten)))
		)
	)
  (assert(RestriccionsAfegides))
)

;DEFINIM LES PREFERÈNCIES
(defrule preguntar_preferencies"regla para saber si tiene algun tipo de alergia o restricción"
	(nou_usuari)
	=>
		(bind ?q (pregunta-general "Tens alguna preferència alimentària [Si(S) No(N)]:  "))
		(switch ?q
			(case S then (assert(Preferencies S)))
			(case N then (assert(Preferencies N)))
		)
)

(defrule definir_preferencies "regla para saber si tiene algun tipo de alergia o restricción"
	(nou_usuari)
	(Preferencies S)
	=>
	;;AQUI CALDRIA AMPLIAR-HO MÉS A PODER SER
	(printout t "Preferències alimentàries (aliments a preferiblement no consumir): " crlf)
	(printout t "1. Carn " crlf)
	(printout t "2. Peix " crlf)
	(printout t "3. Fruita" crlf)
	(printout t "4. Fruits secs" crlf)
	(printout t "5. Làctics" crlf)
	(bind ?pref (pregunta-lista "Escriu l'identificador dels aliments que preferiries no pots consumir. Usa un espai entre cadascún: "))

	(progn$ (?it ?pref)	;Per a cadascun dels elements seleccionats
		(switch ?it
			(case 1 then   (assert(Carn)))
			(case 2 then   (assert(Peix)))
			(case 3 then   (assert(Fruita)))
			(case 4 then   (assert(Fruits secs)))
			(case 4 then   (assert(Làctics)))
		)
	)
  (assert(PreferenciesAfegides))
)


;PREGUNTEM SI TÉ ALGUNA DE LES SEGUENTS MALALTIES
(defrule definir_malalties "regla para saber si tiene alguna de las siguientes enfermedades"
	(nou_usuari)
	=>
	;;AQUI CALDRIA AMPLIAR-HO MÉS A PODER SER
	(printout t "Indica si pateixes alguna de les seguents malalties: " crlf)
	(printout t "1. Osteoporosis " crlf)
	(printout t "2. Problemes articulars " crlf)
	(printout t "3. Diabetis" crlf)
	(printout t "4. Hipertensió" crlf)
	(bind ?malalties (pregunta-lista "Escriu l'identificador de les malalties que tens. Usa un espai entre cadascún: "))

	(progn$ (?it ?malalties)	;Per a cadascun dels elements seleccionats
		(switch ?it
			(case 1 then   (assert(Osteoporosis)))
			(case 2 then   (assert(Problemes articulars)))
			(case 3 then   (assert(Diabetis)))
			(case 4 then   (assert(Hipertensió)))
		)
	)
  (assert(MalaltiesAfegides))
  (focus(inferir_datos))
)

;;;------------------------------------------------------------------------------------------------------------------------------------------------------
;;;----------  					MODULO DE INFERENCIAS DE DATOS				---------- 				MODULO DE INFERENCIAS DE DATOS
;;;------------------------------------------------------------------------------------------------------------------------------------------------------

;; En este modulo se hace la abstraccion de los datos obtenidos del modulo de pregunatas

(defmodule inferir_datos
    (import MAIN ?ALL)
    (import hacer_preguntas ?ALL)
    (export ?ALL)
)


(defrule doesntDoAnything "Here we would add the different rules"
  =>
  (focus(filtrat))
)



;;;------------------------------------------------------------------------------------------------------------------------------------------------------
;;;----------  					MODULO DE FILTRADO				---------- 				MODULO DE FILTRADO
;;;------------------------------------------------------------------------------------------------------------------------------------------------------

;; En este modulo se hace la abstraccion de los datos obtenidos del modulo de pregunatas

(defmodule filtrat
	(import MAIN ?ALL)
	(import inferir_datos ?ALL)
	(export ?ALL)
)

;DESCARTEM ELS PLATS QUE CONTENEN ALGUNA FAMILIA D'ELIMENTS PROHIBITS
(defrule descartarAmbCarn "regla para descartar los platos que contengan carne"
  (Carn)
  (RestriccionsAfegides)
	?plat  <- (object (is-a Plat) (Ingredients $?ing))  ;seleccionem els diferents ingredients del plat
  ?ingredientGeneral <- (object (is-a InfoIngredient) (Familia Carn))  ;seleccionem els ingredients que son carn
  ?ingredient <- (object (is-a IngredientConcret) (Ingredient_general ?i))  ;seleccionem el ingredient general d'aquest ingredient concret
  (test (and (eq ?ingredientGeneral ?i)) member(?ingredient ?ing))  ;comprovem que el plat contingui aquell ingredient
  ; hem seleccionat les plats que contenen algun ingredient amb carn
	=>
	(assert (Eliminem plat ?plat))
	(printout t " Plat eliminat per contenir carn " (instance-name ?plat) crlf)
	(send ?plat delete)
)

(defrule descartarAmbPeix "regla para descartar los platos que contengan pescado"
  (Peix)
  (RestriccionsAfegides)
	?plat  <- (object (is-a Plat) (Ingredients $?ing))  ;seleccionem els diferents ingredients del plat
  ?ingredientGeneral <- (object (is-a InfoIngredient) (Familia Peix))  ;seleccionem els ingredients que son carn
  ?ingredient <- (object (is-a IngredientConcret) (Ingredient_general ?i))  ;seleccionem el ingredient general d'aquest ingredient concret
  (test (and (eq ?ingredientGeneral ?i)) member(?ingredient ?ing))  ;comprovem que el plat contingui aquell ingredient
  ; hem seleccionat les plats que contenen algun ingredient amb carn
	=>
	(assert (Eliminem plat ?plat))
	(printout t " Plat eliminat per contenir peix " (instance-name ?plat) crlf)
	(send ?plat delete)
)

(defrule descartarAmbFruita "regla para descartar los platos que contengan fruta"
  (Fruita)
  (RestriccionsAfegides)
	?plat  <- (object (is-a Plat) (Ingredients $?ing))  ;seleccionem els diferents ingredients del plat
  ?ingredientGeneral <- (object (is-a InfoIngredient) (Familia Fruita))  ;seleccionem els ingredients que son carn
  ?ingredient <- (object (is-a IngredientConcret) (Ingredient_general ?i))  ;seleccionem el ingredient general d'aquest ingredient concret
  (test (and (eq ?ingredientGeneral ?i)) member(?ingredient ?ing))  ;comprovem que el plat contingui aquell ingredient
  ; hem seleccionat les plats que contenen algun ingredient amb carn
	=>
	(assert (Eliminem plat ?plat))
	(printout t " Plat eliminat per contenir carn " (instance-name ?plat) crlf)
	(send ?plat delete)
)









;;;------------------------------------------------------------------------------------------------------------------------------------------------------
;;;----------  				MODULO DE MENÚS		---------- 				MODULO DE MENÚS
;;;------------------------------------------------------------------------------------------------------------------------------------------------------

;; Aqui montamos nustro menu final

(defmodule menus
	(import MAIN ?ALL)
	(import inferir_datos ?ALL)
	(import filtrat ?ALL)
	(export ?ALL)
)


(defrule obtenirPlats "regla per a obtenir els diferents plats que encara són possibles"
	(nou_usuari)
	=>
	(bind ?pos 1)
	(bind $?plats (find-all-instances ((?inst Plat)) TRUE))
	(printout t crlf)
	(printout t "Tots els possibles plats: " crlf)
	(printout t "----------------------------------- " crlf)

	(progn$ (?i ?plats)
    (send ?i imprimeixNom)
	)
)
