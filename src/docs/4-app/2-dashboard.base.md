<!-- multilingual suffix: en, es -->

<!-- [en] -->

# Data visualization in Grafana

<!-- [es] -->

# Visualización de datos en Grafana 

<!-- [en] -->

You must create a Grafana *dashboard* that allows you to view the temporary record of the data stored in the database.

Remember that the guide document for the first part of the project explains step by step how to add an InfluxDB database to Grafana and how to generate a graphic panel within a dashboard.

It is recommended that at this point you run the Node-RED *flow* reading data automatically, configuring the *Inject* block as seen in the following screenshot:

![](./img/2.23.png){: .center} 

**Objectives**

1. **Create a dashboard where they can be consulted:**
**a. The preprocessed data written to the database from the Node-RED flow.**
**b. The results written to the database from script 3 in Matlab Online.**

![](./img/2.24.png){: .center} 

In the capture that you have as an example, two Grafana panels are shown:

- The first with the measured data of the Kurtosis parameter, which has a new value every 5 seconds. Remember that this corresponds to the fact that the Node-RED *flow* only writes to the database every time it reads new data from the PLC.
- The second with the processed data of the Kurtosis parameter. In this case, the processed data is only calculated and written to the database each time you run the MATLAB script.

## Visualization of data and results stored in Matlab
For the last part of the project, you will have to generate a Grafana *dashboard* that allows you to visualize the data that you have written from the MATLAB Online script.

For this part of the project, no specific *dashboard* structure is set. It is suggested that you explore the possibilities of Grafana to generate a graphic panel that contains:

- Panels that show the evolution of a component of the data (either known or unknown) over time.

![](./img/3.4.png){: .center} 

- Panels that show the membership value as a percentage of the operating conditions (“Healthy” and “Bearing failure”) of the diagnosed data.

![](./img/3.5.png){: .center} 

- Dashboards showing membership value progress over time.
- *Scatter-type* panels that allow visualizing the distribution of the data, both of the diagnosed data and of the unknown data. Keep in mind that you should see something similar to the figures that are generated in the MATLAB script, you may have to adjust the values of the axes so that the same area is graphed.

![](./img/3.6.png){: .center} 

Take into account if the use of different colors helps to clearly differentiate both the graphs from each other and the ranges of values that the data take.

<!-- [es] -->

Deberéis crear un *dashboard* de Grafana que permita visualizar el registro temporal de los datos  almacenados en la base de datos. 

Recordad que en el documento guía de la primera parte del proyecto se explica paso a paso  como añadir una base de datos de InfluxDB a Grafana y como generar un panel gráfico dentro  de un dashboard. 

Se recomienda que en este punto hagáis correr el *flow* de Node-RED leyendo datos  automáticamente, configurando el bloque *Inject* como se ve en la siguiente captura: 

![](./img/2.23.png){: .center} 

**Objetivos** 

**1. Cread un *dashboard* donde se puedan consultar:** 

**a. Los datos preprocesados escritos en la base de datos des del *flow* de Node RED.** 

**b. Los resultados escritos en la base de datos des del script 3 en Matlab Online.**

![](./img/2.24.png){: .center} 

En la captura que tenéis como ejemplo se muestran dos paneles de Grafana: 

- El primero con los datos medidos del parámetro Kurtosis, que tiene un valor nuevo cada  5 segundos. Recordad que ello corresponde a que el *flow* de Node-RED solo escribe en  la base de datos cada vez que lee un dato nuevo en el PLC. 

- El segundo con los datos procesados del parámetro Kurtosis. En este caso, los datos  procesados solo se calculan y escriben en la base de datos cada vez que ejecutáis el  script de MATLAB.

## Visualización de datos y resultados almacenados en Matlab

Para la última parte del proyecto, deberéis generar un *dashboard* de Grafana que os permita visualizar los datos que habéis escrito  des del script de MATLAB Online. 

Para esta parte del proyecto no se fija una estructura de *dashboard* concreta. Se os propone que  exploréis las posibilidades de Grafana para generar un panel gráfico que contenga: 

- Paneles que muestren la evolución de un componente de los datos (ya sean los conocidos  o los desconocidos) a lo largo del tiempo. 

![](./img/3.4.png){: .center} 

- Paneles que muestren el valor de pertenencia como tanto por ciento de las condiciones de  funcionamiento (“Sano” y “Fallo cojinete”) de los datos diagnosticados. 

![](./img/3.5.png){: .center} 

- Paneles que muestren el avance a lo largo del tiempo del valor de pertenencia. 
- Paneles de tipo *Scatter* que permitan visualizar la distribución de los datos, tanto de los  datos diagnosticados como de los datos desconocidos. Tened en cuenta que deberíais ver  algo parecido a las figuras que se generan en el script de MATLAB, es posible que debáis  ajustar los valores de los ejes para que se grafique la misma zona. 

![](./img/3.6.png){: .center} 

Tened en cuenta si el uso de distintos colores ayuda a diferenciar claramente tanto los gráficos entre  si como los rangos de valores que toman los datos.