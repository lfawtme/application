import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Color surfaceColor = Color(0x0dffffff);
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        primaryColor: Colors.pink.shade500,
        brightness: Brightness.dark,
        dividerColor: surfaceColor,
        scaffoldBackgroundColor: Color.fromARGB(255, 30, 30, 30),
        appBarTheme: AppBarTheme(backgroundColor: Colors.black),
        textTheme: GoogleFonts.latoTextTheme(
          TextTheme(
            bodyText2: TextStyle(fontSize: 15),
            bodyText1: TextStyle(
                fontSize: 13, color: Color.fromARGB(150, 255, 255, 255)),
            headline6: TextStyle(fontWeight: FontWeight.bold),
            subtitle1: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('carriculm vitae'),
        // ignore: prefer_const_literals_to_create_immutables
        actions: [
          Icon(CupertinoIcons.chat_bubble),
          // ignore: prefer_const_constructors
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
            child: Icon(CupertinoIcons.ellipsis_vertical),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(32),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    'assets/images/profile22.png',
                    width: 60,
                    height: 60,
                  ),
                ),
                SizedBox(
                  width: 16,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'brice sorophin',
                        style: Theme.of(context).textTheme.subtitle1,
                      ),
                      SizedBox(
                        height: 2,
                      ),
                      Text('product & print desinger'),
                      SizedBox(
                        height: 8,
                      ),
                      Row(
                        children: [
                          Icon(
                            CupertinoIcons.location_solid,
                            size: 14,
                            color: Theme.of(context).textTheme.bodyText1!.color,
                          ),
                          SizedBox(width: 3),
                          Text('paris.france',
                              style: Theme.of(context).textTheme.bodyText1),
                        ],
                      ),
                    ],
                  ),
                ),
                Icon(
                  CupertinoIcons.heart,
                  color: Theme.of(context).primaryColor,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(32, 0, 32, 16),
            child: Text(
              'hi everyone , its me desinger in love of infependece, i have okot of experince in grophical projects and always give the best of myself to bring you to success ',
              style: Theme.of(context).textTheme.caption,
            ),
          ),
          Divider(),
          Padding(
            padding: const EdgeInsets.fromLTRB(32, 16, 32, 12),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Skills',
                  style: Theme.of(context)
                      .textTheme
                      .bodyText2!
                      .copyWith(fontWeight: FontWeight.w800),
                ),
                SizedBox(width: 2),
                Icon(
                  CupertinoIcons.chevron_down,
                  size: 12,
                ),
              ],
            ),
          ),
          Center(
            child: Wrap(
              direction: Axis.horizontal,
              spacing: 8,
              runSpacing: 8,
              children: [
                Skills(
                  title: 'Lightroom',
                  imagePath: 'assets/images/photoshop-lightroom.png',
                  shadowColor: Colors.blue,
                  isAactive: true,
                ),
                Skills(
                  title: 'Adobe Xd',
                  imagePath: 'assets/images/xd.png',
                  shadowColor: Colors.pink,
                  isAactive: false,
                ),
                Skills(
                  title: 'Illustrator',
                  imagePath: 'assets/images/illustrator.png',
                  shadowColor: Colors.orange,
                  isAactive: false,
                ),
                Skills(
                  title: 'After Effect',
                  imagePath: 'assets/images/after-effects.png',
                  shadowColor: Colors.blue,
                  isAactive: false,
                ),
                Skills(
                  title: 'Premiere',
                  imagePath: 'assets/images/premiere-pro.png',
                  shadowColor: Colors.purple,
                  isAactive: false,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Skills extends StatelessWidget {
  final String title;
  final String imagePath;
  final Color shadowColor;
  final bool isAactive;
  const Skills({
    super.key,
    required this.title,
    required this.imagePath,
    required this.shadowColor,
    required this.isAactive,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 110,
      height: 110,
      decoration: isAactive
          ? BoxDecoration(
              color: Theme.of(context).dividerColor,
              borderRadius: BorderRadius.circular(12))
          : null,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            imagePath,
            height: 40,
            width: 40,
          ),
          const SizedBox(
            height: 8,
          ),
          Text(title),
        ],
      ),
    );
  }
}
