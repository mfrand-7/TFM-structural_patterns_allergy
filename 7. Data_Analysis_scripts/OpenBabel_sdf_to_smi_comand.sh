#Miniconda environment
# --append option let us keepin the rsmd property that our molecules already contain
#Comand:

obabel -isdf inputfile.sdf --append "rmsd" -O output.smi