#2. faza: uvoz podatkov:

source("lib/libraries.r", encoding="UTF-8")

uvozi.nocitve <- function() {
  podatki_o_nocitvah <- read_csv('podatki/tour_occ_ninraw_1_Data.csv',col_names=c('leto', 'izvor_turistov', 'enote', 'prebivalisce', 'drzava', 'vrednost', 'zastava'),
                                 skip=1, na=':', locale=locale(encoding='Windows-1250'))
  podatki_o_nocitvah$enote <- NULL
  podatki_o_nocitvah$zastava <- NULL
  
  return(podatki_o_nocitvah)
}

nocitve <- uvozi.nocitve()
nocitve <- nocitve %>% filter(prebivalisce != "Hotels; holiday and other short-stay accommodation; camping grounds, recreational vehicle parks and trailer parks")

uvozi.potovanja <- function() {
  podatki_o_potovanjih <- read_csv('podatki/tour_dem_ttw_1_Data.csv', col_names=c('leto', 'destinacija', 'enote', 'namen', 'dolzina', 'drzava', 'vrednost', 'zastava'),
                                   skip=1, na=':', locale=locale(encoding='Windows-1250'))
  podatki_o_potovanjih$enote <- NULL
  podatki_o_potovanjih$zastava <- NULL
  
  return(podatki_o_potovanjih)
}

potovanja <- uvozi.potovanja()
potovanja <- potovanja %>% filter(namen != "Total")
