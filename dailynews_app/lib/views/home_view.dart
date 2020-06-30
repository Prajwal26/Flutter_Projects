import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dailynewsapp/helper/data.dart';
import 'package:dailynewsapp/helper/news.dart';
import 'package:dailynewsapp/main.dart';
//import 'package:dailynewsapp/NewPage.dart';
import 'package:dailynewsapp/model/Artcilemodel.dart';
import 'package:dailynewsapp/model/CategoryModel.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dailynewsapp/views/article_view.dart';
import 'package:dailynewsapp/views/category_view.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<CategoryModel> categories=new List<CategoryModel>();
  List<ArticleModel> articles=new List<ArticleModel>();
  bool _loading=true;
  @override


  void initState() {
    // TODO: implement initState
    super.initState();
    categories=getCategories();
    getNews();
  }

  getNews() async
  {
    print('abc');
    News news=News();
    await news.getNews();
    articles=news.news;
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
          )
      ),
      body:_loading?Center(
        child: CircularProgressIndicator(),
      ): SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: <Widget>[

              //
              Container(
                height: 70,
                child: ListView.builder(itemCount: categories.length,shrinkWrap: true,scrollDirection: Axis.horizontal,itemBuilder: (context,index){
                  return Category(
                    ImageUrl: categories[index].ImageUrl,
                    categoryName: categories[index].categoryName,

                  );
                }),
              ),

              //
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
              )

            ],
          ),

        ),
      ),
    );
  }
}
class Category extends StatelessWidget {

  final String ImageUrl;
  final String categoryName;
  Category({this.ImageUrl,this.categoryName});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()
      {
        Navigator.push(context, MaterialPageRoute(builder: (context)=>CategoryNews(Category: categoryName.toLowerCase(),),),);
      },
      child: Container(
        margin: EdgeInsets.only(right: 16,top: 10),
        child: Stack(
          children: <Widget>[
            ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: Image.network(ImageUrl,width: 120,height: 60,fit: BoxFit.cover)),
            Container(
              alignment: Alignment.center,
              width: 120,
              height: 60,
              decoration: BoxDecoration(
                  color: Colors.black26,
                  borderRadius: BorderRadius.circular(6)
              ),
              child: Text(categoryName,style: TextStyle(
                color: Colors.white,
                fontSize: 14,

              ),),
            )
          ],

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
