<!-- multilingual suffix: en, es -->

<!-- [en] -->
# Acces to influx
asdfasdf

<!-- [es] -->

# Comunicación con entorno industrial en Node-RED 
En primer lugar, deberéis acceder a Node-RED. No es necesario que eliminéis el *flow* generado  para la primera parte del proyecto, podéis crear uno nuevo que aparecerá como una nueva  pestaña haciendo clic sobre el signo “+” que se indica en la siguiente captura: 

![](./img/Aspose.Words.413534b6-4ca3-41d6-9fb4-e8e165328afe.002.png){: .center} 

De nuevo, como en la primera parte del proyecto, el diseño del *flow* de Node-RED se llevará a  cabo de forma progresiva cumpliendo los objetivos que os vamos marcando a continuación. El  *flow* que generaréis tendrá una estructura como la siguiente: 

![](./img/Aspose.Words.413534b6-4ca3-41d6-9fb4-e8e165328afe.003.png){: .center}

Se recomienda el uso de bloques *debug* para validar cada paso del proceso. 

## Bloque Inject 

Este tipo de bloque ya se introdujo en la primera parte del proyecto**, por ello solo indicamos  que inicialmente lo configuréis con accionamiento manual,** es decir, que no genere pulsos de  forma periódica. 

### Bloque function anterior al bloque Modbus Flex Getter 

Este bloque *function* se utiliza para configurar el *payload* del mensaje que recibe el bloque  *Modbus Flex Getter* con unos parámetros concretos para que este último pueda leer los datos  que almacena el PLC con el que nos queremos comunicar. 

En la documentación del bloque *Modbus Flex Getter* se puede encontrar la información  referente a los parámetros que se pueden configurar y dos ejemplos de *payload*. El segundo  ejemplo, que recibe el nombre de *Function node code example for multiple inputs*, se utiliza para  casos en los que se deba leer distintos valores a la vez, como el caso que nos ocupa. Recordad  que pretendemos leer cuatro parámetros estadísticos calculados sobre la señal de vibración de  una máquina: *RMS, Skewness, Kurtosis* y *Mean*.  

Para acceder a la documentación del bloque y al ejemplo que se acaba de mencionar, hacer clic  en el bloque *Modbus Flex Getter* y en la parte derecha de la pantalla de Node-RED, buscad la  pestaña *Help,* la que tiene el símbolo de un libro. 

Debido a que ya tenéis seleccionado el bloque *Modbus Flex Getter* (el borde de un bloque que  tengáis seleccionado se volverá de color naranja/rojo para que sea fácil de identificar), la  información que os aparecerá en la parte inferior derecha de la pantalla de Node-RED ya será la  que hace referencia a este bloque. Deberíais ver algo similar a lo que se muestra en la siguiente  captura.

![](./img/Aspose.Words.413534b6-4ca3-41d6-9fb4-e8e165328afe.004.png)

Una vez copiéis el ejemplo que se ha mencionado, deberíais tener un bloque *function* con el  siguiente código: 

![](./img/Aspose.Words.413534b6-4ca3-41d6-9fb4-e8e165328afe.005.png)

Los nombres de los parámetros quedarán coloreados en verde y los valores de los parámetros  quedarán coloreados en naranja. 

**Objetivo** 

**1. Modificad los valores de los parámetros del ejemplo para que se realice la operación  de lectura de datos almacenados en el PLC acorde con la siguiente tabla. Tened en  cuenta que la dirección inicial será la del primer dato, 0 en este caso, y queréis leer  cuatro parámetros.** 

|<p>**FC o *function***  </p><p>***code***</p>|<p>**Dirección o**  </p><p>***Adress*** </p>|**Dato**|
| :-: | :-: | :-: |
|3 |0 |*RMS*|
|3 |1 |*Skewness*|
|3 |2 |*Kurtosis*|
|3 |3 |*Mean*|


Una vez configurado el bloque *function* será necesario configurar también el bloque *Modbus  Flex Getter* para validar que ambos bloques funcionan correctamente.

### Bloque Modbus Flex Getter 

El bloque *Modbus Flex Getter,* del paquete de Modbus, permite recibir datos de dispositivos que  se comuniquen mediante el protocolo Modbus TCP/IP, como el PLC que almacena los  parámetros medidos por el sensor de vibración. 

Para configurarlo, haced doble clic sobre el bloque y hacer clic en el icono del lápiz, que se indica  en la siguiente captura, para añadir un nuevo *Server*. 

![](./img/Aspose.Words.413534b6-4ca3-41d6-9fb4-e8e165328afe.006.png)

Ahora, deberéis introducir la información referente al *Type, Host* y *Port,* con los datos de los que  se dispone referentes al PLC con el que nos vamos a comunicar, que son los siguientes: 

|**Dirección IP** |**Puerto TCP**|
| :-: | :-: |
|147.83.83.29 |20000|


Para salir, hacer clic en el botón rojo de *Update* o *Done*. 

En este punto, el *flow* que deberíais haber generado consiste de 3 bloques: *Inject, function* y  *Modbus Flex Getter.* Si conectáis un bloque *debug* a la salida del bloque *Modbus Flex Getter,*  como se puede ver en la siguiente captura, podréis validar si habéis alcanzado el objetivo  propuesto. 

