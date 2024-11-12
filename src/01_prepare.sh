#!/bin/sh

source src/utils.sh

print_head "01" "DB initialization and ref range creation"

# A - initialize
print_info "gb" "01A" "Running DB initialization..."
phg initdb \
    --db-path ${OUTPUT_DATA[vcf_dbs]} \
    > ${NEEDED_DIRS[log]}/01a_initdb.log 2>&1


# B - prepare FASTA assemblies
print_info "gb" "01B" "Updating assembly information..."
phg prepare-assemblies \
    --keyfile ${OUTPUT_DATA[fa_rename]} \
    --output-dir ${NEEDED_DIRS[up_fa]} \
    --threads ${N_THREADS} \
    > ${NEEDED_DIRS[log]}/01b_prepare_assemblies.log 2>&1


# C - compress FASTA assemblies
print_info "gb" "01C" "Compressing updated FASTA files via AGC..."
phg agc-compress \
    --db-path ${OUTPUT_DATA[vcf_dbs]} \
    --reference-file ${OUTPUT_DATA[ref_asm]} \
    --fasta-list ${OUTPUT_DATA[asm_list]} \
    > ${NEEDED_DIRS[log]}/01c_compress_assemblies.log 2>&1


# D - create BED from GFF
print_info "gb" "01D" "Creating a BED file from GFF input"
phg create-ranges \
    --reference-file ${OUTPUT_DATA[ref_asm]} \
    --gff ${OUTPUT_DATA[ref_gff]} \
    --boundary gene \
    --pad 500 \
    --range-min-size 500 \
    -o ${OUTPUT_DATA[ref_bed]} \
    > ${NEEDED_DIRS[log]}/01d_create_ranges.log 2>&1


# Finish
print_success



