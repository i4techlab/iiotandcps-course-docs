<!-- multilingual suffix: en, es -->

<!-- Parte 1 -->

<!-- [en] -->
# Acces to influx
asdfasdf

<!-- [es] -->
# Procesado de datos en MATLAB Online 

La herramienta MATLAB Online permite trabajar en la nube con la última versión de MATLAB  disponible. Gracias a una librería específica, que podéis encontrar en enlace que se muestra al  final de este parágrafo, es posible trabajar con bases de datos InfluxDB desde MATLAB Online. 

https://github.com/EnricSala/influxdb-matlab 

A continuación, encontraréis las plantillas del código que necesitaréis utilizar para: 

- Leer los datos de vuestra base de datos de InfluxDB y almacenarlos provisionalmente en  el *workspace* o espacio de trabajo de MATLAB. 

- Realizar un procesado de datos que debe calcular la media de cada uno de los cinco  parámetros recibidos en el último minuto de información registrada y disponible en la  base de datos. 

- Escribir los datos, una vez hayáis llevado a cabo el procesado, de nuevo en vuestra base  de datos de InfluxDB. 

**Se recomienda que generéis un script con cuatro secciones, separándolas utilizando los  caracteres “%%”, como podéis ver en la siguiente captura:** 

![](./img/Aspose.Words.413534b6-4ca3-41d6-9fb4-e8e165328afe.014.png)

**Ello va a permitir ir ejecutando progresivamente cada nueva sección que programéis, siempre  pudiendo ejecutar el código entero si lo deseáis, utilizando los botones *Run* o *Run Section*:** 

![](./img/Aspose.Words.413534b6-4ca3-41d6-9fb4-e8e165328afe.015.png)

Podéis acceder a MATLAB Online haciendo clic en el siguiente enlace las credenciales de vuestra  cuenta de Mathworks. 

http://matlab.mathworks.com 

**Encontraréis toda la información referente a como acceder y/o crear una cuenta Mathworks  en la documentación adicional que se os ha proporcionado.**

## Primera Sección: Conexión con la base de datos 

Para poder acceder a la base de datos con la que queremos trabajar, es necesario definir las  credenciales empleando el siguiente código en un script de MATLAB: 

    % Add the InfluxDB library 
    addpath(genpath('./influxdb-client')); 
    % Init client 
    URL = 'IPdevuestraVM:PuertodeInflux'; 
    USER = ''; 
    PASS = ''; 
    DATABASE = 'NombredevuestraBasedeDatos'; 
    Influxdb = InfluxDB(URL, USER, PASS, DATABASE); 

A continuación, todavía en el mismo script, utilizad el siguiente código para comprobar que os  habéis podido conectar satisfactoriamente con la base de datos: 

    % Test the connection 
    [ok, millis] = influxdb.ping(); 
    assert(ok, 'InfluxDB is DOWN!'); 
    fprintf('InfluxDB is OK (%.2fms)\n\n', millis); 

**Objetivos** 

**1. Completad el código que contiene los parámetros de la máquina virtual y la base de  datos y confirmad que recibís el mensaje ‘InfluxDB is OK’ en la ventana de comandos  de MATLAB Online.** 

##  Segunda sección: Lectura de datos medidos 

Ahora debéis realizar la lectura de datos, solicitando a la base de datos de InfluxDB que os  devuelva el último minuto de información registrada. El siguiente código os servirá de plantilla: 

    % Data reading 
    str = 'SELECT \* FROM NombreDelMeasurement WHERE Configuración’; result\_query = influxdb.runQuery(str); 
    query = result\_query.series('NombreDelMeasurement'); 
    TSP = query.time; 
    data = query.table(); 
    % Assign one variable to each column  
    signal\_1 = [data.**<nombreDeLaColumna1>**]; 
    … 
    signal\_5 = [data.**<nombreDeLaColumna5>**];

**Objetivos** 

**1. Completad los nombres de las columnas para que sea posible recibir los cinco  indicadores estadísticos.** 

En la documentación de InfluxDB se específica que tipo de petición se debe realizar para recibir  los datos de un período concreto de tiempo, como se indica en el siguiente ejemplo: 

