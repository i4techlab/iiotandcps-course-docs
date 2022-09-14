<!-- multilingual suffix: en, es -->

<!-- [en] -->
# Acces to influx
asdfasdf

<!-- [es] -->

# Visualización de datos en Grafana

Con los contenedores levantados, podréis acceder mediante vuestro navegador al contenedor que contiene Grafana utilizando la siguiente URL:

[*http://”IPpublicaDeVuestraVM”:3000*]()

Para iniciar sesión utilizaréis las siguientes credenciales que se indican en el archivo “docker-compose.yml”, que son las siguientes:

**User: admin**

**Password: supersecretpassword**

Ahora deberéis configurar la base de datos que de la que queréis que Grafana haga la lectura de datos. Para ello, deberéis acceder al menú de configuración y acceder al apartado de *Data Sources*.
<!-- [common] -->
![](../img/Aspose.Words.b1061091-e8de-4e39-91fb-4ba4b8e356ff.049.png)
<!-- [es] -->
Haced clic en *Add Data Source* y seleccionad como tipo de base de datos *InfluxDB*.
<!-- [common] -->
![](../img/Aspose.Words.b1061091-e8de-4e39-91fb-4ba4b8e356ff.050.png)
<!-- [es] -->
Deberéis dar un nombre a esta Fuente de datos (no tiene porque ser el mismo que el de la base de datos de InfluxDB) e indicar la dirección URL del container de InfluxDB.
<!-- [common] -->
![](../img/Aspose.Words.b1061091-e8de-4e39-91fb-4ba4b8e356ff.051.png)
<!-- [es] -->
En el campo *Database* deberéis introducir el nombre de vuestra base de datos. Aseguraos que los campos *HTTP Method* y *Min time Interval* quedan como en la captura.
<!-- [common] -->
![](../img/Aspose.Words.b1061091-e8de-4e39-91fb-4ba4b8e356ff.052.png)
<!-- [es] -->
Podéis validar que Grafana ha detectado la base de datos haciendo clic en el botón *Save & Test*. Un resultado satisfactorio debería devolver el siguiente mensaje:
<!-- [common] -->
![](../img/Aspose.Words.b1061091-e8de-4e39-91fb-4ba4b8e356ff.053.png)
<!-- [es] -->


Para visualizar los datos escritos en la base de datos de InfluxDB, deberéis crear un *Dashboard* de Grafana:
<!-- [common] -->
![](../img/Aspose.Words.b1061091-e8de-4e39-91fb-4ba4b8e356ff.054.png)
<!-- [es] -->
Haced clic en *Add new panel* y se os abrirá un panel que se va a ir actualizando con la información que añadáis en la pestaña *Query*. Ahora deberéis modificar los campos destacados en la captura con el nombre de la serie de medidas de InfluxDB donde habéis escrito los datos y la variable que contiene los valores numéricos de las medidas.
<!-- [common] -->
![](../img/Aspose.Words.b1061091-e8de-4e39-91fb-4ba4b8e356ff.055.png)
<!-- [es] -->
Una vez lo hayáis hecho, en el panel gráfico de la parte superior podréis visualizar los datos sintéticos que habéis generado en Node-RED. Podéis seleccionar un período de tiempo sobre el que hacer *zoom* para ver mejor los datos. **Con esto habréis cumplido el objetivo fijado para esta primera parte del proyecto, ¡buen trabajo!**

Haced clic en *Apply* en la esquina superior derecha de la pantalla para guardar los cambios en el panel que habéis generado. Una vez hecho, en la parte superior del *dashboard* tenéis también una opción para guardar los cambios en el *dashboard*.
![](../img/Aspose.Words.b1061091-e8de-4e39-91fb-4ba4b8e356ff.056.png)

**Debéis aportar una captura del dashboard de Grafana donde se puedan ver claramente los datos que están escritos en la base de datos de InfluxDB.** Configurad el dashboard de forma que se pueda apreciar claramente el comportamiento de los datos.
