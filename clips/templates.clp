; ; Templates
(deftemplate enfermedad
  (slot ID (type NUMBER))
  (slot name (type STRING))
  (slot planta (type STRING))
  (slot sintoma-aa (type STRING))
  (slot sintoma-bb (type STRING))
  (slot sintoma-dd (type STRING))
  (slot sintoma-ee (type STRING))
  (slot sintoma-cc (type STRING))
  (slot stars (type NUMBER))
)

; ; Template para pref de usuario
(deftemplate preference
  (slot planta (type STRING))
  (slot sintoma-aa (type STRING))
  (slot sintoma-bb (type STRING))
  (slot sintoma-dd (type STRING))
  (slot sintoma-ee (type STRING))
  (slot sintoma-cc (type STRING))
)

; ; Template para calificacion
(deftemplate review
  (slot ID (type NUMBER))
  (slot stars (type NUMBER))
  (slot enfermedad-name (type STRING))
  (slot enfermedad-id (type NUMBER))
  (slot reviewer (type STRING))
  (slot comment (type STRING))
)

; ; Template para sugerencia de usuario y afinar las enfermedades
(deftemplate suggestion
  (slot enfermedad-name (type STRING))
  (slot enfermedad-id (type NUMBER))
  (slot attribute (type STRING))
  (slot value (type STRING))
  (slot quantity (type NUMBER))
)