![](./img/Aspose.Words.413534b6-4ca3-41d6-9fb4-e8e165328afe.016.png)
En el siguiente enlace podéis encontrar la información completa: 

https://docs.influxdata.com/influxdb/v1.8/query\_language/explore-data/#the-basic-select-statement 

**2. Completad la configuración de la petición (después del *WHERE*) para que solicite los  datos del último minuto de información registrada cada vez que se ejecuta el script.  Verificad que funciona correctamente.** 

## Tercera sección: Procesado de datos 

En una nueva sección deberéis generar un código de realice la media de cada uno de los cinco  parámetros recibidos en el último minuto de información registrada y disponible en la base de  datos.  

**Objetivo** 

**1. Verificad que el código lleva a cabo el procesado de datos.** 

## Cuarta sección: Escritura de datos procesado 

Finalmente, prepararéis los valores obtenidos para poder enviarlos a la base de datos. Estos  serán almacenados a la misma fecha que el último valor obtenido de InfuxDB para realizar el  cálculo. 

**Tened en cuenta que, para escribir datos, primero deberéis estar conectados a la base de  datos. Para hacerlo podéis emplear los dos primeros códigos aportados en el punto 3.1.** 

El siguiente código os permite preparar los resultados. Debéis completarlo con tantas líneas  como resultados vayáis a escribir en la base de datos. 

    % Prepare the data 
    result\_post = Series('Resultados')... 
         fields('**nombreColumnaResultado1**', variableResult1) ... 
         … 
         fields('**nombreColumnaResultado5**', variableResult5); 

Es posible obtener una vista previa del contenido que se escribirá en la base de datos de InfluxDB  usando el siguiente código: 

    % Build preview 
    influxdb.writer() ... 
        .append(result\_post)... 
        .build()

Si el resultado es satisfactorio, es posible escribirlo en la base de datos mediante el siguiente  código 

    % Post 
    influxdb.writer() ... 
        .append(result\_post)... 
        .execute();

**Objetivo** 

**1. Escribid los datos procesados en la base de datos. Opcionalmente podéis verificar si  se han escrito correctamente en una serie llamada ‘Resutados’ accediendo al  contenedor que ejecuta la base de datos de InfluxDB, como se ha explicado en el  documento guía de la primera parte del proyecto. En cualquier caso, lo sabréis en el  próximo punto cuando queráis mostrar los datos procesados en Grafana.** 


# Data analytics en MATLAB Online 

En esta tercera parte del proyecto, deberéis descargar de Atenea dos archivos: 

- La plantilla del script de MATLAB que utilizaréis en esta parte del proyecto. 
- El archivo *workspace* de base que contiene los modelos matemáticos que necesitáis. Una  vez hayáis accedido a MATLAB Online, en otra pestaña utilizad el siguiente enlace para subir  el *workspace* a MATLAB Drive. Una vez lo hayáis hecho os debería aparecer dicho *workspace* en vuestra pestaña de MATLAB Online. Es posible que tengáis que refrescar la pestaña de  MATLAB Online para poder ver el *workspace* que habéis subido. 
https://drive.matlab.com/login 

**Como en la segunda parte del proyecto, se recomienda que respetéis las secciones de la plantilla  que se os proporciona, quedando separadas utilizando los caracteres “%%”. Ello va a permitir ir  ejecutando progresivamente el código para verificar que funciona como se espera.** 

## Primera sección: Conexión con la base de datos 

La primera sección del script sirve para conectarse a la base de datos. Completad los datos de  vuestra base de datos de InfluxDB para que el script de MATLAB sea capaz de conectarse con ella. 

**Objetivo** 

**1. Confirmad que recibís el mensaje ‘InfluxDB is OK’ en la ventana de comandos de MATLAB  Online.** 

## Segunda sección: Lectura de datos 

En esta sección, se lleva a cabo una petición de datos a la base de datos con la que se ha conectado.  

**Objetivo** 

**1. Completad los parámetros de la *query* para leer los datos de los cuatro parámetros  estadísticos (e.g. solicitar los datos registrados en los últimos 5 minutos).** 

