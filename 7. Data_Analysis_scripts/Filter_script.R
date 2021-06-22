library(dplyr)
setwd("C:/Users/34686/Desktop/TFM_R")
getwd()

filtrado <- read.csv("Merged_Results/Results_merged_Plantcyc_Mol1_Betv1_Pharmit+RPBS.csv",sep=";",stringsAsFactors = T)
original <- read.csv("Output_files/Results_clusters_k4_PlantCyc_Mol1_Betv1.csv",sep=",",stringsAsFactors = T, header = T)

#Combinar las 2 tablas (todas las columnas)
Merged <- merge(x = original, y = filtrado,
                by= c("Compound", "Compound"))
write.csv(Merged, file="Results_final_PlatCyc_K4_Mol1_Betv1_all.csv")
-
#Forma 2 (no se combinan todas las columnas)
New <- original[original$Compound%in%filtrado$Compound,]

#Otra forma de hacerlo
linesincommon <- intersect(filtrado$Compound, original$V2)
Final <- original[original$V2%in%linesincommon,]

#Comprobar duplicados
nrow(filtrado[duplicated(filtrado$Compound), ])
nrow(original[duplicated(original$Compound), ])
