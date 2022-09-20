# Industrial IoT and Cyberphysical Systems

This repository contains the source code for the documentation of the couse "Industrial IoT and Cyberphysical Systems" at the Universitat Politécnica de Catalunya.

Authors

[Ángel Fernández Sobrino](https://github.com/angelfernandezsobrino)

## Overview

This course is part of the Master's degree in Automatic Systems and Industrial Electronics Engineering. The course is focused on the introduction to the Industrial Internet of Things (IIoT) and Cyberphysical Systems (CPS). The course is divided in three parts:

1. Cloud infrastructure and Virtual machines
2. Lowcode Cloud computing, data bases and dashboards
3. Data analisis and Machine Learning

The course is based on the following solutions:

- [Azure](https://azure.microsoft.com/en-us/)
- [Linux Ubuntu](https://ubuntu.com/)
- [Node-RED](https://nodered.org/)
- [InfluxDB](https://www.influxdata.com/)
- [Grafana](https://grafana.com/)
- [Matlab](https://www.mathworks.com/products/matlab.html)


## How to build the documentation

The documentation is built using [multilingual-markdown-generator](https://github.com/ryul1206/multilingual-markdown) and [mkdocs](https://www.mkdocs.org/). To build the documentation, you need to install the following dependencies:


- bash
- python3
- Python requirements (see `requirements.txt`)
- Weasyprint (for [mkdocs-with-pdf](https://github.com/orzih/mkdocs-with-pdf) - see [here](https://doc.courtbouillon.org/weasyprint/latest/first_steps.html#windows))


Then, you can build the documentation by using the makefile provided in the repository, which will generate the documentation in the `./build/site` folder. To build the documentation, you can use the following command:


```bash
    make        # Build the documentation at ./build/site
    make dev    # Start a local server to preview the src documentation
    make serve  # Start a local server to preview the built documentation
```
Other useful commands:

```bash
    make clean      # Remove all generated files
    make translate  # Build translated files
    make build      # Build the documentation static web files
```

