import 'package:http/http.dart' as http;
import 'package:dailynewsapp/model/Artcilemodel.dart';
import 'dart:convert';
class News
{
  List<ArticleModel> news=[];

  Future <void> getNews() async
  {

    String url="http://newsapi.org/v2/top-headlines?country=in&excludeDomains=stackoverflow.com&sortBy=publishedAt&language=en&apiKey=9a9648a1b4524819aeede4c4bf7d1a2e";
    var response=await http.get(url);

    var jsonData=jsonDecode(response.body);
    if(jsonData['status']== 'ok')
    {
      print('ok');
      jsonData["articles"].forEach((element)
      {
        if(element["urlToImage"]!=null && element["description"]!=null)
        {
          ArticleModel articleModel=ArticleModel(

              title: element['title'],

              Description: element['description'],
              author: element['author'],
              urlTOImage: element['urlToImage'],
              url: element['url'],

              content: element['content']
          );
          news.add(articleModel);
        }
      });
    }

  }






}


class CategoryNewsClass
{
  List<ArticleModel> news=[];

  Future <void> getNews(String Category) async
  {

    String url="http://newsapi.org/v2/top-headlines?country=us&category=$Category&apiKey=9a9648a1b4524819aeede4c4bf7d1a2e";
    var response=await http.get(url);

    var jsonData=jsonDecode(response.body);
    if(jsonData['status']== 'ok')
    {
      print('ok');
      jsonData["articles"].forEach((element)
      {
        if(element["urlToImage"]!=null && element["description"]!=null)
        {
          ArticleModel articleModel=ArticleModel(

              title: element['title'],

              Description: element['description'],
              author: element['author'],
              urlTOImage: element['urlToImage'],
              url: element['url'],

              content: element['content']
          );
          news.add(articleModel);
        }
      });
    }

  }






}