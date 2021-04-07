library(dplyr)
setwd("C:/Users/34686/Desktop/TFM_R")
getwd()

filtrado <- read.csv("PlantCyc_Mol2_4ccas_MF.csv",sep=",",stringsAsFactors = T)
original <- read.csv("PlantCyc_Original_sinduplicados.txt",sep="\t",stringsAsFactors = T)

Originalnew <- original %>%
                        group_by(Compound_id) %>%
                        slice(1)

Filtradonew <- filtrado %>%
                        group_by(header) %>%
                        slice(1)

New <- original[original$Compound_id%in%Filtradonew$header,]
New2 <- New %>%
            group_by(Compound_id) %>%
            slice(1)


linesincommon <- intersect(Filtradonew$header, Originalnew$Compound_id)
Final <- Originalnew[Originalnew$Compound_id%in%linesincommon,]

write.csv(New, file="Results_common_PlantCyc_Mol2_4ccas.csv")

nrow(Originalnew[duplicated(Originalnew$Compound_id), ])
nrow(Filtradonew[duplicated(Filtradonew$header), ])
