(defrule MAIN::Comenzar-Operacion
   (Paciente (en-quirofano 1))
   (Personal (nombre "enfermera-asistente") (en-quirofano 1))
   (Personal (nombre "anestesiologo") (en-quirofano 1))
   (Personal (nombre "cirujano-jefe") (en-quirofano 1))
   (Personal (nombre "cirujano2") (en-quirofano 1))
   =>
   (assert (Accion (descripcion "Comenzar operación"))))

(defrule MAIN::Informar-Inicio
   (Accion (descripcion "Comenzar operación"))
   =>
   (printout t "Al encontrarse el paciente y el personal en quirófano, la operación puede comenzar." crlf)
   (retract 1)
   (assert (Accion (descripcion "Cirujano 2 informa al Cirujano en Jefe que puede comenzar la intervención"))))

(defrule MAIN::Confirmar-Anestesia
   (Accion (descripcion "Cirujano 2 informa al Cirujano en Jefe que puede comenzar la intervención"))
   =>
   (printout t "El Cirujano 2 informa al Cirujano en Jefe que puede comenzar la intervención." crlf)
   (assert (Accion (descripcion "Cirujano en Jefe ordena al Anestesiólogo confirmar el cálculo del anestésico y aplicarlo al Paciente"))))

(defrule MAIN::Paciente-Sedado
   (Accion (descripcion "Cirujano en Jefe ordena al Anestesiólogo confirmar el cálculo del anestésico y aplicarlo al Paciente"))
   =>
   (printout t "Cirujano en Jefe ordena al Anestesiólogo confirmar el cálculo del anestésico y aplicarlo al Paciente." crlf)
   (printout t "El Anestesiólogo confirma al Cirujano en Jefe que el paciente se encuentra sedado." crlf)
   (assert (Accion (descripcion "Cirujano en Jefe ordena al Cirujano 2 que puede comenzar la intervención"))))

(defrule MAIN::Comenzar-Intervencion
   (Accion (descripcion "Cirujano en Jefe ordena al Cirujano 2 que puede comenzar la intervención"))
   =>
   (printout t "Cirujano en Jefe ordena al Cirujano 2 que puede comenzar la intervención." crlf)
   (printout t "El Cirujano 2 comienza la intervención." crlf)
   (assert (Accion (descripcion "Cirujano 2 solicita material e instrumentos a la Enfermera asistente"))))

(defrule MAIN::Proporcionar-Material
   (Accion (descripcion "Cirujano 2 solicita material e instrumentos a la Enfermera asistente"))
   =>
   (printout t "El Cirujano 2 solicita material e instrumentos a la Enfermera asistente." crlf)
   (assert (Accion (descripcion "Enfermera asistente provee material e instrumentos al Cirujano 2"))))

(defrule MAIN::Realizar-Intervencion
   (Accion (descripcion "Enfermera asistente provee material e instrumentos al Cirujano 2"))
   =>
   (printout t "La Enfermera asistente proporciona el material e instrumentos al Cirujano 2." crlf)
   (assert (Accion (descripcion "Cirujano 2 realiza la intervención"))))

(defrule MAIN::Informar-Fin
   (Accion (descripcion "Cirujano 2 realiza la intervención"))
   =>
   (printout t "El Cirujano 2 realiza la intervención quirúrgica." crlf)
   (assert (Accion (descripcion "Cirujano 2 informa al Cirujano en Jefe sobre la finalización de la intervención"))))

(defrule MAIN::Llevar-a-Sala-de-Recuperacion
   (Accion (descripcion "Cirujano 2 informa al Cirujano en Jefe sobre la finalización de la intervención"))
   =>
   (printout t "El Cirujano 2 informa al Cirujano en Jefe sobre la finalización de la intervención." crlf)
   (assert (Accion (descripcion "Enfermera asistente lleva al paciente a la Sala de recuperación"))))

(defrule MAIN::Finalizar-Operacion
   (Accion (descripcion "Enfermera asistente lleva al paciente a la Sala de recuperación"))
   =>
   (printout t "La enfermera asistente lleva al paciente a la Sala de recuperación." crlf))