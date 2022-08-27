import 'package:flutter/material.dart';
import '../main.dart';
import '../pages/NewsPage.dart';

class DrawerTile extends StatelessWidget {
  IconData icons;
  String title;
  IconThemeData color;

  DrawerTile(this.icons, this.title, this.color, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
      child: Card(
        elevation: 1,
        color: Color.fromARGB(255, 237, 247, 237),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: ListTile(
          leading: Icon(
            icons,
          color: Colors.black,
          ),
          title: Text(
            title,
            style: const TextStyle(fontSize: 18, color: Colors.indigo),
          ),
          onTap: () {
            Navigator.pop(context);
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return NewsBuilder(
                category: title,
              );
            }));
          },
        ),
      ),
    );
  }
}
