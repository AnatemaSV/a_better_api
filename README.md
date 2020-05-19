Hemos colocado una version de prueba en:

https://a-better-api.herokuapp.com

Utilizamos tareas rake para popular la base de datos:

Elimina todos los registros
rake db:truncate

Copia todos los registros de https://alac.funde.org/api/v1/requests
rake get_funde_requests

Genera estructura de base de datos necesaria, a partir de la informacion descargada, para el modelo inforequests
rake fix_inforequest_models 

Copia todos los registros de https://alac.funde.org/api/v1/complains
rake get_funde_complains

Genera estructura de base de datos necesaria, a partir de la informacion descargada, para el modelo infocomplains
rake fix_infocomplain_models 

https://a-better-api.herokuapp.com/api/v1/inforequests
  - Todas las solicitudes de informacion de FUNDE ALAC.
    - Parametros:
      - per_page: Por defecto 5
      - page: Numero de pagina

https://a-better-api.herokuapp.com/api/v1/inforequests/1
- Muestra solicitud que corresponde a id
  - Parametros:
    - ninguno

https://a-better-api.herokuapp.com/api/v1/inforequests/search
  - Busqueda en las solicitudes
    - Parametros:
      - per_page: Por defecto 5
      - page: Numero de pagina
      - query: Terminos de busqueda
      - date-begin: Fecha a partir de la cual iniciar la busqueda.
      - date-end: Fecha hasta la cual finalizar la busqueda.
      - status:
          - 0 = Cerrada
          - 1 = En tramite
      - result:
        - El catalogo de results se encuentra en: https://a-better-api.herokuapp.com/catalogs/inforequest_results
    - institution:
      - El catalogo de instituciones se encuentra en: https://a-better-api.herokuapp.com/api/v1/catalogs/institutions

https://a-better-api.herokuapp.com/api/v1/infocomplains
  - Todas las solicitudes de informacion de FUNDE ALAC.
    - Parametros:
      - per_page: Por defecto 5
      - page: Numero de pagina

https://a-better-api.herokuapp.com/api/v1/infocomplains/1
- Muestra solicitud que corresponde a id
  - Parametros:
    - ninguno

https://a-better-api.herokuapp.com/api/v1/infocomplains/search
  - Busqueda en las solicitudes
    - Parametros:
      - per_page: Por defecto 5
      - page: Numero de pagina
      - query: Terminos de busqueda
      - date-begin: Fecha a partir de la cual iniciar la busqueda.
      - date-end: Fecha hasta la cual finalizar la busqueda.
      - status:
          - 0 = Cerrada
          - 1 = En tramite
      - result:
        - El catalogo de results se encuentra en: https://a-better-api.herokuapp.com/catalogs/infocomplain_results
    - institution:
      - El catalogo de instituciones se encuentra en: https://a-better-api.herokuapp.com/api/v1/catalogs/institutions

https://a-better-api.herokuapp.com/api/v1/institutions
  - Todas las instituciones que tienen solicitudse en FUNDE ALAC.
    - Parametros:
      - per_page: Por defecto 5
      - page: Numero de pagina
