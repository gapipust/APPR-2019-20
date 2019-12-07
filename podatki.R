library(readr)
podatki_o_nocitvah <- read_csv('tour_occ_ninraw_1_Data.csv',col_names=c('Leto', 'Izvor_turistov', 'Enote', 'Prebivališče', 'Država', 'Vrednost', 'Zastava'),
                               skip=1, na=':', locale=locale(encoding='Windows-1250'))
#podatki_o_potovanjih <- read_csv('tour_dem_ttw_1_Data.csv', col_names=c('Leto', 'Destinacija', 'Enote', 'Namen', 'Dolžina', 'Država', 'Vrednost', 'Zastava'),
#                                 skip=1, na=':', locale=locale(encoding='Windows-1250'))
podatki_o_nocitvah$Enote <- NULL
podatki_o_nocitvah$Zastava <- NULL
#podatki_o_potovanjih$Enote <- NULL
#podatki_o_potovanjih$Zastava <- NULL

library(tidyr)
#izvor <- gather(podatki_o_nocitvah, -leto, -enote, -prebivališče, -država, -zastava, -izvor_turistov, key=leto, value=vrednost, na.rm=TRUE)