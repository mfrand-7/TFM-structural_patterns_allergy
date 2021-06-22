#SCRIPT FOR TREE CREATION
# all results in: /home/marta.franco.debenito/Proyect/7.Phylogenetic_Analysis/
WD=/home/marta.franco.debenito/Proyect/7.Phylogenetic_Analysis
#Build a phylogenetic tree out of the FASTA file
#Multiple sequence alignment
echo mafft for SAMPLES
mafft $WD/Example.faa > $WD/Example.alg
#construction of phylogenetic trees
#(modelo evolutivo para la secuencia; -s= tipo de alineamiento que es secuencia multiple)
echo construction of phylogenetic tree Allergens
iqtree -s $WD/Example.alg -m LG --fast
done;
#Root and visualize the trees
python midpoint_rooting.py Example.alg.treefile | ete3 view --text 
#extract newick format to export to other graphical tools
python midpoint_rooting.py Example.alg.treefile > example_rooted.treefile
#END 