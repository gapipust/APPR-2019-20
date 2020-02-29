# 4. faza: Analiza podatkov

source("vizualizacija/projekt_vizualizacija.r")

#grafi
graf1 <- ggplot(vse_nocitve, aes(x=leto)) + geom_point(aes(y=stevilo_slo, colour="Slovenija")) +  geom_line(aes(y=stevilo_slo, colour="Slovenija")) + 
  geom_point(aes(y=stevilo_hrv, colour="Hrvaška")) + geom_line(aes(y=stevilo_hrv, colour="Hrvaška")) + 
  scale_colour_manual("", values = c("Slovenija" = "blue", "Hrvaška" = "red")) + ylab('število nocitev') + ggtitle('Vse nočitve')

graf2 <- ggplot(vsa_potovanja, aes(x=leto)) + geom_point(aes(y=stevilo_slo, colour="Slovenija")) + geom_line(aes(y=stevilo_slo, colour="Slovenija")) + 
  geom_point(aes(y=stevilo_hrv, colour="Hrvaška")) + geom_line(aes(y=stevilo_hrv, colour="Hrvaška")) + 
  scale_colour_manual("", values = c("Slovenija" = "blue", "Hrvaška" = "red")) + ylab('število potovanj') + ggtitle('Vsa potovanja')

graf3 <- ggplot(vse_nocitve_na_povrsino, aes(x=leto)) + geom_point(aes(y=stevilo_slo, colour="Slovenija")) + geom_line(aes(y=stevilo_slo, colour="Slovenija")) + 
  geom_point(aes(y=stevilo_hrv, colour="Hrvaška")) + geom_line(aes(y=stevilo_hrv, colour="Hrvaška")) + 
  scale_colour_manual("", values = c("Slovenija" = "blue", "Hrvaška" = "red")) + ylab('število nočitev na km^2') + ggtitle('Vse nočitve na površino')

graf4 <- ggplot(vsa_potovanja_na_prebivalce, aes(x=leto)) + geom_point(aes(y=stevilo_slo, colour="Slovenija")) + geom_line(aes(y=stevilo_slo, colour="Slovenija")) + 
  geom_point(aes(y=stevilo_hrv, colour="Hrvaška")) + geom_line(aes(y=stevilo_hrv, colour="Hrvaška")) + 
  scale_colour_manual("", values = c("Slovenija" = "blue", "Hrvaška" = "red")) + ylab('število potovanj na prebivalca') + ggtitle('Vsa potovanja na prebivalstvo')

graf5 <- ggplot(slo_nocitve, aes(x=leto)) + aes(y=vrednost, color=izvor_turistov, shape=prebivalisce) + geom_point() + geom_line() + 
  ggtitle('Sestava turistov v Sloveniji') + ylab('število turistov') + theme(legend.position="bottom", legend.box = "vertical")

graf5a <- ggplot(slo_nocitve_brez, aes(x=leto)) + aes(y=vrednost, color=izvor_turistov, shape=prebivalisce) + geom_point() + geom_line() + 
  ggtitle('Sestava turistov v Sloveniji (brez vseh držav in brez Evrope)') + ylab('število turistov') + theme(legend.position="bottom", legend.box = "vertical")

graf6 <- ggplot(hrv_nocitve, aes(x=leto)) + aes(y=vrednost, color=izvor_turistov, shape=prebivalisce) + geom_point() + geom_line() + 
  ggtitle('Sestava turistov na Hrvaškem') + ylab('število turistov') + theme(legend.position="bottom", legend.box = "vertical")

graf6a <- ggplot(hrv_nocitve_brez, aes(x=leto)) + aes(y=vrednost, color=izvor_turistov, shape=prebivalisce) + geom_point() + geom_line() + 
  ggtitle('Sestava turistov na Hrvaškem (brez vseh držav in brez Evrope)') + ylab('število turistov') + theme(legend.position="bottom", legend.box = "vertical")

graf7 <- ggplot(slo_potovanja_vse_drzave, aes(x=leto)) + aes(y=vrednost, color=dolzina, shape=namen) + geom_point() + geom_line() + 
  ggtitle('Dolžina in namen potovanja Slovencev') + ylab('število turistov') + theme(legend.position="bottom", legend.box = "vertical")

graf8 <- ggplot(hrv_potovanja_vse_drzave, aes(x=leto)) + aes(y=vrednost, color=dolzina, shape=namen) + geom_point() + geom_line() + 
  ggtitle('Dolžina in namen potovanja Hrvatov') + ylab('število turistov') + theme(legend.position="bottom", legend.box = "vertical")

