
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
<<<<<<< HEAD
      0 = Confidencial
      1 = Diferente información
      2 = Inexistente
      3 = No definido
      4 = Oficina no competente
      5 = Reservada
      6 = Respuesta completa
      7 = Respuesta parcial
      8 = Sin respuesta
      9 = Solicitud improcedente
  - institution:
    - 1 = Academia Nacional de Seguridad Pública
    - 2 = Administración Nacional de Acueductos y Alcantarillados
    - 3 = Alcadía de Zacatecoluca
    - 4 = Alcaldia Municipal Santo Domingo de Guzman
    - 5 = Alcaldia Municipal de Ahuachapan
    - 6 = Alcaldia Municipal de Chalchuapa
    - 7 = Alcaldia Municipal de Santa Ana
    - 8 = Alcaldia Municipal de Santa Catarina, Masahuat
    - 9 = Alcaldia Municipal de Texistepeque
    - 10 = Alcaldia San Antonio del Monte
    - 11 = Alcaldía Municipal de Ahuachapán
    - 12 = Alcaldía Municipal de Chiltiupán
    - 13 = Alcaldía Municipal de Juayúa
    - 14 = Alcaldía Municipal de Mejicanos
    - 15 = Alcaldía Municipal de Panchimalco
    - 16 = Alcaldía Municipal de San Marcos
    - 17 = Alcaldía Municipal de San Miguel
    - 18 = Alcaldía Puerto El Triunfo
    - 19 = Alcaldía Puerto de la Libertad
    - 20 = Alcaldía de Antiguo Cuscatlán
    - 21 = Alcaldía de Apopa
    - 22 = Alcaldía de Apopa
    - 23 = Alcaldía de Ciudad Delgado
    - 24 = Alcaldía de Ilopango
    - 25 = Alcaldía de Nejapa
    - 26 = Alcaldía de Nueva Concepción - Chalatenango
    - 27 = Alcaldía de Quezaltepeque
    - 28 = Alcaldía de San Martín
    - 29 = Alcaldía de San Salvador
    - 30 = Alcaldía de San Vicente
    - 31 = Alcaldía de Santa Tecla
    - 32 = Alcaldía de Santo Tomás
    - 33 = Alcaldía de Soyapango
    - 34 = Alianza Republicana Nacionalista
    - 35 = Asamblea Legislativa
    - 36 = Autoridad Maritima Portuaria
    - 37 = Autoridad de Aviación Civil de El Salvador
    - 38 = Banco Central de Reserva
    - 39 = Banco Interamericano para el Desarrollo
    - 40 = Banco de Desarrollo de El Salvador
    - 41 = Banco de Fomento Agropecuario
    - 42 = Caja Mutual de los Empleados del Ministerio de Educación
    - 43 = Cambio Democrático
    - 44 = Centro Farmacéutico de la Fuerza Armada
    - 45 = Centro Internacional de Ferias y Convenciones
    - 46 = Centro Nacional de Registros
    - 47 = Centro Nacional de Tecnología Agrícola y Forestal, Enrique Álvarez Córdova
    - 48 = Comisión Ejecutiva Hidroeléctrica del Río Lempa
    - 49 = Comisión Ejecutiva Portuaria Autonóma
    - 50 = Comisión Nacional de la Micro y Pequeña Empresa
    - 51 = Consejo Nacional de Atención Integral a la Persona con Discapacidad
    - 52 = Consejo Nacional de Calidad
    - 53 = Consejo Nacional de Ciencia y Tecnología
    - 54 = Consejo Nacional de Energía
    - 55 = Consejo Nacional de la Judicatura
    - 56 = Consejo Nacional de la Niñez y Adolescencia
    - 57 = Consejo Salvadoreño de la Agroindustria Azucarera
    - 58 = Consejo Salvadoreño del Café
    - 59 = Consejo Superior de Salud Pública
    - 60 = Consejo de Vigilancia de la Profesión de Contaduría Pública y Auditoría
    - 61 = Corporación Salvadoreña de Turismo
    - 62 = Corte Suprema de Justicia
    - 63 = Corte de Cuentas de la República
    - 64 = Defensoría del Consumidor
    - 65 = Dirección General de Centros Penales
    - 66 = Dirección General de Impuestos Internos
    - 67 = Dirección General de Migración y Extranjería
    - 68 = Dirección Nacional de Medicamentos
    - 69 = Escuela Nacional de Agricultura
    - 70 = Fiscalía General de la República
    - 71 = Fondo Ambiental de El Salvador
    - 72 = Fondo Especial de los Recursos Provenientes de la Privatización de la Administración Nacional de Telecomunicaciones
    - 73 = Fondo Nacional de Vivienda Popular
    - 74 = Fondo Salvadoreño para Estudios de Preinversión
    - 75 = Fondo Social para la Vivienda
    - 76 = Fondo Solidario para la Familia Microempresaria
    - 77 = Fondo Solidario para la Salud
    - 78 = Fondo de Conservación Víal
    - 79 = Fondo de Inversión Ambiental de El Salvador
    - 80 = Fondo de Inversión Social para el Desarrollo Local
    - 81 = Fondo de Proteccion de Lisiados y Discapacitados a Consecuencia del Conflicto Armado
    - 82 = Fondo de Saneamiento y Fortalecimiento Financiero
    - 83 = Frente Farabundo Martí para la Liberación Nacional.
    - 84 = Gran Alianza Por La Unidad Nacional
    - 85 = Inspectoría General de Seguridad Pública
    - 86 = Instituto Especializado de Educación Superior para la Formación Diplomática
    - 87 = Instituto Nacional de Pensiones de los Empleados Públicos
    - 88 = Instituto Nacional de la Juventud
    - 89 = Instituto Nacional de los Deportes
    - 90 = Instituto Salvadoreño Para el Desarrollo Integral de la Niñez y la Adolescencia
    - 91 = Instituto Salvadoreño de Bienestar Magisterial
    - 92 = Instituto Salvadoreño de Desarrollo Municipal
    - 93 = Instituto Salvadoreño de Fomento Cooperativo
    - 94 = Instituto Salvadoreño de Formación Profesional
    - 95 = Instituto Salvadoreño de Rehabilitación Especial
    - 96 = Instituto Salvadoreño de Transformación Agraria
    - 97 = Instituto Salvadoreño de Turismo
    - 98 = Instituto Salvadoreño del Seguro Social
    - 99 = Instituto Salvadoreño para el Desarrollo de la Mujer
    - 100 = Instituto de Acceso a la Información Pública
    - 101 = Instituto de Garantía de Depósitos
    - 102 = Instituto de Legalización de la Propiedad
    - 103 = Instituto de Previsión Social de la Fuerza Armada
    - 104 = Lotería Nacional de Beneficencia
    - 105 = Ministerio de Agricultura y Ganadería
    - 106 = Ministerio de Cultura
    - 107 = Ministerio de Economía
    - 108 = Ministerio de Educación
    - 109 = Ministerio de Gobernación
    - 110 = Ministerio de Hacienda
    - 111 = Ministerio de Justicia y Seguridad Pública
    - 112 = Ministerio de Medio Ambiente y Recursos Naturales
    - 113 = Ministerio de Obras Públicas
    - 114 = Ministerio de Relaciones Exteriores
    - 115 = Ministerio de Salud
    - 116 = Ministerio de Trabajo y Previsión Social
    - 117 = Ministerio de Turismo
    - 118 = Ministerio de la Defensa Nacional
    - 119 = Organismo Promotor de Exportaciones e Inversiones de El Salvador
    - 120 = Partido Demócrata Cristiano
    - 121 = Partido de Concertación Nacional
    - 122 = Policía Nacional Civil
    - 123 = Presidencia de la República
    - 124 = Procuraduría General de la República
    - 125 = Procuraduría para la Defensa de los Derechos Humanos
    - 126 = Registro Nacional de las Personas Naturales
    - 127 = Superintendencia General de Electricidad y Telecomunicaciones
    - 128 = Superintendencia de Competencia
    - 129 = Superintendencia del Sistema Financiero
    - 130 = Tribunal Supremo Electoral
    - 131 = Tribunal de Ética Gubernamental
    - 132 = Tribunal del Servicio Civil
    - 133 = Unidad Técnica Ejecutiva del Sector Justicia
    - 134 = Unidad de Transparencia, México
    - 135 = Universidad de El Salvador
    - 136 = Viceministerio de Transporte
=======
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
>>>>>>> 4c14fad824ca9d41d57bb4b4393a19827148a345
