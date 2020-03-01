# 3. faza: Vizualizacija podatkov

source("uvoz/projekt_uvoz.r")

# Uvozimo zemljevid.
zemljevid <- uvozi.zemljevid("http://baza.fmf.uni-lj.si/OB.zip", "OB", pot.zemljevida="OB", encoding="Windows-1250")
levels(zemljevid$OB_UIME) <- levels(zemljevid$OB_UIME) %>% { gsub("-", " - ", .) }
zemljevid$OB_UIME <- factor(zemljevid$OB_UIME, levels=levels(obcine$obcina))
zemljevid <- fortify(zemljevid)


#ločimo podatke za Slovenijo in Hrvaško
slo_nocitve <- nocitve %>% filter(drzava == "Slovenia")
slo_nocitve$drzava <- NULL
hrv_nocitve <- nocitve %>% filter(drzava == "Croatia")
hrv_nocitve$drzava <- NULL
slo_potovanja <- potovanja %>% filter(drzava == "Slovenia")
slo_potovanja$drzava <- NULL
hrv_potovanja <- potovanja %>% filter(drzava == "Croatia")
hrv_potovanja$drzava <- NULL
slo_nocitve_brez <- slo_nocitve %>% filter(izvor_turistov != "Evropa", izvor_turistov != "vse drzave sveta")
hrv_nocitve_brez <- hrv_nocitve %>% filter(izvor_turistov != "Evropa", izvor_turistov != "vse drzave sveta")


#vsa potovanja
vsa_slo_potovanja <- slo_potovanja %>% group_by(leto) %>% summarise(stevilo = sum(vrednost, na.rm = TRUE))
vsa_slo_potovanja$namen <- NULL
vsa_hrv_potovanja <- hrv_potovanja %>% group_by(leto) %>% summarise(stevilo = sum(vrednost, na.rm = TRUE))
vsa_hrv_potovanja$namen <- NULL
vsa_potovanja <- vsa_slo_potovanja
names(vsa_potovanja)[2] <- 'stevilo_slo'
vsa_potovanja['stevilo_hrv'] <- NA
vsa_potovanja$stevilo_hrv <- vsa_hrv_potovanja$stevilo


#vsa potovanja na prebivalce
prebivalci_slo <- 2089310
prebivalci_hrv <- 4105493
vsa_potovanja_na_prebivalce <- vsa_potovanja
vsa_potovanja_na_prebivalce$stevilo_slo <- (vsa_potovanja$stevilo_slo) / prebivalci_slo
vsa_potovanja_na_prebivalce$stevilo_hrv <- (vsa_potovanja$stevilo_hrv) / prebivalci_hrv


#vse nočitve
vse_slo_nocitve <- slo_nocitve %>% group_by(leto) %>% summarise(stevilo = sum(vrednost, na.rm = TRUE))
vse_slo_nocitve$prebivalisce <- NULL
vse_hrv_nocitve <- hrv_nocitve %>% group_by(leto) %>% summarise(stevilo = sum(vrednost, na.rm = TRUE))
vse_hrv_nocitve$prebivalisce <- NULL
vse_nocitve <- vse_slo_nocitve
names(vse_nocitve)[2] <- 'stevilo_slo'
vse_nocitve['stevilo_hrv'] <- NA
vse_nocitve$stevilo_hrv <- vse_hrv_nocitve$stevilo


#vse nočitve na površino
povrsina_slo <- 20273
povrsina_hrv <- 56542
vse_nocitve_na_povrsino <- vse_nocitve
vse_nocitve_na_povrsino$stevilo_slo <- (vse_nocitve$stevilo_slo) / povrsina_slo
vse_nocitve_na_povrsino$stevilo_hrv <- (vse_nocitve$stevilo_hrv) / povrsina_hrv


#potovanja v vse države skupaj
slo_potovanja_vse_drzave <- slo_potovanja %>% filter(destinacija == 'All countries of the world')
slo_potovanja_vse_drzave$destinacija <- NULL
hrv_potovanja_vse_drzave <- hrv_potovanja %>% filter(destinacija == 'All countries of the world')
hrv_potovanja_vse_drzave$destinacija <- NULL