import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class NewsDetailsScreen extends StatefulWidget {
  final String newsImage, newsTitle, newsDate, author, description, content, source;
  const NewsDetailsScreen({Key? key,
    //Detay sayfasında kullanılacak değişkenlerin sınıf içerisinde ilklendirilmesi
    required this.newsImage,
    required this.newsTitle,
    required this.newsDate,
    required this.author,
    required this.description,
    required this.content,
    required this.source
  }) : super(key: key);

  @override
  State<NewsDetailsScreen> createState() => _NewsDetailsScreenState();
}

class _NewsDetailsScreenState extends State<NewsDetailsScreen> {

  //Tarihin formatlanması

  final format = DateFormat("MMMM dd, yyyy");

  //Tarihin string formatıne çevrilmesi için Parse işlemine tabii tutulması

  late DateTime dateTime = DateTime.parse(widget.newsDate);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height * 1;
    return Scaffold(
      appBar: AppBar(

        //Arkaplanın transparan yapılması

        backgroundColor: Colors.transparent,
        elevation: 0
      ),
      body: Stack(
        children: [
          Container(
            height: height * .45,
            child: ClipRRect(

              //Dairesel kenarlar

              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(40)
              ),
              child: Center(

                //Habere ait görselin çekilmesi

                child: CachedNetworkImage(imageUrl: widget.newsImage,
                fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Container(
            height: height * .6,
            margin: EdgeInsets.only(top: height * .4),
            padding: EdgeInsets.only(top: 20, right: 20, left: 20),
            decoration : BoxDecoration(

              //Haber detaylarının bulunduğu kısmın şekillendirilmesi ve arkaplandan ayrıştırılarak gri
              //tonlarda yeniden renklendirilmesi

            color: const Color.fromARGB(255, 238, 238, 238),
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(40)
              )
          ),
          
          child: ListView(
            children: [
              //Başlığın font ayarları
              Text(widget.newsTitle,
              style: GoogleFonts.poppins(
                fontSize: 20,
                color: Colors.black87,
                fontWeight: FontWeight.w700
              ),
              ),
              //Haber kaynağının font ayarları
              SizedBox(height: height * .02,),
              Row(children: [
                Expanded(
                  child: Text(widget.source, style: GoogleFonts.poppins(
                  fontSize: 13,
                  color: Colors.black87,
                  fontWeight: FontWeight.w600)
                            ),
                ),
                //Tarihin font ayarları
          Text(format.format(dateTime), style: GoogleFonts.poppins(
                fontSize: 12,
                color: Colors.black87,
                fontWeight: FontWeight.w500)
              )],
                ),
                SizedBox(height: height * .03,),
                //Haber detaylarının font ayarları
                Text(widget.description, style: GoogleFonts.poppins(
                  fontSize: 15,
                  color: Colors.black87,
                  fontWeight: FontWeight.w500)
              ),
            ],
          ),
          )
        ],
      ),
    );
  }
}