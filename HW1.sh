#!/usr/bin/bash
echo 'Homework 1 Solutions'
echo
echo 'Downloading Ecoli-vs-Yersinia.BLASTP.tab.gz'
curl -O https://biodataprog.github.io/2018_programming-intro/data/Ecoli-vs-Yersinia.BLASTP.tab.gz
echo
echo 'Size of the compressed file.'
du -h Ecoli-vs-Yersinia.BLASTP.tab.gz
echo
gunzip Ecoli-vs-Yersinia.BLASTP.tab.gz
echo 'Size of the uncompressed file.'
du -h Ecoli-vs-Yersinia.BLASTP.tab
echo
echo 'The first 25 lines in the file.'
head -25 Ecoli-vs-Yersinia.BLASTP.tab
echo
echo 'The last 3 lines of the file.'
tail -3 Ecoli-vs-Yersinia.BLASTP.tab
echo
echo 'Total lines in the file.'
wc -l Ecoli-vs-Yersinia.BLASTP.tab
echo
echo 'Downloading Nc3H.expr.tab'
curl -O https://biodataprog.github.io/2018_programming-intro/data/Nc3H.expr.tab
echo
echo 'Top 10 most highly expressed genes based on FPKM.'
(head -n 1 Nc3H.expr.tab && tail -n +2 Nc3H.expr.tab | sort -k6,6nr) > Nc3H.expr.sorted.tab
head -11 Nc3H.expr.sorted.tab
echo
echo 'Downloading D_mel.63B12.gbk'
curl -O https://biodataprog.github.io/2018_programming-intro/data/D_mel.63B12.gbk
echo
echo 'Number of coding sequences in the genbank file.'
grep -c '     CDS' D_mel.63B12.gbk
echo
echo 'Number of sequence alignments that are 100% identical.'
cut -f3 Ecoli-vs-Yersinia.BLASTP.tab | grep -c '100.00'
echo
echo 'Number of sequence alignments that are >90% identical.'
awk '$3 > 90 {print $1,$3}' Ecoli-vs-Yersinia.BLASTP.tab > Ecoli-vs-Yersinia_90percent.BLASTP.tab
wc -l Ecoli-vs-Yersinia_90percent.BLASTP.tab
echo
echo 'Downloading codon_table.txt'
curl -O https://biodataprog.github.io/2018_programming-intro/data/codon_table.txt
echo
echo 'Number of codons that encode each amino acid.'
cut -f3 codon_table.txt | uniq -c
echo
rm -i Ecoli-vs-Yersinia.BLASTP.tab Nc3H.expr.tab Nc3H.expr.sorted.tab D_mel.63B12.gbk Ecoli-vs-Yersinia_90percent.BLASTP.tab codon_table.txt .Ecoli-vs-Yersinia.BLASTP.tab.swp
