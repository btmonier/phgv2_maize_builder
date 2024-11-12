# Misc ----
WORK_DIR=$(realpath .)
N_THREADS=40


# Key-value data ----

## Define colors
declare -A COLS=(
    ["r"]="\033[0;31m"  # red
    ["g"]="\033[0;32m"  # green
    ["y"]="\033[0;33m"  # yellow
    ["b"]="\033[0;34m"  # blue
    ["rb"]="\033[1;31m" # bold red
    ["gb"]="\033[1;32m" # bold green
    ["yb"]="\033[1;33m" # bold yellow
    ["bb"]="\033[1;34m" # bold blue
    ["n"]="\033[0m"     # no color / break
    ["bld"]="\033[1m"   # just bold
)

## Diretories that *need* to be made
declare -A NEEDED_DIRS=(
    ["data"]="${WORK_DIR}/data/"
    ["output"]="${WORK_DIR}/output/"
    ["log"]="${WORK_DIR}/output/logs/"
    ["up_fa"]="${WORK_DIR}/output/updated_fastas/"
    ["maf"]=${WORK_DIR}/output/mafs/
    ["vcf_files"]="${WORK_DIR}/output/vcfs/"
)

## Paths to necessary files and directories
declare -A OUTPUT_DATA=(
    ["vcf_dbs"]="${NEEDED_DIRS[data]}vcf_dbs/"
    ["orig_fa"]="${NEEDED_DIRS[data]}orig_fastas/"
    ["fa_rename"]="${NEEDED_DIRS[data]}fasta_rename_keyfile.txt"
    ["asm_list"]="${NEEDED_DIRS[data]}assemblies_list.txt"
    ["ref_gff"]="${NEEDED_DIRS[data]}b73v5_ref_ranges.gff3"
    ["ref_bed"]="${NEEDED_DIRS[output]}b73v5_ref_ranges.bed"
    ["ref_asm"]="${NEEDED_DIRS[up_fa]}B73.fa"
    ["tar_build"]="${WORK_DIR}/PHGv2BuildingTutorialData.tar.gz"
)


# Functions ----

## Print bold colored messages
print_info() {
    local color_key="$1"  # color key, e.g., gb for green bold
    local code="$2"       # code number, e.g., 01A
    local message="$3"    # message text
    echo -e "${COLS[$color_key]}${code}${COLS[n]} - ${message}"
}

## Print success
print_success() {
    echo -e "${COLS[gb]}Finished!${COLS[n]}"
}

## Print script title
print_head() {
    local script="$1"
    local message="$2"
    echo -e "${COLS[bb]}Starting Part ${script}${COLS[n]} - ${COLS[bld]}${message}:${COLS[n]}"
}



