import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:madproject/models/categories_news_model.dart';
import 'package:madproject/models/news_channel_headlines_model.dart';
import 'package:madproject/view/news_details_screen.dart';
import 'package:madproject/view/categories_screen.dart';
import 'package:madproject/view_model/news_view_model.dart';
import 'package:cached_network_image/cached_network_image.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

//hacker-news | ars-technica | techradar | the-next-web | the-verge | 

//Api çağrıları için kullanılacak haber kaynaklarının listeleri
enum FilterList {hackerNews, arsTechnica, techRadar, theNextWeb, theVerge}

class _HomeScreenState extends State<HomeScreen> {
  NewsViewModel newsViewModel = NewsViewModel();

  //Api çağrıları için kullanılacak listenin ilklendirilmesi.
  FilterList? selectedMenu;

  //Tarihlerin formatlandırılması
  final format = DateFormat("MMMM dd, yyyy");

  //Gösterilecek ilk ekranın api çağrısı
  String name = 'ars-technica';

  @override
  Widget build(BuildContext context) {

    final width = MediaQuery.sizeOf(context).width * 1;
    final height = MediaQuery.sizeOf(context).height * 1;

    return Scaffold(
      appBar: AppBar(
        
        //Sol üstteki menü butonu, yönlendirme kodu, boyutlandırması, görselleştirilmesi ve tıklama eventi
        leading: IconButton(
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => CategoriesScreen()));
          },
          icon: Image.asset('images/category_icon.png',
          height: 30,
          width: 30,
          ),
          ),
        
