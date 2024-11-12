#!/bin/sh

source src/utils.sh

print_head "02" "Alignment"

# A - align assemblies
print_info "gb" "02A" "Aligning assemblies to reference via AnchorWave..."
phg align-assemblies \
    --gff ${OUTPUT_DATA[ref_gff]} \
    --reference-file ${OUTPUT_DATA[ref_asm]} \
    --assembly-file-list ${OUTPUT_DATA[asm_list]} \
    --total-threads $N_THREADS \
    -o ${NEEDED_DIRS[maf]} \
    > ${NEEDED_DIRS[log]}/02a_align_assemblies.log 2>&1


# Finish
print_success

