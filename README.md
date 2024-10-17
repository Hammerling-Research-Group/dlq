# dlq
*Production code for DLQ Algorithm*

[![Spell Check](https://github.com/Hammerling-Research-Group/DLQ/actions/workflows/spellcheck.yml/badge.svg)](https://github.com/Hammerling-Research-Group/DLQ/actions/workflows/spellcheck.yml)

## Detection, localization, and quantification (DLQ) 

This repository contains code used to estimate methane emission start and end time (detection), source location (localization), and emission rate (quantification) using concentration observations from a network of point-in-space continuous monitoring systems. This work is from the recently published paper: Daniels et al. (2024), https://doi.org/10.1525/elementa.2023.00110

## Installation & Usage

Though the current code is still largely in "research code" form, users are still encouraged to engage with it. 

The simplest approach is to ingest the full repo, and work from the packaged example and sample `input_data`. 

To do so, follow these steps: 

1. Download the latest version of this repository, which includes the entire DLQ codebase, as a zipped/compressed file:

```r
download.file(url = "https://github.com/Hammerling-Research-Group/dlq/archive/refs/heads/main.zip", 
              destfile = "Desktop/DLQ.zip") # change `Desktop` to anywhere you'd like
```

2. Navigate to where the code is stored and uncompress/unzip.

3. Go into the unzipped folder and open `DLQ.Rproj` by double clicking it. This should open a new RStudio session, with `DLQ.Rproj` set as the root. 

4. In the session, navigate to the `Files` tab and start by opening and running the `MAIN_1_simulate.R` script. *Note*: For details on these scripts, see the `Code Structure` section below. 

5. Then, proceed to and run the `MAIN_2_DLQ.R` script.   

## Code Structure

The code is separated into two main scripts: 1) `MAIN_1_simulate` runs the Gaussian puff atmospheric dispersion model, and 2) `MAIN_2_DLQ` uses output from the Gaussian puff model to perform DLQ. The `/helpers/HELPER_*` scripts contain auxiliary functions used in the `MAIN_1_` and `MAIN_2_` scripts.

Inputs to the `MAIN_1_` and `MAIN_2_` files are controlled using two configuration files found in the `input_data` directory:

  - `simulation_config.txt` file controls input for the `MAIN_1_` script

  - `DLQ_config.txt` controls input for the `MAIN_2_` script

The `../Example/MAIN_3_` script generates all results and figures for the accompanying manuscript (Daniels et al. 2024): https://doi.org/10.1525/elementa.2023.00110

By way of example (and to get users started with the code), `input_data` contains the raw concentration data, sensor locations, and source locations from the ADED experiment discussed in Daniels et al. 2024.

Users should simply open and run `MAIN_1_simulate`, then `MAIN_2_DLQ`. Optional is to run the `MAIN_3_*` script. 
