# 3. faza: Vizualizacija podatkov

source("uvoz/projekt_uvoz.r")

# Uvozimo zemljevid.
#zemljevid <- uvozi.zemljevid("http://baza.fmf.uni-lj.si/OB.zip", "OB",
#                             pot.zemljevida="OB", encoding="Windows-1250")
#levels(zemljevid$OB_UIME) <- levels(zemljevid$OB_UIME) %>%
#  { gsub("Slovenskih", "Slov.", .) } %>% { gsub("-", " - ", .) }
#zemljevid$OB_UIME <- factor(zemljevid$OB_UIME, levels=levels(obcine$obcina))
#zemljevid <- fortify(zemljevid)

# Izračunamo povprečno velikost družine
#povprecja <- druzine %>% group_by(obcina) %>%
#  summarise(povprecje=sum(velikost.druzine * stevilo.druzin) / sum(stevilo.druzin))

#ločil bom podatke za Slovenijo in Hrvaško
slo_nocitve <- nocitve %>% filter(drzava == "Slovenia")
slo_nocitve$drzava <- NULL
hrv_nocitve <- nocitve %>% filter(drzava == "Croatia")
hrv_nocitve$drzava <- NULL
slo_potovanja <- potovanja %>% filter(drzava == "Slovenia")
slo_potovanja$drzava <- NULL
hrv_potovanja <- potovanja %>% filter(drzava == "Croatia")
hrv_potovanja$drzava <- NULL

vsa_slo_potovanja <- slo_potovanja %>% group_by(leto) %>% summarise(stevilo = sum(vrednost, na.rm = TRUE))
vsa_slo_potovanja$namen <- NULL
vsa_hrv_potovanja <- hrv_potovanja %>% group_by(leto) %>% summarise(stevilo = sum(vrednost, na.rm = TRUE))
vsa_hrv_potovanja$namen <- NULL

vse_slo_nocitve <- slo_nocitve %>% group_by(leto) %>% summarise(stevilo = sum(vrednost, na.rm = TRUE))
vse_slo_nocitve$prebivalisce <- NULL
vse_hrv_nocitve <- hrv_nocitve %>% group_by(leto) %>% summarise(stevilo = sum(vrednost, na.rm = TRUE))
vse_hrv_nocitve$prebivalisce <- NULL