#napredna analiza (napovedi)
vse_slo_nocitve1 <- vse_slo_nocitve %>% filter(leto != "2018")
lin <- lm(data=vse_slo_nocitve1, stevilo ~ leto)
pr <- predict(lin, data.frame(leto=seq.int(2018, 2025, 1)))
vse_slo_nocitve_pr <- vse_slo_nocitve1
vse_slo_nocitve_pr <- data.frame(leto = c(2018, 2019, 2020, 2021, 2022, 2023, 2024, 2025), stevilo = c(pr[1], pr[2], pr[3], pr[4], pr[5], pr[6], pr[7], pr[8]))
vse_slo_nocitve1 <- rbind(vse_slo_nocitve1, vse_slo_nocitve_pr)

vse_hrv_nocitve1 <- vse_hrv_nocitve
lin1 <- lm(data=vse_hrv_nocitve1, stevilo ~ leto)
pr1 <- predict(lin1, data.frame(leto=seq.int(2019, 2025, 1)))
vse_hrv_nocitve_pr <- vse_hrv_nocitve1
vse_hrv_nocitve_pr <- data.frame(leto = c(2019, 2020, 2021, 2022, 2023, 2024, 2025), stevilo = c(pr1[1], pr1[2], pr1[3], pr1[4], pr1[5], pr1[6], pr1[7]))
vse_hrv_nocitve1 <- rbind(vse_hrv_nocitve1, vse_hrv_nocitve_pr)

vse_nocitve1 <- vse_slo_nocitve1
names(vse_nocitve1)[2] <- 'stevilo_slo'
vse_nocitve1['stevilo_hrv'] <- NA
vse_nocitve1$stevilo_hrv <- vse_hrv_nocitve1$stevilo
vse_nocitve1 <- vse_nocitve1 %>% filter(leto != 2010, leto != 2011, leto != 2012, leto != 2013, leto != 2014, leto != 2015)

graf9 <- ggplot(vse_nocitve1, aes(x=leto)) + geom_point(aes(y=stevilo_slo, colour="Slovenija")) + geom_line(aes(y=stevilo_slo, colour="Slovenija")) + 
  geom_point(aes(y=stevilo_hrv, colour="Hrvaška")) + geom_line(aes(y=stevilo_hrv, colour="Hrvaška")) + 
  scale_colour_manual("", values = c("Slovenija" = "blue", "Hrvaška" = "red")) + ylab('predvideno število nocitev v prihodnosti') + 
  ggtitle('Napoved vseh nočitev za prihodnost') + scale_x_continuous(breaks = 1*2016:2025)

vsa_slo_potovanja1 <- vsa_slo_potovanja
lin2 <- lm(data=vsa_slo_potovanja, stevilo ~ leto)
pr2 <- predict(lin2, data.frame(leto=seq.int(2019, 2025, 1)))
vsa_slo_potovanja_pr <- vsa_slo_potovanja1
vsa_slo_potovanja_pr <- data.frame(leto = c(2019, 2020, 2021, 2022, 2023, 2024, 2025), stevilo = c(pr2[1], pr2[2], pr2[3], pr2[4], pr2[5], pr2[6], pr2[7]))
vsa_slo_potovanja1 <- rbind(vsa_slo_potovanja1, vsa_slo_potovanja_pr)

vsa_hrv_potovanja1 <- vsa_hrv_potovanja
lin3 <- lm(data=vsa_hrv_potovanja, stevilo ~ leto)
pr3 <- predict(lin3, data.frame(leto=seq.int(2019, 2025, 1)))
vsa_hrv_potovanja_pr <- vsa_hrv_potovanja1
vsa_hrv_potovanja_pr <- data.frame(leto = c(2019, 2020, 2021, 2022, 2023, 2024, 2025), stevilo = c(pr3[1], pr3[2], pr3[3], pr3[4], pr3[5], pr3[6], pr3[7]))
vsa_hrv_potovanja1 <- rbind(vsa_hrv_potovanja1, vsa_hrv_potovanja_pr)

vsa_potovanja1 <- vsa_slo_potovanja1
names(vsa_potovanja1)[2] <- 'stevilo_slo'
vsa_potovanja1['stevilo_hrv'] <- NA
vsa_potovanja1$stevilo_hrv <- vsa_hrv_potovanja1$stevilo
vsa_potovanja1 <- vsa_potovanja1 %>% filter(leto != 2010, leto != 2011, leto != 2012, leto != 2013, leto != 2014, leto != 2015)

graf10 <- ggplot(vsa_potovanja1, aes(x=leto)) + geom_point(aes(y=stevilo_slo, colour="Slovenija")) +  geom_line(aes(y=stevilo_slo, colour="Slovenija")) + 
  geom_point(aes(y=stevilo_hrv, colour="Hrvaška")) + geom_line(aes(y=stevilo_hrv, colour="Hrvaška")) + 
  scale_colour_manual("", values = c("Slovenija" = "blue", "Hrvaška" = "red")) + ylab('predvideno število potovanj v prihodnosti') + 
  ggtitle('Napoved vseh potovanj za prihodnost') + scale_x_continuous(breaks = 1*2016:2025)