![](Aspose.Words.413534b6-4ca3-41d6-9fb4-e8e165328afe.007.png)**Objetivo** 

**1. Ejecutad el *flow* y verificad que sois capaces de recibir un objeto con el formato que  se muestra en la captura siguiente:**

![](Aspose.Words.413534b6-4ca3-41d6-9fb4-e8e165328afe.008.png)

### Bloque function posterior al bloque Modbus Flex Getter 
Para el diseño del código de este bloque *function* se deben tener en cuenta tres premisas: 

1) Los datos recibidos corresponden a los valores decimales de los 4 parámetros, pero han  sido codificados como enteros sin signo (*unsigned*) para transmitirlos en binario. Se os  proporcionará un código que permite transformar los datos recibidos a los valores  decimales originales. 

2) Cuando el *flow* esté completado, se deberá configurar (cuando lleguéis al punto 4 de  este documento) un período de lectura de los registros de datos del PLC de 1 segundo.  No obstante, el período de refresco de datos del PLC es de 5 segundos. Por tanto, se  espera que en ocasiones se lea el mismo dato varias veces consecutivas. Debido a que  esta información no aporta nada nuevo, ni se procesará como se indica a continuación  ni se escribirá en la base de datos. 

3) En el caso que se hayan leído nuevos datos, generaréis un quinto parámetro a modo de  preprocesado de datos, creando un quinto indicador, que podéis nombrar como  queráis, que responda a la siguiente fórmula: 

Indicador = RMS^2 

Por tanto, en la base de datos se escribirán cinco parámetros cada vez. 

**Objetivos** 

**1. Copiad el siguiente código en el bloque *function* y verificad en su salida que los datos  recibidos se asemejan a los de la captura.** 

    let data1 = [msg.payload.data[0], msg.payload.data[1]]; 
    let data2 = [msg.payload.data[2], msg.payload.data[3]]; 
    let data3 = [msg.payload.data[4], msg.payload.data[5]]; 
    let data4 = [msg.payload.data[6], msg.payload.data[7]]; 

    var bytes1 = new Uint16Array(data1); 
    var bytes2 = new Uint16Array(data2); 
    var bytes3 = new Uint16Array(data3); 
    var bytes4 = new Uint16Array(data4); 

    let view1 = new DataView(bytes1.buffer); 
    let view2 = new DataView(bytes2.buffer); 
    let view3 = new DataView(bytes3.buffer); 
    let view4 = new DataView(bytes4.buffer); 

    let param1 = view1.getFloat32(0, true); 
    let param2 = view2.getFloat32(0, true); 
    let param3 = view3.getFloat32(0, true); 
    let param4 = view4.getFloat32(0, true); 

    msg.payload = [param1, param2, param3, param4]; 

    return msg;
![](./img/Aspose.Words.413534b6-4ca3-41d6-9fb4-e8e165328afe.009.png)

**NOTA: El código que se pide en los siguientes apartados se tiene que ir escribiendo a  continuación del código proporcionado para el Objetivo 1.** 

**2. Completad la siguiente plantilla con una estructura condicional que permita descartar  los datos repetidos sin llegar a calcular el quinto parámetro.** 

![](./img/Aspose.Words.413534b6-4ca3-41d6-9fb4-e8e165328afe.010.png)

Podéis verificar que lo habéis hecho correctamente comparando los mensajes mostrados por  los bloques *debug* como en la captura siguiente: 

![](./img/Aspose.Words.413534b6-4ca3-41d6-9fb4-e8e165328afe.011.png)

**3. Añadid el cálculo del quinto parámetro solo si los datos no son repetidos** 

**4. Incluid la estructura de datos para que se puedan escribir en una base de datos de  InfluxDB. Cread una nueva serie de datos para no mezclar los datos leídos del PLC con  los datos sintéticos (Podéis utilizar como base el código que habéis generado en la  primera parte del proyecto para escribir los datos sintéticos en la base de datos de  InfluxDB).** 

Como se indica en la siguiente captura, debéis incluir la estructura de datos antes de la línea  donde se ejecuta el *return msg*:

![](./img/Aspose.Words.413534b6-4ca3-41d6-9fb4-e8e165328afe.012.png)

### Bloque Influx Batch 

La configuración del bloque Influx Batch es la misma que la que se indica en el documento guía  de la primera parte del proyecto (página XX). En este punto ya deberíais tener un *flow* completo  como el siguiente: 

![](./img/Aspose.Words.413534b6-4ca3-41d6-9fb4-e8e165328afe.003.png)

**Objetivo** 

**1. Generad varios mensajes de forma manual mediante el bloque *Inject*. Confirmad que  los datos se han escrito correctamente en la base de datos siguiendo el procedimiento  que se indica en el documento guía de la primera parte del proyecto (página 23).** 

En la base de datos de InfluxDB, deberíais visualizar datos como los que se muestran en la  siguiente captura:

![](./img/Aspose.Words.413534b6-4ca3-41d6-9fb4-e8e165328afe.013.png) 