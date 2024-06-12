import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:madproject/models/categories_news_model.dart';
import 'package:madproject/models/news_channel_headlines_model.dart';

class NewsRepository {

  //Haber kaynaklarına göre yapılan Api çağrısı (Anasayfadaki "Haber kaynakları" kısmı ve anasayfaya
  //yerleştirilecek ilk haberler için)

  Future<NewsChannelHeadlinesModel> fetchNewsChannelHeadlinesApi(channelName)async{
    String url = 'https://newsapi.org/v2/top-headlines?sources=${channelName}&apiKey=5c419317f44a4b2d9c61f5ae3cb4a118';
    final response = await http.get(Uri.parse(url));

    if(kDebugMode){
      print(response.body);
    }

    //Get metodu sonrasında dönen cevabın, önceden oluşturulmuş bir JSON modeline oturtulması. (news_channel_headlines_model.dart)

    if(response.statusCode == 200){
      final body = jsonDecode(response.body);
      return NewsChannelHeadlinesModel.fromJson(body);
    }
    throw Exception('Error');
  }

  //Kategorilere göre yapılan Api çağrısı (Sol menüden geçiş yapılan kategoriler ekranı için)

  
  Future<CategoriesNewsModel> fetchCategoriesNewsApi(String category)async{
    String url = 'https://newsapi.org/v2/everything?q=${category}&apiKey=5c419317f44a4b2d9c61f5ae3cb4a118';
    final response = await http.get(Uri.parse(url));

    if(kDebugMode){
      print(response.body);
    }


    //Get metodu sonrasında dönen cevabın, önceden oluşturulmuş bir JSON modeline oturtulması. (categories_news_model.dart)
    if(response.statusCode == 200){
      final body = jsonDecode(response.body);
      return CategoriesNewsModel.fromJson(body);
    }
    throw Exception('Error');
  }
}