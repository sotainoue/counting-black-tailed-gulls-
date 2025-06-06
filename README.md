# 🐦 Seagull Population Estimation from Aerial Images and Movement Data

## Overview
This repository provides a full pipeline to detect seagulls in aerial imagery, integrate detections with movement data using state-space models (SSMs), and estimate the population size.

---

## Structure

### - Seagull Detection
Object detection is performed using **YOLOv8**.  
- Code: [`training.ipynb`](./training.ipynb)

### - Movement Data Processing and Integration
Preprocessing of movement data, integration with count data, and state-space modeling are implemented in:  
- Code: [`seagull_analysis.Rmd`](./seagull_analysis.Rmd)

### - State-Space Models (SSMs)
Two types of models are available:
- **SSMp**: State-space model with partial observability
- **SSMn**: State-space model without observability adjustment
- Stan model files for both approaches are included.

---

## Requirements

- Python (for YOLOv8 detection)
- R + RMarkdown (for movement data processing and state-space modeling)
- Stan (for fitting the Bayesian state-space models)

---

## How to Use

1. **Run object detection**  
2. **Process and analyze movement data**  
3. **Interpret population estimates**

---

## Notes

- YOLOv8 model weights and configuration details should be set up before running `seagull.ipynb`.
- Stan files for SSMp and SSMn should be located in the same directory as `seagull_analysis.Rmd`.

---

