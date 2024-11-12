# Build an example PHGv2 database
Scripts used to make an example PHG database using V2 methods

## Prerequisites
* A unix-based OS (e.g., Ubuntu, Arch<sup><em>btw</em></sup>)
* Conda
* A recent version of [PHGv2](https://github.com/maize-genetics/phg_v2/releases/latest)


## Steps
1. Install and set up PHGv2 paths and environment. More info [here](https://phg.maizegenetics.net/installation/).

2. Clone repository and navigate into directory.

3. Download the "PHGv2 Building Tutorial Data" (`PHGv2BuildingTutorialData.tar.gz`) found 
   [here](https://drive.google.com/drive/folders/1r43lml9T0s5iuilvc--EejJWmITaiWKw) and copy
   into directory.

4. Run:
   a. `./src/00_init.sh`
   b. `./src/01_prepare.sh`
   c. `./src/02_align.sh`
   d. `./src/03_load.sh`


## Script descriptions

| Script          | Description                                                               |
|-----------------|---------------------------------------------------------------------------|
| `00_init.sh`    | Decompresses example data and sets up project directory                   |
| `01_prepare.sh` | Updates and compresses assembly data; Creates reference range coordinates |
| `02_align.sh`   | Aligns assemblies to reference assembly via AnchorWave                    |
| `03_load.sh`    | Creates VCF files and loads into TileDB instances                         |
| `utils.sh`      | Various functions and commonly used shell variables                       |



