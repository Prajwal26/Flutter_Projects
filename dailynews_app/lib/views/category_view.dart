import 'package:flutter/material.dart';
import 'package:dailynewsapp/helper/news.dart';
import 'package:dailynewsapp/model/Artcilemodel.dart';
import 'package:dailynewsapp/views/home_view.dart';

import 'article_view.dart';

class CategoryNews extends StatefulWidget {
  final String Category;
  CategoryNews({this.Category});
  @override
  _CategoryNewsState createState() => _CategoryNewsState();
}

class _CategoryNewsState extends State<CategoryNews> {


  List<ArticleModel> articles=new List<ArticleModel>();
  bool _loading=true;
  void initState() {
    // TODO: implement initState
    super.initState();
    getNewsCategory();

  }

  getNewsCategory() async
  {
    print('abc');
    CategoryNewsClass newsClass=CategoryNewsClass();
    await newsClass.getNews(widget.Category);
    articles=newsClass.news;
    setState(() {
      _loading=false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black54,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Daily'),
            Text('News',style: TextStyle(color: Colors.white),),
          ],
        ),
        actions: <Widget>[

          Opacity(
            opacity: 0,
            child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Icon(Icons.save)),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(topRight: Radius.circular(16),topLeft: Radius.circular(16.0),),
                ),
                child: ListView.builder(itemCount: articles.length,shrinkWrap: true,physics: ClampingScrollPhysics(),itemBuilder: (context,index){
                  return Blog(
                    imageUrl: articles[index].urlTOImage,
                    desc: articles[index].Description,
                    title: articles[index].title,
                    url: articles[index].url,
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );

  }
}
class Blog extends StatelessWidget {
  final String imageUrl,desc,title,url;
  Blog({this.imageUrl,this.title,this.desc,this.url});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(
            builder: (context)=>ArticleView(
              blogUrl: url,
            )
        ),);
      },
      child: Container(

        margin: EdgeInsets.only(bottom: 16),
        child: Column(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(16.0),
              child:Image.network(imageUrl),
            ),
            SizedBox(height: 8),
            Text(title,style: TextStyle(fontSize: 17,color: Colors.black),),
            SizedBox(height: 8),
            Text(desc,style: TextStyle(color: Colors.black54),),
            SizedBox(height: 8),

          ],
        ),
      ),
    );
  }
}