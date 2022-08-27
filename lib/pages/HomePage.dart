// @dart=2.9

// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:news_api_infiny/pages/about_page.dart';

import '../components/DrawerTile.dart';
import '../components/customListTile.dart';
import '../components/shimmer_loading.dart';
import '../model/article_model.dart';
import '../services/api_service.dart';
import 'package:shimmer/shimmer.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ApiService client = ApiService();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.grey.shade700),
          backgroundColor: Colors.white,
          title: const Text(
            "Top News",
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
          elevation: 0,
        ),
        body: FutureBuilder(
          future: client.getArticle('general'),
          builder:
              (BuildContext context, AsyncSnapshot<List<Article>> snapshot) {
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
        drawer: Drawer(
          child: ListView(
            children: [
              DrawerHeader(
                  decoration:
                      const BoxDecoration(color: Color.fromARGB(255, 231, 231, 231)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                  SizedBox(
                      height: 80,
                      child: Image.asset('assets/newspaper.png')),
                      Text('Welcome to the world of News', style: TextStyle(color: Colors.indigo, fontSize: 18, fontWeight: FontWeight.bold),)
                    
                    ],
                  )),
              DrawerTile(Icons.business, 'Business',
                  const IconThemeData(color: Colors.black)),
              DrawerTile(Icons.movie, 'Entertainment',
                  const IconThemeData(color: Colors.black)),
              DrawerTile(Icons.sports_basketball, 'Sports',
                  const IconThemeData(color: Colors.black)),
              DrawerTile(Icons.health_and_safety, 'Health',
                  const IconThemeData(color: Colors.black)),
              DrawerTile(
                  Icons.science, 'Science', IconThemeData(color: Colors.black)),
              DrawerTile(Icons.lightbulb, 'Technology',
                  const IconThemeData(color: Colors.black)),
                    Padding(
                      padding:  EdgeInsets.only(left: 12, right: 12),
                      child: SizedBox(
                        height: 60,
                        width: double.infinity,
                        child: GestureDetector(
                          onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=> AboutPage()));},
                          child: Card(
                            color: const Color.fromARGB(255, 237, 247, 237),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                            child: Row(children: [
                              const Padding(
                                padding:  EdgeInsets.only(left: 12),
                                child: Icon(Icons.info, color: Colors.green,),
                              ),
                              SizedBox(width: 40,),
                              Text('About', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: Colors.indigo),)
                            ],),
                          ),
                        ),
                      ),
                    )
            ],
          ),
        ),
      ),
    );
  }
}

