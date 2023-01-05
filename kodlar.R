install.packages("ggplot2")
install.packages("tidyverse")
install.packages("thematic")
install.packages("shiny")
install.packages("rmarkdown")
install.packages("showtext")
install.packages("ragg")
install.packages("bslib")
install.packages("dplyr")
install.packages("gridExtra")
install.packages("reshape2")
library(reshape2)
library(dplyr)
library(gridExtra)
library(bslib)
library(ragg)
library(showtext)
library(ggplot2)
library(tidyverse)
library(thematic)
library(shiny)
library(rmarkdown)





#Steam'ın yıllık ortalama oyuncu sayısı grafiğini görselleştirirken;
#https://backlinko.com/steam-users (kaynak)
#Verilerle bir data set oluşturdum.
yil = c(2007,2008,2009,2010,2011,2012,2013,2014,2015,2016,2017,2018,2019,2020,2021)
sayi = c(0.28,0.62,1.5,2.5,3.17,4.67,5.79,6.92,8.58,11.35,12.25,16.45,14.8,23.96,25.65)
steamyillik = data.frame(yil,sayi)

#thematic paketi ile kendime koyu ve pembe temayı seçtim.
thematic_on(bg = "#222222", fg = "gray100", accent = "#0CE3AC", font = "gray100")


#steamyillik data setini grafiğe döküp etiket isimlerini belirledim ve
#her bir yılı tek tek barın altında gösteresi için yıl değişkenini factor olarak atadım.
ggplot(steamyillik,aes(x=factor(yil), y=sayi))+
  geom_bar(stat = "identity",position = "dodge",just = 0.5)+
  geom_text(aes(label=sayi),vjust = -1,position = position_dodge(0.9), colour = "gray100")+
  labs(x = "Yıl",
       y = "Kullanıcı sayisi (Milyon)",
       title = "Steam'ın Yıllık Ortalama Oyuncu Sayısı(Çevrimiçi)")+
  scale_x_discrete()


---------------------------------------------------------------------------------------------------
  
  twtop5oyun = twitch %>%
  filter(Game %in% c("League of Legends","Counter-Strike: Global Offensive","Dota 2","Minecraft","VALORANT"))

yilizlenme = twtop5oyun %>%
  drop_na() %>%
  group_by(Year,Game) %>%
  summarise(ortizlenme = mean(Hours_watched))
thematic_on(bg = "#222222", fg ="violetred1", accent = "#0CE3AC", font = "deeppink")
thematic_shiny(bg = "#222222", fg ="gray100", accent = "#0CE3AC", font = "deeppink")


g1 = ggplot(yilizlenme, aes(x=Year,y=ortizlenme, colour=Game))+
  geom_point()+
  geom_line()+
  scale_y_continuous(labels = scales::comma)+
  labs(x="Yıl",y="Ortalama İzlenme sayısı",title="Twitch'te Yıllara Göre Oyunların İzlenme Sayısı")

yayinciizlenme = twtop5oyun %>%
  drop_na() %>%
  group_by(Year) %>%
  summarise(ortyayincisayi = mean(Peak_channels))

g2 = ggplot(yayinciizlenme,aes(x=Year,y=ortyayincisayi))+
  geom_point()+
  geom_line()+
  labs(x="Yıl",y="Yayıncı Sayısı",title="Twitch'te Yıllara Göre Yayıncı Sayısı")


grid.arrange(
  g1,
  g2
  
)
----------------------------------------------------------------------------------------
  
  vgsales1 = vgsales %>%
  select(Year, NA_Sales, EU_Sales, JP_Sales, Global_Sales)%>%
  melt(id.vars = "Year")%>%
  group_by(Year, variable) %>% 
  summarise(total.sales = sum(value))

levels(vgsales1$variable) = c("Kuzey Amerika", "Avrupa", "Japonya", "Küresel")
ggplot(vgsales1, aes(x = Year, y = total.sales, color = variable, group = variable)) +
  geom_point() + 
  geom_line() + 
  labs(x = "Oyunların Yayınlanma Yılı", y = "Toplam satış (Milyon)", color = "Bölgeler",title = "Oyunların Yayın Tarihine göre Satış Sayısı") +
  theme(axis.text.x = element_text(angle = 90),
        panel.background = element_rect(),
        panel.grid.major = element_blank(),
        panel.grid.minor = element_blank())

thematic_on(bg = "gray100", fg ="navyblue", accent = "#222222", font = "")






vgsales %>%
  group_by(Year) %>%
  summarize(Number_of_Games = n()) %>%
  ggplot(aes(x = Year, y = Number_of_Games)) +
  geom_col() +
  theme(axis.text.x = element_text(angle = 90)) +
  labs(title = "Yıllara Göre Yayınlanan oyun sayısı", x = "Yayınlanan Yıl", y = "Satış sayısı")