## Tercera sección: Detección de datos nuevos (sin procesar) 
Con la finalidad de aligerar lo máximo posible el análisis de datos a nivel de coste computacional, se  ha incluido en esta sección un control de datos repetidos. En este caso el script es capaz de recordar  cual fue el último input de datos que leyó la última vez que se ejecutó, y con esa información verifica  si ese input de datos se encuentra dentro de los nuevos datos leídos. En caso de que así sea, todos  los datos previos se considerarán como ya procesados y se descartarán automáticamente. 

Esta gestión de los datos implica que si hacéis dos peticiones consecutivas (ejecutando la segunda  sección), a la segunda vez que ejecutéis la detección de datos nuevos es posible que todos los datos  se consideren repetidos y se desprecien en su totalidad. Una posible solución sería no ejecutar la  tercera sección si debéis repetir la petición de datos por alguna razón, tenedlo en cuenta.

## Cuarta sección: Transformación de datos 

La matriz “PCA\_matrix” se ha generado utilizando técnicas de análisis de componentes principales.  El objetivo de esta matriz es reducir la dimensionalidad de los datos de vibración, que inicialmente  tienen una dimensión de 4 parámetros, a 2 parámetros (que reciben el nombre de *PC1/Feature 1* y  *PC2/Feature 2*). 

**Objetivo** 

**1. Utilizad la matrix “PCA\_matrix” y programad la operación matricial necesaria.** 

## Quinta sección: Detección de novedad 

En esta sección se emplea un modelo, que podéis encontrar en el *workspace* como “model”, que  después de ser entrenado fuera de línea ha establecido rangos para los dos parámetros que salen  de la transformación del apartado anterior, pudiendo decidir si estos parámetros representan una  situación conocida o no. 

Este paso previo al diagnóstico es fundamental ya que, si el modelo no es capaz de asociar un nuevo  dato a una situación que ya le es conocida, la conclusión que se pueda extraer del proceso de  diagnóstico será totalmente irrelevante. En el script, función *predict* de MATLAB devuelve un valor  numérico y uno booleano, y este último es el que indica si los datos son conocidos o no. 

En este punto veréis como se crea una figura en MATLAB similar a las siguiente, que muestra la  distribución de los datos y colorea en azul los datos clasificados como conocidos, y en rojo como los  desconocidos. 

![](Aspose.Words.cd0f075b-9459-4822-81b8-107b2930d75d.002.png)

En el código veréis que se separan las dos clases de datos con el objetivo de utilizar solo los datos  conocidos en el diagnóstico, pese que al final del script ambos vectores se escribirán en la base de  datos de nuevo para poder visualizarlos en Grafana y no perder la información.

## Sexta sección: Diagnóstico 

En esta sección, se realiza un diagnóstico con los datos clasificados como conocidos. En este punto  veréis como se genera una malla de puntos en rojo y azul. Aquí, estos colores definen el dominio en  el que la red neuronal considera que un dato pertenece a la condición de “Sano” (en el caso del  color azul) o “Fallo cojinete” (en el caso del color rojo). Las entradas de datos se muestran como  puntos verdes en la figura que os aparecerá, que debería ser similar a la siguiente. 

![](Aspose.Words.cd0f075b-9459-4822-81b8-107b2930d75d.003.png)

Adicionalmente, se envía a la red neuronal los datos procesados para obtener su valor de  pertenencia, que indica con que probabilidad afirma la red neuronal que un dato pertenece a la  condición de “Sano” o “Fallo cojinete”. 

## Séptima sección: Escritura de datos de diagnóstico 

En esta sección se genera un nuevo *measurement* donde se escriben los datos procesados y  utilizados para el diagnóstico. 

**Obetivo** 

**1. Completad los datos que faltan para poder escribir los datos resultantes del diagnóstico.** 

## Octava sección: Escritura de datos clasificados como novedad 
En esta sección se genera un nuevo *measurement* donde se escriben los datos procesados y  clasificados como desconocidos. 

**Obetivo** 

**1. Completad los datos que faltan para poder escribir los datos desconocidos.**