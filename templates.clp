(deftemplate MAIN::Paciente
   (slot nombre (type STRING))
   (slot en-quirofano (type INTEGER)))

(deftemplate MAIN::Personal
   (slot nombre (type STRING))
   (slot en-quirofano (type INTEGER)))

(deftemplate MAIN::Accion
   (slot descripcion (type STRING)))