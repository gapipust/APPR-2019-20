# 4. faza: Analiza podatkov

source("vizualizacija/projekt_vizualizacija.r")

graf1 <- ggplot(vse_nocitve, aes(x=leto)) + geom_point(aes(y=stevilo_slo), color='blue') + 
  geom_line(aes(y=stevilo_slo), color='blue') + geom_point(aes(y=stevilo_hrv), color='red') + 
  geom_line(aes(y=stevilo_hrv), color='red') + ylab('stevilo nocitev') + ggtitle('vse nocitve')

graf2 <- ggplot(vsa_potovanja, aes(x=leto)) + geom_point(aes(y=stevilo_slo), color='blue') + 
  geom_line(aes(y=stevilo_slo), color='blue') + geom_point(aes(y=stevilo_hrv), color='red') + 
  geom_line(aes(y=stevilo_hrv), color='red') + ylab('stevilo potovanj') + ggtitle('vsa potovanja')

graf3 <- ggplot(vse_nocitve_na_povrsino, aes(x=leto)) + geom_point(aes(y=stevilo_slo), color='blue') + 
  geom_line(aes(y=stevilo_slo), color='blue') + geom_point(aes(y=stevilo_hrv), color='red') + 
  geom_line(aes(y=stevilo_hrv), color='red') + ylab('stevilo nocitev na km^2') + ggtitle('vse nocitve na povrsino')

graf4 <- ggplot(vsa_potovanja_na_prebivalce, aes(x=leto)) + geom_point(aes(y=stevilo_slo), color='blue') + 
  geom_line(aes(y=stevilo_slo), color='blue') + geom_point(aes(y=stevilo_hrv), color='red') + 
  geom_line(aes(y=stevilo_hrv), color='red') + ylab('stevilo potovanj na prebivalca') + ggtitle('vsa potovanja na prebivalstvo')

graf5 <- ggplot(slo_nocitve, aes(x=leto)) + aes(y=vrednost, color=izvor_turistov, shape=prebivalisce) + geom_point() + geom_line() + 
  ggtitle('sestava turistov v Sloveniji') + ylab('stevilo turistov')
graf6 <- ggplot(hrv_nocitve, aes(x=leto)) + aes(y=vrednost, color=izvor_turistov, shape=prebivalisce) + geom_point() + geom_line() + 
  ggtitle('sestava turistov na Hrvaskem') + ylab('stevilo turistov')

graf7 <- ggplot(slo_potovanja_vse_drzave, aes(x=leto)) + aes(y=vrednost, color=dolzina, shape=namen) + geom_point() + geom_line() + 
  ggtitle('dolzina in namen potovanja Slovencev') + ylab('stevilo turistov')
graf8 <- ggplot(hrv_potovanja_vse_drzave, aes(x=leto)) + aes(y=vrednost, color=dolzina, shape=namen) + geom_point() + geom_line() + 
  ggtitle('dolzina in namen potovanja Hrvatov') + ylab('stevilo turistov')