https://a-better-api.herokuapp.com/api/v1/inforequests
  - Todas las solicitudes de informacion de FUNDE ALAC.
    - Parametros:
      - per_page: Por defecto 5
      - page: Numero de pagina

https://a-better-api.herokuapp.com/api/v1/inforequests/
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

https://a-better-api.herokuapp.com/api/v1/infoinfocomplains
  - Todas las solicitudes de informacion de FUNDE ALAC.
    - Parametros:
      - per_page: Por defecto 5
      - page: Numero de pagina

https://a-better-api.herokuapp.com/api/v1/infoinfocomplains/
- Muestra solicitud que corresponde a id
  - Parametros:
    - ninguno

https://a-better-api.herokuapp.com/api/v1/infoinfocomplains/search
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
