🐦 Seagull Population Estimation from Aerial Images and Movement Data
Overview
This repository provides a full pipeline to detect seagulls in aerial imagery, integrate detections with movement data using state-space models (SSMs), and estimate the population size.
It combines object detection with advanced Bayesian modeling to achieve accurate population estimates.

Structure
Seagull Detection
Object detection is performed using YOLOv8.

Code: seagull.ipynb

Movement Data Processing and Integration
Preprocessing of movement data, integration with count data, and state-space modeling are implemented in:

Code: seagull_analysis.Rmd

State-Space Models (SSMs)
Two types of models are available:

SSMp: State-space model with partial observability

SSMn: State-space model without observability adjustment

Stan model files for both approaches are included.

Requirements
Python (for YOLOv8 detection)

R + RMarkdown (for movement data processing and state-space modeling)

Stan (for fitting the Bayesian state-space models)

How to Use
Run object detection
Execute seagull.ipynb to detect seagulls from aerial imagery using YOLOv8.

Process and analyze movement data
Open and run seagull_analysis.Rmd to:

Clean and prepare movement datasets

Integrate count data

Fit state-space models (SSMp and SSMn) using Stan

Interpret population estimates
Model outputs provide population size estimates along with uncertainty quantification.
