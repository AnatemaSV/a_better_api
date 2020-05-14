
/api/v1/inforequests

Todas las solicitudes de informacion de FUNDE ALAC.

Parametros:
  - per_page: Por defecto 5
  - page: Numero de pagina

/api/v1/inforequests/:id

Muestra solicitud que corresponde a id

Parametros:
  - ninguno

/api/v1/inforequests/search

Busqueda en las solicitudes

Parametros:
  - per_page: Por defecto 5
  - page: Numero de pagina
  - query: Terminos de busqueda
  - date-begin: Fecha a partir de la cual iniciar la busqueda.
  - date-end: Fecha hasta la cual finalizar la busqueda.
  - status:
      - 0 = Cerrada
      - 1 = En tramite
  - result:
      - 0 = Confidencial
      - 1 = Diferente información
      - 2 = Inexistente
      - 3 = No definido
      - 4 = Oficina no competente
      - 5 = Reservada
      - 6 = Respuesta completa
      - 7 = Respuesta parcial
      - 8 = Sin respuesta
      - 9 = Solicitud improcedente
