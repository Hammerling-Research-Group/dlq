# dlq
*Production code for DLQ Algorithm*

[![Spell Check](https://github.com/Hammerling-Research-Group/DLQ/actions/workflows/spellcheck.yml/badge.svg)](https://github.com/Hammerling-Research-Group/DLQ/actions/workflows/spellcheck.yml)

## Detection, localization, and quantification (DLQ) using continuous monitoring systems (CMS)

This repository contains code used to estimate methane emission start and end time (detection), source location (localization), and emission rate (quantification) using concentration observations from a network of point-in-space continuous monitoring systems. The code is separated into two main scripts: 1) `MAIN_1_simulate` runs the Gaussian puff atmospheric dispersion model, and 2) `MAIN_2_DLQ` uses output from the Gaussian puff model to perform DLQ. The `HELPER_` scripts contain auxiliary functions used in the `MAIN_1_` and `MAIN_2_` scripts.

Inputs to the `MAIN_1_` and `MAIN_2_` files are controlled using two configuration files found in the `input_data` directory. The `simulation_config.txt` file controls input for the `MAIN_1_` script and `DLQ_config.txt` controls input for the `MAIN_2_` script.

The `../Example/MAIN_3_` script generates all results and figures for the accompanying manuscript (Daniels et al. 2024): https://doi.org/10.1525/elementa.2023.00110

Note that the `input_data` directory also contains the raw concentration data, sensor locations, and source locations from the ADED experiment discussed in Daniels et al. 2024.
