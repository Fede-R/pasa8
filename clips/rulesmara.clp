;; Regla principal
(defrule enfermedades-matching
	(declare (salience 1))
	(enfermedad (ID ?ID) (name ?name) (planta ?planta) (sintoma-aa ?sintomaAAA) (sintoma-bb ?sibb)			   
			(sintoma-cc ?sintomacc) (sintoma-ee ?sintomaee) (sintoma-dd ?sintomadd)
			(stars ?stars))
	(preference (planta "?"|?planta)
			(sintoma-aa "?"|?sintomaAAA)
			(sintoma-bb "?"|?sibb)
			(sintoma-cc "?"|?sintomacc)
			(sintoma-ee "?"|?sintomaee)
			(sintoma-dd "?"|?sintomadd))
=>
	(printout t ?ID "," ?planta "," ?sintomaAAA "," ?sibb ","  
		?sintomacc "," ?sintomaee "," ?sintomadd "," ?stars "---")
)

;; Reglas para calcular el rating de las calificaciones de las enfermedades
(defrule enfermedads-rating
	(declare (salience 2))
	?d <- (enfermedad (ID ?id) (stars ?s&:(= ?s -1)))
=>
	(bind ?count 0)
	(bind ?sum 0)
	(do-for-all-facts
		((?r review))
		(= ?r:enfermedad-id ?id)
		(bind ?count (+ ?count 1))
		(bind ?sum (+ ?sum ?r:stars)))
	(if (> ?count 0)
		then
	(modify ?d (stars (/ ?sum ?count)))
		else
	(modify ?d (stars 0)))
)


; ; Reglas para afinar
; ; Afinar "sintoma-bb"
(defrule tuning-sintoma-bb
	(declare (salience 2))
	?d <- (enfermedad (ID ?id) (sintoma-bb ?origin))
	(suggestion (enfermedad-id ?id) (attribute "sintoma-bb") (value ?value&:(neq ?value ?origin)) (quantity ?quantity))
	(not (suggestion (enfermedad-id ?id) (attribute "sintoma-bb") (value ?value2) 
		(quantity ?quantity2&:(or (> ?quantity2 ?quantity)(and (= ?quantity2 ?quantity) (< (str-compare ?value2 ?value) 0))))))
=>
	(modify ?d (sintoma-bb ?value))
)

; ; Afinar "sintoma-aa"
(defrule tuning-sintoma-aa
	(declare (salience 2))
	?d <- (enfermedad (ID ?id) (sintoma-aa ?origin))
	(suggestion (enfermedad-id ?id) (attribute "sintoma-aa") (value ?value&:(neq ?value ?origin)) (quantity ?quantity))
	(not (suggestion (enfermedad-id ?id) (attribute "sintoma-aa") (value ?value2) 
		(quantity ?quantity2&:(or (> ?quantity2 ?quantity)(and (= ?quantity2 ?quantity) (< (str-compare ?value2 ?value) 0))))))

=>
	(modify ?d (sintoma-aa ?value))
)

; ; Afinar "sintoma-cc"
(defrule tuning-sintoma-cc
	(declare (salience 2))
	?d <- (enfermedad (ID ?id) (sintoma-cc ?origin))
	(suggestion (enfermedad-id ?id) (attribute "sintoma-cc") (value ?value&:(neq ?value ?origin)) (quantity ?quantity))
	(not (suggestion (enfermedad-id ?id) (attribute "sintoma-cc") (value ?value2) 
		(quantity ?quantity2&:(or (> ?quantity2 ?quantity)(and (= ?quantity2 ?quantity) (< (str-compare ?value2 ?value) 0))))))
=>
	(modify ?d (sintoma-cc ?value))
)


; ; Afinar "sintoma-dd"
(defrule tuning-sintoma-dd
	(declare (salience 2))
	?d <- (enfermedad (ID ?id) (sintoma-dd ?origin))
	(suggestion (enfermedad-id ?id) (attribute "sintoma-dd") (value ?value&:(neq ?value ?origin)) (quantity ?quantity))
	(not (suggestion (enfermedad-id ?id) (attribute "sintoma-dd") (value ?value2) 
		(quantity ?quantity2&:(or (> ?quantity2 ?quantity)(and (= ?quantity2 ?quantity) (< (str-compare ?value2 ?value) 0))))))
=>
	(modify ?d (sintoma-dd ?value))
)

; ; Afinar "sintoma-ee"
(defrule tuning-sintoma-ee
	(declare (salience 2))
	?d <- (enfermedad (ID ?id) (sintoma-ee ?origin))
	(suggestion (enfermedad-id ?id) (attribute "sintoma-ee") (value ?value&:(neq ?value ?origin)) (quantity ?quantity))
	(not (suggestion (enfermedad-id ?id) (attribute "sintoma-ee") (value ?value2) 
		(quantity ?quantity2&:(or (> ?quantity2 ?quantity)(and (= ?quantity2 ?quantity) (< (str-compare ?value2 ?value) 0))))))
=>
	(modify ?d (sintoma-ee ?value))
)