        //Başlık
        title: Text('Haberler', style: GoogleFonts.poppins(fontSize: 24, fontWeight: FontWeight.w700),),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 100),
            
            //Haber kaynaklarının değiştirilmesi için buton oluşturulması, ikonunun değiştirilmesi, ilk değer (text olarak)
            //renklendirme işlemleri ve item ekleme / tıklanmış itemlere göre yeniden api çağrısı yapma
            
            child: PopupMenuButton<FilterList>(
              initialValue: selectedMenu,
              //icon: Icon(Icons.more_vert, color: Colors.black),
              child: TextButton.icon(
                label: Text('Haber Kaynakları'),
                icon: Icon(
                  Icons.more_vert,
                  color: Colors.black87,
                ),
                onPressed: null,
              ),
              onSelected: (FilterList item){
                if(FilterList.hackerNews.name == item.name)
                {
                  name = 'hacker-news';
                }
                if(FilterList.arsTechnica.name == item.name)
                {
                  name = 'ars-technica';
                }
                if(FilterList.techRadar.name == item.name)
                {
                  name = 'techradar';
                }
                if(FilterList.theNextWeb.name == item.name)
                {
                  name = 'the-next-web';
                }
                if(FilterList.theVerge.name == item.name)
                {
                  name = 'the-verge';
                }

                //En üstte tanımlanan kaynağın değiştirilmesi
                setState(() {
                  selectedMenu = item;
                });
            
              },

              //PopupMenuButton'a item eklenmesi ve buttonların isimlendirilmesi/value set edilmesi

              itemBuilder: (BuildContext context) => <PopupMenuEntry<FilterList>> [
              const PopupMenuItem<FilterList>(
                value: FilterList.hackerNews,
                child: Text('Hacker News'),
              ),
              const PopupMenuItem<FilterList>(
                value: FilterList.arsTechnica,
                child: Text('Ars Technica'),
              ),
              const PopupMenuItem<FilterList>(
                value: FilterList.techRadar,
                child: Text('Tech Radar'),
              ),
              const PopupMenuItem<FilterList>(
                value: FilterList.theNextWeb,
                child: Text('The Next Web'),
              ),
              const PopupMenuItem<FilterList>(
                value: FilterList.theVerge,
                child: Text('The Verge'),
              ),
                    ]),
          ),
          ],
      ),

      //Web ortamında scroll (kaydırma) işleminin gerçekleştirilebilmesi için gerekli kod parçası

      body: ScrollConfiguration(
        behavior: ScrollConfiguration.of(context).copyWith(dragDevices: {
          PointerDeviceKind.touch,
          PointerDeviceKind.mouse,
        },),
        child: ScrollConfiguration(
          behavior: ScrollConfiguration.of(context).copyWith(dragDevices: {
          PointerDeviceKind.touch,
          PointerDeviceKind.mouse,
        },),

        //ListView oluşturulması, scroll işlemleri, Api çağrısının yapılması ve modellenmiş yapıya uydurulması

          child: ListView(
            physics: const AlwaysScrollableScrollPhysics(),
            children: [
              SizedBox(
                height: height * .55,
                width: width,
                child: FutureBuilder<NewsChannelHeadlinesModel>(
                  future: newsViewModel.fetchNewsChannelHeadlinesApi(name),
                  builder: (BuildContext context, snapshot){

                    //Api çağrısı yapılırken oluşan bekleme ekranının oluşturulması
                    if(snapshot.connectionState == ConnectionState.waiting){
                      return Center(
                        child: SpinKitCircle(
                          size: 50,
                          color: Colors.orange,
                          ),
                      );
                    }
                    else
                    {
                      return ScrollConfiguration(
                        behavior: ScrollConfiguration.of(context).copyWith(dragDevices: {
          PointerDeviceKind.touch,
          PointerDeviceKind.mouse,
        },),
                        child: ListView.builder(
                          physics: const AlwaysScrollableScrollPhysics(),
                          itemCount: snapshot.data!.articles!.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context , index) {
                                  
                            
                            DateTime dateTime = DateTime.parse(snapshot.data!.articles![index].publishedAt.toString());

                            //Bilgilerin derlenmesi ve itembuilder'a yerleştirilmesi, daha sonrasında ise
                            //haberle ilgili detayların gösterileceği sayfaya yollanması

                            return InkWell(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context) => 
                                NewsDetailsScreen(newsImage: snapshot.data!.articles![index].urlToImage.toString(), 
                                newsTitle: snapshot.data!.articles![index].title.toString(), 
                                newsDate: snapshot.data!.articles![index].publishedAt.toString(), 
                                author: snapshot.data!.articles![index].author.toString(), 
                                description: snapshot.data!.articles![index].description.toString(), 
                                content: snapshot.data!.articles![index].content.toString(), 
                                source: snapshot.data!.articles![index].source!.name.toString()))
                                );
                              },
                              child: SizedBox(
                              child: Stack(
                              alignment: Alignment.center,
                              children: [
                                Container(
                                  height: height * 0.6,
                                  width: width * 0.9,
                                  padding: EdgeInsets.symmetric(
                                    horizontal: height * 0.02
                                  ),
                                  child: ClipRRect(

                                    //Radius verilmesi

                                    borderRadius: BorderRadius.circular(15),
                                    child: CachedNetworkImage(
                                      //Resmin atanması, placeholder koyulması ve görselin yüklenememesi durumunda
                                      //errorWidget ile görsel yerine ikon koyulması
                                      imageUrl: snapshot.data!.articles![index].urlToImage.toString(),
                                      fit: BoxFit.cover,
                                      placeholder: (context, url) => Container(child: spinKit2,),
                                      errorWidget: (context, url, error) => Icon(Icons.error_outline, color: Colors.red,),
                                    ),
                                  ),
                                ),
                              Positioned(
                                bottom: 20,
                                child: Card(
                                  elevation: 5,
                                  color: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Container(
                                    height: height * .22,
                                    alignment: Alignment.bottomCenter,
                                    padding: EdgeInsets.all(15),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          width: width * 0.7,

                                          //Text'in font, size, fontweight ve maksimum satır ayarları

                                          child: Text(snapshot.data!.articles![index].title.toString(), 
                                          maxLines: 2 , overflow: TextOverflow.ellipsis, style: GoogleFonts.poppins(
                                          fontSize: 12, fontWeight: FontWeight.w500),),
                                        ),

                                        //Boşluk bırakma işlemi
                                        
                                        Spacer(),
                                        Container(
                                          width: width * 0.7,
                                    
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(snapshot.data!.articles![index].source!.name.toString(),
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                              style: GoogleFonts.poppins(
                                                fontSize: 17, fontWeight: FontWeight.w600)
                                              ),
                                              
                                              Text(format.format(dateTime),
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                              style: GoogleFonts.poppins(
                                                fontSize: 12, fontWeight: FontWeight.w500
                                              ),), 
                                            ],
                                          ),
                                        )
                                      ],
                                    ),),
                                ),
                              )
                              ],
                              ),
                                                ),
                            );
                          }),
                      );
                    }
                  }
              )
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: FutureBuilder<CategoriesNewsModel>(

                      //Alt kısımda gösterilecek olan haberlerin api çağrısının yapılması ve
                      //ilklendirilmiş kategoriye dair haberlerin gösterilmesi
                  
                      future: newsViewModel.fetchCategoriesNewsApi('science'),
                      builder: (BuildContext context, snapshot){
                        if(snapshot.connectionState == ConnectionState.waiting){
                          return const Center(
                            child: SpinKitCircle(
                              size: 50,
                              color: Colors.orange,
                              ),
                          );
                        }
                        else
                        {
                          return ScrollConfiguration(
                            behavior: ScrollConfiguration.of(context).copyWith(dragDevices: {
                          PointerDeviceKind.touch,
                          PointerDeviceKind.mouse,
                        },),
                            child: ListView.builder(
                              physics: const AlwaysScrollableScrollPhysics(),
                              itemCount: snapshot.data!.articles!.length,
                              shrinkWrap: true,
                              itemBuilder: (context , index) {
                                              
                              DateTime dateTime = DateTime.parse(snapshot.data!.articles![index].publishedAt.toString());
                                              
                                return Padding(
                                  padding: const EdgeInsets.only(bottom: 15),
                                  child: Row(children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(15),
                                      child: CachedNetworkImage(
                                        imageUrl: snapshot.data!.articles![index].urlToImage.toString(),
                                        fit: BoxFit.cover,
                                        height: height * .18,
                                        width: width * .3,
                                        placeholder: (context, url) => Container(child: Center(
                                                        child: SpinKitCircle(
                                  size: 50,
                                  color: Colors.orange,
                                  ),
                                                         )),
                                        errorWidget: (context, url, error) => Icon(Icons.error_outline, color: Colors.red,),
                                      ),
                                    ),
                                  Expanded(
                                    child: Container(
                                      height: height * .18,
                                      padding: EdgeInsets.only(left: 15),
                                      child: Column(children: [
                                        Text(snapshot.data!.articles![index].title.toString(),
                                        maxLines: 3,
                                        style: GoogleFonts.poppins(fontSize: 15,
                                        color: Colors.black54,
                                        fontWeight: FontWeight.w700),
                                        ),
                                        Spacer(),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(snapshot.data!.articles![index].source!.name.toString(),
                                                                            style: GoogleFonts.poppins(fontSize: 15,
                                                                            color: Colors.black54,
                                                                            fontWeight: FontWeight.w600),
                                                                            ),
                                        Text(format.format(dateTime),
                                        style: GoogleFonts.poppins(fontSize: 15,
                                        fontWeight: FontWeight.w700),
                                        ),
                                          ],
                                        )
                                      ],),
                                    ))
                                  ],
                                  ),
                                );
                                }),
                          );
                        }
                      }
                              ),
              ),],),
        ),
      ),
    );
    
  }
}

  //Flutter'da hazır olarak gelen yükleme ekranlarının bulunduğu kütüphane
  const spinKit2 = SpinKitFadingCircle(
    color: Colors.amber,
    size: 50,
  );