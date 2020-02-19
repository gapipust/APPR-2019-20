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
