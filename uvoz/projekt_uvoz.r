#2. faza: uvoz podatkov:

library(tidyr)

uvozi.nocitve <- function() {
  podatki_o_nocitvah <- read_csv('tour_occ_ninraw_1_Data.csv',col_names=c('leto', 'izvor_turistov', 'enote', 'prebivalisce', 'drzava', 'vrednost', 'zastava'),
                                 skip=1, na=':', locale=locale(encoding='Windows-1250'))
  podatki_o_nocitvah$enote <- NULL
  podatki_o_nocitvah$zastava <- NULL
  
  #ločil bom podatke za Slovenijo in Hrvaško
  slo_nocitve <- podatki_o_nocitvah %>% filter(drzava == "Slovenia")
  slo_nocitve$drzava <- NULL
  
  hrv_nocitve <- podatki_o_nocitvah %>% filter(drzava == "Croatia")
  hrv_nocitve$drzava <- NULL
  
  return(slo_nocitve, hrv_nocitve)
}

uvozi.potovanja <- function() {
  podatki_o_potovanjih <- read_csv('tour_dem_ttw_1_Data.csv', col_names=c('leto', 'destinacija', 'enote', 'namen', 'dolzina', 'drzava', 'vrednost', 'zastava'),
                                   skip=1, na=':', locale=locale(encoding='Windows-1250'))
  podatki_o_potovanjih$enote <- NULL
  podatki_o_potovanjih$zastava <- NULL
  
  #ločil bom podatke za Slovenijo in Hrvaško
  slo_potovanja <- podatki_o_potovanjih %>% filter(drzava == "Slovenia")
  slo_potovanja$drzava <- NULL
  
  hrv_potovanja <- podatki_o_potovanjih %>% filter(drzava == "Croatia")
  hrv_potovanja$drzava <- NULL
  
  return(slo_potovanja, hrv_potovanja)
}

#vsa_slo_potovanja <- slo_potovanja %>% filter(namen == "Total")

#slo_stevilo_vseh <- vsa_slo_potovanja %>% group_by(leto) %>% summarise(stevilo = sum(vrednost, na.rm = TRUE))
#stevilo <- podatki_o_nocitvah %>% group_by(leto) %>% summarise(stevilo = sum(vrednost, na.rm = TRUE))