#Homework 1

Homework 1 consists of several steps to download datafiles, run programs on these, and report the results.
Solutions should be runnable by typing something like:
```shell
$ bash solution1.sh
```
#1 Getting data
$ curl -O https://biodataprog.github.io/2018_programming-intro/data/Ecoli-vs-Yersinia.BLASTP.tab.gz
$ du -h Ecoli-vs-Yersinia.BLASTP.tab.gz

#2 Compressing and uncompressing
$ gunzip Ecoli-vs-Yersinia.BLASTP.tab.gz
$ du -h Ecoli-vs-Yersinia.BLASTP.tab

#3 Counting and viewing
$ head -25 Ecoli-vs-Yersinia.BLASTP.tab
$ tail -5 Ecoli-vs-Yersinia.BLASTP.tab
$ wc -l Ecoli-vs-Yersinia.BLASTP.tab

#4 Sorting
$ curl -O https://biodataprog.github.io/2018_programming-intro/data/Nc3H.expr.tab
$ (head -n 1 Nc3H.expr.tab && tail -n +2 Nc3H.expr.tab | sort -k 6) > Nc20H.expr.sorted.tab
$ head -10 Nc20H.expr.sorted.tab

#5 Finding and counting
$ grep -c 'CDS  ' D_mel.63B12.gbk
$ cut -f3 Ecoli-vs-Yersinia.BLASTP.tab | grep -c 100.00
$ awk '$3 > 90.00 {print $1, $3}' Ecoli-vs-Yersinia.BLASTP.tab > Ecoli-vs-Yersinia_90percent.BLASTP.tab
$ wc -l Ecoli-vs-Yersinia_90percent.BLASTP.tab

$6 Sort and Uniq
$ curl -O https://biodataprog.github.io/2018_programming-intro/data/codon_table.txt
$ cut -f3 codon_table.txt | uniq -c
