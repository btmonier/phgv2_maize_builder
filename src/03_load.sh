#!/bin/sh

source src/utils.sh

print_head "03" "VCF creation and DB loading"

# A - create reference VCFs
print_info "gb" "03A" "Create reference VCFs..."
phg create-ref-vcf \
    --bed ${OUTPUT_DATA[ref_bed]} \
    --reference-file ${OUTPUT_DATA[ref_asm]} \
    --reference-name B73 \
    --db-path ${OUTPUT_DATA[vcf_dbs]} \
    > ${NEEDED_DIRS[log]}/03a_create_ref_vcf.log 2>&1


# B - create assembly VCFs
print_info "gb" "03B" "Create assembly VCFs..."
phg create-maf-vcf \
    --db-path ${OUTPUT_DATA[vcf_dbs]} \
    --bed ${OUTPUT_DATA[ref_bed]} \
    --reference-file ${OUTPUT_DATA[ref_asm]} \
    --maf-dir ${NEEDED_DIRS[maf]} \
    -o ${NEEDED_DIRS[vcf_files]} \
    > ${NEEDED_DIRS[log]}/03b_create_maf_vcf.log 2>&1


# C - load data into DBs
print_info "gb" "03C" "Load data into TileDB..."
phg load-vcf \
    --vcf-dir ${NEEDED_DIRS[vcf_files]} \
    --db-path ${OUTPUT_DATA[vcf_dbs]} \
    --threads $N_THREADS \
    > ${NEEDED_DIRS[log]}/03c_load_vcf.log 2>&1


# Finish
print_success



