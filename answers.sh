#! /usr/bin/env bash

datasets='/Users/shanshan_pei/Documents/MOLB7621/data-sets'

# Question 1: Which state in states.tab.gz has the lowest murder rate?
states="$datasets/misc/states.tab.gz"
answer_1=$(gzcat $states \
    | grep -v '^#' \
    | cut -f1,6 \
    | sort -k2n \
    | head -n1 \
    | cut -f1 \
    | sed 's/"//g')
echo "answer-1: $answer_1"

# Question 2: How many sequence records are in the sample.fa file?
sequence="$datasets/fasta/sample.fa"
answer_2=$(grep -v '^>' $sequence \
    | wc -l)
echo "answer-2: $answer_2"

# Question 3: How many unique CpG IDs are in cpg.bed.gz?
bed="$datasets/bed/cpg.bed.gz"
answer_3=$(gzcat $bed \
    | cut -f4 \
    | sort \
    | uniq -c \
    | wc -l)
echo "answer-3: $answer_3"

# Question 4: How many sequence records are in the SP1.fq file?
sp1="$datasets/fastq/SP1.fq"
answer_4=$(grep '^@cluster' $sp1 \
    | wc -l)
echo "answer-4: $answer_4"

# Question 5: How many words are on lines containing the word bloody in hamlet.txt?
hamlet="$datasets/misc/hamlet.txt"
answer_5=$(grep -i 'bloody' $hamlet \
    | wc -w)
echo "answer-5: $answer_5"

# Question 6: What is the length of the sequence in the first record of sample.fa?
answer_6=$(sed -n '2p' $sequence \
    | head -n1 \
    | tr -d '\n' \
    | wc -c)
echo "answer-6: $answer_6"

# Question 7: What is the name of the longest gene in genes.hg19.bed.gz?
hg19bed="$datasets/bed/genes.hg19.bed.gz"
answer_7=$(gzcat $hg19bed \
    | awk 'BEGIN {OFS="\t"} {print $0, $3-$2}' \
    | sort -k7rn \
    | cut -f4 \
    | head -1)
echo "answer-7: $answer_7"

# Question 8: How many unique chromosomes are in genes.hg19.bed.gz?
answer_8=$(gzcat $hg19bed \
    | cut -f1 \
    | sort \
    | uniq -c \
    | wc -l)
echo "answer-8: $answer_8"

# Question 9: How many intervals are associated with CTCF (not CTCFL) in peaks.chr22.bed.gz?
# Are we talking about unique intervals? needs to discuss with TA
chr22peaks="$datasets/bed/peaks.chr22.bed.gz"
answer_9=$(gzcat $chr22peaks \
    | awk 'BEGIN {OFS="\t"} {print $4, $3-$2}' \
    | grep -w 'CTCF' \
    | wc -l)
echo "answer-9: $answer_9"

# Question 10: On what chromosome is the largest interval in lamina.bed?
lamina="$datasets/bed/lamina.bed"
answer_10=$(awk 'BEGIN {OFS="\t"} {print $1, $3 - $2}' $lamina \
    | sort -k2rn \
    | cut -f1 \
    | head -1)
echo "answer-10: $answer_10"
