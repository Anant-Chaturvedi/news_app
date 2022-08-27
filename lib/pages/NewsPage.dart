// @dart=2.9
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_api_infiny/components/shimmer_loading.dart';
import '../components/customListTile.dart';
import '../model/article_model.dart';
import '../services/api_service.dart';

class NewsBuilder extends StatefulWidget {
  final String category;
  const NewsBuilder({Key key, this.category}) : super(key: key);

  @override
  State<NewsBuilder> createState() => _NewsBuilderState();
}

class _NewsBuilderState extends State<NewsBuilder> {
  ApiService client = ApiService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(12.0),
          child: FloatingActionButton(
            backgroundColor: Colors.white,
            elevation: 1,
            
            onPressed: (() {
              Navigator.pop(context);
            }),
            child: Icon(CupertinoIcons.arrow_left,color: Colors.black,)),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Top ${widget.category.replaceFirst(widget.category[0], widget.category[0].toUpperCase())} News',style: TextStyle(color: Colors.grey.shade600),
        ),
      ),
      body: FutureBuilder(
        future: client.getArticle(widget.category),
        builder: (BuildContext context, AsyncSnapshot<List<Article>> snapshot) {
          if (snapshot.hasData) {
            List<Article> articles = snapshot.data;
            return ListView.builder(
              itemCount: articles.length,
              itemBuilder: (context, index) =>
                  customListTile(articles[index], context),
            );
          }
          return ShimmerEffectPage();
        },
      ),
    );
  }
}
