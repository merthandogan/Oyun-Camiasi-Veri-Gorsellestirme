#Oyun Camiası Nereye Gidiyor Veri Görselleştirmesi

## ÖZET

Geçmişten günümüze kadar pek çok oyun geldi,geçti ve çıkıyor fakat oyun camiası nereye gidiyor?
Giderek büyüyen bir sektör mü yoksa gerileyen bir sektör mü ? Bu soruların cevabını bulmak için
hazırlanmış bir projedir. Bu projeyi hazırlarken Statix'in videyo oyunlar satış veri setini,
Steamın anlık oyuncu sayısı ve Twitch.tv'nin izlenme sayıları kullanılmıştır.


## Kullanılan veri setleri

*İlk olarak Video oyunları satış veri setine [buradan](https://www.kaggle.com/datasets/gregorut/videogamesales) ulaşabilirsiniz.
*Bu veri setinde video oyunlarının yıllara göre satış, tür, platform ve yayımcı firma gibi çok çeşitli ve kapsamlı bir veri setidir.

*İkinci olarak Steam'ın anlık oyuncu sayısını gösteren ve yıllara göre kategörize eden veri setine [buradan](https://backlinko.com/steam-users)
ulaşabilirsiniz.

*Üçüncü olarak ise canlı yayın platformu olan Twitch.tv'in yıllara göre izleyici ve yayıncı sayısını gösteren veri setine [buradan](https://www.kaggle.com/code/suvojithaldar/analyzing-top-games-and-categories-on-twitch-2016) ulaşabilirsiniz.


## Çalışmanın Amacı

*Bu çalışmanın amacı; Gitgide gelişen teklonoji ve yazılım dilleri sayesinde geliştirilen ve yayınlanan oyunların ne derece rağbet gördüğünü görselleştirmek.

*Giderek artan oyuncu ve oyun sayısının eğlenceden çok bir iş sektörü haline gelmesini açıklamak.

*İnsanların eğlenmek ve zaman geçirmek için gerçek hayat yerine sanal dünyayı tercih ettiğini göstermek.

##Kullanılan Program ve Paket Programlar.

*Bu çalışma yapılırken R programlama dili kullanılmış ve paket program olarak;

*ggplot2: Grafik oluşturmaya ve düzenlemeye yarar.

*tidyverse: Veri setinde çeşitli manipülasyonlar yaparak veriyi kullanışlı haline getirir.

*thematic: Oluşturulan grafiklerini temasını ve rengini belirlemeye yarar. Bu paket içerisinde showtext, ragg, bslib yer almaktadır.

*Dplyr: Veri işlemeyi ve veri analizi sürecini kolaylaştıran ve en çok kullanılan paketlerden birisidir.

*gridExtra: Grafikleri ayrı ayrı ve yan yana göstermeye yarar.

*reshape2: veri setindeki sütünları ve satırları düzenlemeye yarar.

## Oyunların Satış Tarihine Göre Satış Fiyatı

![gq1]("C:\Users\merth\Desktop\gq1.png")






