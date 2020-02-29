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
nocitve$izvor_turistov[nocitve$izvor_turistov == "Europe"] <- "Evropa"
nocitve$izvor_turistov[nocitve$izvor_turistov == "Germany (until 1990 former territory of the FRG)"] <- "Nemcija"
nocitve$izvor_turistov[nocitve$izvor_turistov == "Spain"] <- "Spanija"
nocitve$izvor_turistov[nocitve$izvor_turistov == "France"] <- "Francija"
nocitve$izvor_turistov[nocitve$izvor_turistov == "Croatia"] <- "Hrvaska"
nocitve$izvor_turistov[nocitve$izvor_turistov == "Italy"] <- "Italija"
nocitve$izvor_turistov[nocitve$izvor_turistov == "Austria"] <- "Avstrija"
nocitve$izvor_turistov[nocitve$izvor_turistov == "Slovenia"] <- "Slovenija"
nocitve$izvor_turistov[nocitve$izvor_turistov == "United Kingdom"] <- "Zdruzeno Kraljestvo"
nocitve$izvor_turistov[nocitve$izvor_turistov == "America"] <- "Amerika"
nocitve$izvor_turistov[nocitve$izvor_turistov == "Asia"] <- "Azija"
nocitve$izvor_turistov[nocitve$izvor_turistov == "All countries of the world"] <- "vse drzave sveta"
nocitve$prebivalisce[nocitve$prebivalisce == "Hotels and similar accommodation"] <- "hoteli in podobne nastanitve"
nocitve$prebivalisce[nocitve$prebivalisce == "Camping grounds, recreational vehicle parks and trailer parks"] <- "kampi in prikolicarska naselja"

uvozi.potovanja <- function() {
  podatki_o_potovanjih <- read_csv('podatki/tour_dem_ttw_1_Data.csv', col_names=c('leto', 'destinacija', 'enote', 'namen', 'dolzina', 'drzava', 'vrednost', 'zastava'),
                                   skip=1, na=':', locale=locale(encoding='Windows-1250'))
  podatki_o_potovanjih$enote <- NULL
  podatki_o_potovanjih$zastava <- NULL
  
  return(podatki_o_potovanjih)
}

potovanja <- uvozi.potovanja()
potovanja <- potovanja %>% filter(namen != "Total")
potovanja$namen[potovanja$namen == "Personal reasons"] <- "osebni razlogi"
potovanja$namen[potovanja$namen == "Professional, business"] <- "poslovni razlogi"
potovanja$dolzina[potovanja$dolzina == "1 night or over"] <- "1 noc ali vec"
potovanja$dolzina[potovanja$dolzina == "From 1 to 3 nights"] <- "1 do 3 noci"
potovanja$dolzina[potovanja$dolzina == "4 nights or over"] <- "4 noci ali vec"

uvozi.obcine <- function() {
  podatki_o_obcinah <- read.csv('podatki/obcine.csv',col.names=c('obcina', 'izvor', 'stevilo.nocitev'),
                                skip=1, na=c('z', '-'))
  podatki_o_obcinah$izvor <- NULL
  
  return(podatki_o_obcinah)
}

obcine <- uvozi.obcine()