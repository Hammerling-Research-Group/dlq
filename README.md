# dlq
*Production code for DLQ Algorithm*

[![Spell Check](https://github.com/Hammerling-Research-Group/DLQ/actions/workflows/spellcheck.yml/badge.svg)](https://github.com/Hammerling-Research-Group/DLQ/actions/workflows/spellcheck.yml)
[![R Lint](https://github.com/Hammerling-Research-Group/dlq/actions/workflows/lint.yml/badge.svg)](https://github.com/Hammerling-Research-Group/dlq/actions/workflows/lint.yml)
[![R tests](https://github.com/Hammerling-Research-Group/dlq/actions/workflows/test.yml/badge.svg)](https://github.com/Hammerling-Research-Group/dlq/actions/workflows/test.yml)
[![GitHub license](https://img.shields.io/github/license/Hammerling-Research-Group/DLQ?color=blue)](https://github.com/Hammerling-Research-Group/DLQ/blob/main/LICENSE)
[![GitHub contributors](https://img.shields.io/github/contributors/Hammerling-Research-Group/DLQ.svg)](https://github.com/Hammerling-Research-Group/DLQ/graphs/contributors/)

## Detection, localization, and quantification (DLQ) 

This repository contains code used to estimate methane emission start and end time (detection), source location (localization), and emission rate (quantification) using concentration observations from a network of point-in-space continuous monitoring systems. 

For more on this work, see Daniels et al. (2024), https://doi.org/10.1525/elementa.2023.00110

## Installation & Usage

Though the current code is still largely in "research code" form, users are still encouraged to engage with it. 

To do so, the simplest approach is to clone the repo and work from the `dlq` directory. 

1. Set your desired directory from which to work. E.g., for your Desktop:

```bash
cd Desktop
```

2. Clone and store `dlq` at the desired location:

```bash
git clone https://github.com/Hammerling-Research-Group/dlq.git
```

3. Move into the cloned `dlq` directory:

```bash
cd dlq
```

4. Once cloned, go into the `dlq` folder and open `DLQ.Rproj` by double clicking it. This should open a new RStudio session, with `DLQ.Rproj` set as the root. 

5. In the session, navigate to the `Files` tab and then open the `R` subdirectory.
     - Start by opening and running the `MAIN_1_simulate.R` script (*For details on these scripts, see the `Code Structure` section below*).
     - Then, proceed to and run the `MAIN_2_DLQ.R` script

## Code Structure

The code is separated into two main scripts: 1) `MAIN_1_simulate` runs the Gaussian puff atmospheric dispersion model, and 2) `MAIN_2_DLQ` uses output from the Gaussian puff model to perform DLQ. The `/helpers/HELPER_*` scripts contain auxiliary functions used in the `MAIN_1_` and `MAIN_2_` scripts.

Inputs to the `MAIN_1_` and `MAIN_2_` files are controlled using two configuration files found in the `input_data` directory:

  - `simulation_config.txt` file controls input for the `MAIN_1_` script

  - `DLQ_config.txt` controls input for the `MAIN_2_` script
