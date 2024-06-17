# Erciyes Üniversitesi - Mobile Application Development Dersi Final Projesi - Erciyes University - Mobile Application Development Course Final Project

## #EN

## Information

- **University Name:** Erciyes University
- **Advisor:** Dr. Fehim KÖYLÜ
-   **Student Name:** Mustafa Ata Sağlamoğlu
-   **School ID:** 1030521124
-   **E-Mail Address:** ata502035@gmail.com or 10305221124@erciyes.edu.tr

## Introduction
This application is a mobile news reading application developed for the course **BS 438 - Mobile Application Development** at **Erciyes University** under the supervision of **Dr. Fehim KÖYLÜ**. The coded application is a tech related news reading application. The resources used during the development of the project are listed below:

> Flutter 3.22.2  
> Dart 3.4.3  
> DevTools 2.34.3  
> Visual Studio Code 1.90.0  
> Android Studio Jellyfish (Virtual Machine)  
> newsapi.org  
> [https://javiercbk.github.io/json_to_dart/](https://javiercbk.github.io/json_to_dart/)  
> [https://web.postman.co/](https://web.postman.co/)  
> cupertino_icons 1.0.6  
> google_fonts 6.2.1  
> flutter_spinkit 5.2.1  
> http 1.2.1  
> intl 0.19.0  
> cached_network_image

## Application Content and Features

-   The coded application is a **technology related news reading application**.
-   The application consists of **two pages**.
-   The first page allows users to switch between 5 different technology categories of **news sources** and **view the news from that source in real-time**.
-   At the top, there are **scrollable** headlines.
-   The lower part of the page contains **other news** that continue scrolling downwards.
-   The **"Haber Kaynakları"** button at the top right of the application can be used to switch between the selected sources.
-   The news from the selected sources are listed on that screen.
-   On the top left of the same page, there is a **"Categories"** button, which directs to **the second page of the application**.
-   On the second page of the application, news from various categories (Technology, Science, General, Entertainment, Health, Sports, Business...) can be viewed **regardless of the sources**.
-   On both screens, brief information such as the **image, headline, date written, and source** of the news is provided.
-   Clicking on the news allows users to **read more details** about the news.

## Methodology and Working Principle

-   Initially, the project to be implemented and its scope were decided.
-   A requirements analysis was conducted to determine the scope of the project and the necessary resources, and the project was started in light of these resources.
-   Since the project was determined to be a **"Technological news reading application"**, an **API** (Application Programming Interface) was searched for that could retrieve these news articles in real-time, and the API prepared by **newsapi.org** was chosen.
-   Then, an **API key** was obtained from the site to be used in the queries for this chosen API.
-   With this key and the API documentation, information about the **endpoints** was determined.
-   **HTTP requests** were sent to these endpoints using **[https://web.postman.co](https://web.postman.co)**.
-   The structure of the responses returned in **JSON format**, their **keys, and values** were examined.
-   Subsequently, a **model structure** was created that would be suitable for processing the keys and the dependencies between the data in **Flutter**.
-   To create this model structure, the project **[https://javiercbk.github.io/json_to_dart/](https://javiercbk.github.io/json_to_dart/)** was used. This project **reads** the JSON data and converts it into **DART variables and classes**, thus **facilitating** data processing.
-   The data models, ready for processing, were then transferred to the project.
-   API calls were made, and the data returned in JSON format was processed asynchronously using these models.
-   Then, the collective display of these data was provided with **ListView**.
-   The elements of the data were individually placed into structures like **SizedBox** and **Container**, necessary font, size, and style adjustments were made, and these structures were embedded in various places.
-   These boxes were then designed to create an aesthetically pleasing appearance.
-   **SpinKit**, a loading screen provided by **Flutter**'s **pub.dev** package provider, was used to manage data loading between screens.
-   **Google Fonts** and **Cupertino Icons** packages were integrated into the project to provide visual support where necessary.
-   Visual processes were handled using the **Cached Network Image** package.
-   The **http** package was used to handle HTTP requests (only the GET method was used) and receive responses.
-   The **intl** package was used for date formatting.
-   The remaining processes are functions that are ready within Flutter and **do not require additional packages**.

## #TR

## Bilgi

- **Üniversite Adı:** Erciyes Üniversitesi
- **Danışman:** Dr. Fehim KÖYLÜ
-   **Öğrenci Adı-Soyadı:** Mustafa Ata Sağlamoğlu
-   **Okul Numarası:** 1030521124
-   **E-Posta Adresi:** ata502035@gmail.com veya 10305221124@erciyes.edu.tr

## Giriş

Bu uygulama, **Erciyes Üniversitesi** bünyesinde verilen **BS 438 - Mobile Application Development** dersi için **Dr. Öğr. Üyesi Fehim KÖYLÜ** danışmanlığında geliştirilmiş bir mobil uygulamadır.
Kodlanmış uygulama, bir **haber okuma uygulamasıdır.**
Projenin kodlanması sırasında kullanılan kaynaklar aşağıdaki gibi listelenebilir:

> Flutter 3.22.2
> Dart 3.4.3
> DevTools 2.34.3
> Visual Studio Code 1.90.0
> Android Studio Jellyfish (Sanal makine)
> newsapi.org
> https://javiercbk.github.io/json_to_dart/
> https://web.postman.co/
> cupertino_icons 1.0.6
> google_fonts 6.2.1
> flutter_spinkit 5.2.1
> http 1.2.1
> intl 0.19.0
> cached_network_image

## Uygulama İçeriği ve Özellikleri

 - Kodlanmış uygulama, bir **teknolojik haber okuma uygulamasıdır**.
 - Uygulama, **iki adet** sayfadan oluşmaktadır.
 - Sayfalardan ilki, **5** farklı teknoloji kategorisinde haber kaynağı arasında geçiş yapılabilen ve **anlık olarak o kaynaktan haberlerin görüntülenebildiği** bir sayfadır.
 - Üstte yana doğru **kaydırılabilir** manşetler yer almaktadır.
 - Sayfanın alt kısmında ise aşağıya doğru inerek devam eden **diğer haberler** yer almaktadır.
 - Bunun için uygulamanın sağ üstünde bulunan **"Haber Kaynakları"** butonu kullanılabilir.
 - Seçilen kaynaklardan gelen haberler o ekranda listelenir.
 - Aynı uygulamanın sol üstünde ise **"Kategoriler"** butonu bulunmaktadır, bu buton ise **uygulamanın ikinci sayfasına** yönlendirme yapmaktadır.
 - Uygulamanın ikinci sayfasında ise **haber kaynakları gözetilmeksizin** çeşitli kategorilerdeki haberler (Teknoloji, Bilim, Genel, Eğlence, Sağlık, Spor, İş...) görüntülenebilmektedir.
 - Her iki ekranda da kısa bilgiler olarak haberin **görseli, manşeti, yazıldığı tarih ve kaynağı** yer almaktadır.
 - Habere tıklandığında ise **haberle ilgili detaylar** okunabilmektedir.

## Metodoloji ve Çalışma Prensibi

 - Öncelikle yapılacak projeye ve projenin kapsamına karar verilmiştir.
 - Gereksinim analizi yapılarak projenin kapsamı ve gerekli kaynaklar bulunmuş, bu kaynaklar ışığında projeye başlanmıştır.
 - Yapılacak proje **"Teknolojik haber okuma uygulaması"** olarak belirlendiği için, bu haberlerin anlık olarak çekilebileceği bir **API** (Uygulama geliştirme arayüzü) aranmış, sonrasında ise **newsapi.org** sitesinin hazırlamış olduğu API tercih edilmiştir.
 - Daha sonra tercih edilen bu API'ın kullanımı için site üzerinden, sorgularda kullanılmak üzere bir **API key** alınmıştır.
 - Alınan bu key ve API dokümantasyonu ile **endpoint'lerle** alakalı bilgiler saptanmıştır.
 - Saptanan bu endpoint'lere **https://web.postman.co** ile **HTTP isteği** gönderilmiştir.
 - **JSON formatında** dönen bu cevapların hangi yapıda olduğu, **anahtarları ve değerlerine** bakılmıştır.
 - Daha sonrasında JSON formatının anahtarları ve yapısının  **Flutter**'da işlenebilmesi için bu **anahtarlara ve veriler arasındaki bağımlılıklara uygun** bir **model yapısı** oluşturulmuştur.
 - Bu model yapısının oluşturulabilmesi için **https://javiercbk.github.io/json_to_dart/** projesi kullanılmıştır. İlgili proje, JSON verisini **okuyarak** bunu **DART değişkenlerine ve sınıflarına çevirmekte**, böylelikle ise verinin işlenmesi **kolaylaşmaktadır**.
 - Daha sonrasında işlenmeye hazır hale getirilen veri modelleri projeye aktarılmıştır.
 - API çağrıları yapılmış, daha sonrasında JSON formatında dönen veriler bu modeller aracılığıyla **asenkron programlama tekniğiyle işlenmiştir**.
 - Daha sonrasında ise **ListView** ile bu verilerin **toplu biçimde** gösterimi sağlanmıştır.
 - Verilerin elementleri ayrı ayrı ele alınarak **SizedBox**, **Container** gibi yapıların içine yerleştirilmiş, gerekli font, büyüklük, stil ayarlamaları yapılarak bu yapılar içerisinde çeşitli yerlere gömülmüştür.
 - Daha sonrasında ise bu kutuların tasarımları yapılmıştır ve gözü yormayan bir tasarım haline getirilmiştir.
 - Veri yüklemeleri arasında kullanılmak üzere **Flutter** ile hazır gelen **pub.dev** paket sağlayıcısının sunduğu SpinKit adlı yükleme ekranı kullanılmıştır.
 - İlgili yerlerde görsel destek sağlaması açısından **Google Fonts** ve **Cupertino Icons** paketleri projeye entegre edilmiştir.
 - Görsel işlemleri **Cached Network Image** paketiyle gerçekleştirilmiştir.
 - HTTP isteklerinin (sadece GET metodu kullanılmıştır) işlenebilmesi ve cevapların alınabilmesi için **http** paketi kullanılmıştır.
 - Tarih formatlama işlemleri için ise **intl** paketi kullanılmıştır.
 - Kalan diğer işlemler Flutter'ın içerisinde hazır olarak bulunan, **ek pakete ihtiyaç duymayan** fonksiyonlardır.
