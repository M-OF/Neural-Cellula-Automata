# Growing Neural Cellular Automata

A PyTorch implementation of ["Growing Neural Cellular Automata"](https://distill.pub/2020/growing-ca/) 
(Mordvintsev et al., 2020) — a model that learns to grow, maintain, and 
regenerate complex patterns from a single seed cell using learned update rules.

## Overview

Each cell in a grid holds a 16-dimensional state vector: RGB color, an 
alpha ("alive") channel, and 12 hidden channels. At every step, each cell 
perceives its neighborhood via Sobel filters and updates its 
state through a small shared neural network. 
The system learns to self-organize into a target image.

## Repository Structure
NEURAL_CA/

├── img/                          # Target images

│   


├── notebooks/

│   └── Neural_cellular_automata.ipynb

├── scripts/

│   └── ... # Stitches frames into video with ffmpeg

├── outputs/ # Generated frames and videos

└── README.md

## Experiments

### 1. Growth
The model learns to grow the target pattern from a single seed 
cell over ~64-96 update steps, trained with backpropagation through time.

![growth](output/growth.gif)

- Grid size: 64x64
- Final loss: ~0.009

### 2. Persistence
Using pool-based training — sampling a batch of states at various growth 
stages, training on them, and feeding outputs back into the pool — the 
model learns to treat the target pattern as a stable attractor rather 
than a transient growth target.

The pattern remains stable for over 100 steps before gradual 
degradation, an improvement over Experiment 1, where degradation begins 
almost immediately after the initial growth phase.

### 3. Regeneration
Extending the pool training, random circular regions of well-formed 
samples are damaged each iteration, training the model to repair local 
damage using only its learned update rule.

![regrowth](output/regrowth.gif)

## Running

Training requires a GPU for reasonable iteration counts (Google Colab 
recommended). Open `notebooks/Neural_cellular_automata.ipynb`.

Frame sequences can be stitched into videos using:
```bash
bash scripts/build_growth_video.sh
```

## Targets

Three pixel-art targets were used: Abra, Gengar, and four-leaf clover.

## Disclaimer

The pixel-art target images (Abra, Gengar) are Pokémon properties 
owned by Nintendo/Game Freak/The Pokémon Company. They are used here 
solely for educational/research purposes to reproduce the experiments 
from the referenced paper, with no claim of ownership or commercial intent.

Same goes for the four-leaf clover rights.

## References

Mordvintsev, A., Niklasson, E., Randazzo, E., Levin, M. (2020). 
"Growing Neural Cellular Automata", Distill. 
https://distill.pub/2020/growing-ca/