#!/bin/sh

# Load utilities and variables
source src/utils.sh

# Check for Bash version (need >= 4)
if ((BASH_VERSINFO[0] < 4)); then
    echo -e "${COLS[rb]}Error${COLS[n]}: This script requires Bash version ${COLS[gb]}4${COLS[n]} or higher." >&2
    exit 1
fi


print_head "00" "initialization and cleanup"

# A - make dirs
print_info "gb" "00A" "Creating necessary directories"
for key in "${!NEEDED_DIRS[@]}"; do
    directory="${NEEDED_DIRS[$key]}"
    if [ ! -d "$directory" ]; then
        mkdir -p "$directory"
        echo -e "  ${COLS[bb]}*${COLS[n]} directory created for $key: $directory"
    else
        echo -e "  ${COLS[yb]}!${COLS[n]} directory already exists for $key: $directory"
    fi
done


# B - decompression
print_info "gb" "00B" "Decompressing tutorial data..."
tar -xf ${OUTPUT_DATA[tar_build]} -C ${NEEDED_DIRS[data]}


# C - move data
print_info "gb" "00C" "Moving data..."
mv data/fastas/ ${OUTPUT_DATA[orig_fa]}
mv data/keyfile.txt ${OUTPUT_DATA[fa_rename]}
mv data/Zm-B73-REFERENCE-NAM-5.0_Zm00001eb.1_tutorial.gff3 ${OUTPUT_DATA[ref_gff]}


# D - clean up paths
print_info "gb" "00D" "Cleaning up paths in keyfiles..."
sed -i "s|fastas/|${OUTPUT_DATA[orig_fa]}|g" ${OUTPUT_DATA[fa_rename]}
sed -i "s|updated-fastas/|${NEEDED_DIRS[up_fa]}|g" ${OUTPUT_DATA[asm_list]}


# E - remove old data
print_info "gb" "00E" "Removing old data..."
rm ${OUTPUT_DATA[tar_build]}


# Finish
print_success



