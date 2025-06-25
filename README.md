# 🐦 Seagull Detection and Population Estimation

This repository includes code and data for detecting individual seagulls from aerial images using YOLOv8 and estimating population size by integrating movement and detection data through state-space models.

---

## 📦 Directory Structure

├── object_detection/ │ ├── training.ipynb # YOLOv8 training code │ ├── training_data/ # Training dataset │ └── example.png # Sample image showing detection │ ├── data/ │ ├── seagull_movement.csv # GPS point data of gulls │ ├── flight_record.csv # Drone flight records │ ├── count_sahi_data.csv # Object detection results │ ├── pre_ano_data.csv # Annotation metadata │ ├── full_dens_df.RData # Posterior samples from sub-sampling │ ├── full_ci_df.RData # Credible intervals from sub-sampling │ └── dist_data.RData # Wasserstein distances │ ├── ssm_model/ │ ├── ssmp.stan # State-space model for estimating p (presence probability) │ └── ssmn.stan # State-space model for estimating N (total abundance) │ └── seagull_analysis.Rmd # Full analysis pipeline and modeling

---

## 🧠 Object Detection (YOLOv8)

Object detection is performed using **YOLOv8**.

- 📁 Code: `object_detection/training.ipynb`
- 🖼 Example: `object_detection/example.png`
- 📦 Training data: `object_detection/training_data/`

---

## 🛰 Movement Data Integration

Movement data preprocessing, integration with drone-based counts, and model fitting are handled in:

- 📄 Code: `seagull_analysis.Rmd`
- 📊 Data:
  - `data/seagull_movement.csv`: GPS data from tracked individuals
  - `data/flight_record.csv`: Drone flight log
  - `data/count_sahi_data.csv`: Output from object detection
  - `data/pre_ano_data.csv`: Annotation data

---

## 📈 State-Space Models (SSMs)

Implemented in Stan (`.stan` files), two models are used:

- `ssmp.stan`: Estimates **p** (probability of being within the colony)
- `ssmn.stan`: Estimates **N** (total number of individuals)

---

## 🔁 Sub-sampling Simulation

To assess the robustness of the population estimates:

- Only summary results are shown (raw data is large)
- Simulation results are used in `seagull_analysis.Rmd`

**Summary Datasets**:
- `full_dens_df.RData`: Posterior distributions under sub-sampling
- `full_ci_df.RData`: 95% CI summaries
- `dist_data.RData`: Wasserstein distance between posteriors

---

## 🧪 Environment

Anaconda environment details can be found in:

- `Environment.yml`

---

Let me know if you'd like to include installation instructions, usage examples, or figures as well!
