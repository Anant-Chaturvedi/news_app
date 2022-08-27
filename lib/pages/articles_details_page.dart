import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../main.dart';
import '../model/article_model.dart';

class ArticlePage extends StatefulWidget {
  final Article article;

  const ArticlePage({Key? key, required this.article}) : super(key: key);

  @override
  State<ArticlePage> createState() => _ArticlePageState();
}

enum MenuAction { browser, share }

class _ArticlePageState extends State<ArticlePage> {
  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) WebView.platform = AndroidWebView();
  }

  Row PopUpMenuTile(IconData iconData, String text) {
    return Row(
      children: [
        Icon(
          iconData,
          size: 25,
          color: Colors.green
        ),
        const SizedBox(width: 10),
        Text(
          text,
          style: TextStyle(fontSize: 16),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.article.title,
          style: TextStyle(color: Colors.grey.shade600),
        ),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0,
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
        actions: [
          PopupMenuButton<MenuAction>(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            itemBuilder: (context) {
              return [
                PopupMenuItem<MenuAction>(

                    value: MenuAction.browser,
                    child: PopUpMenuTile(
                        Icons.open_in_browser, 'View in browser', )),
                PopupMenuItem<MenuAction>(
                  value: MenuAction.share,
                  child: PopUpMenuTile(Icons.share, 'Share', ),
                ),
              ];
            },
            onSelected: (value) async {
              if (value == MenuAction.browser) {
                if (await canLaunchUrlString(widget.article.url)) {
                  await launchUrlString(widget.article.url,
                      mode: LaunchMode.externalApplication);
                } else {
                  throw "Not able to Launch!!";
                }
              } else if (value == MenuAction.share) {
                final url = widget.article.url;
                await Share.share(
                    'Check out this news via Daily News App : $url');
              }
            },
          ),
        ],
      ),
      body: WebView(
        initialUrl: widget.article.url,
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}
