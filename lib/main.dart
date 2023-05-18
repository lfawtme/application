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

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

enum _SkillType { lightroom, xd, illustrator, afterEffect, premiere }

class _MyHomePageState extends State<MyHomePage> {
  _SkillType _skill = _SkillType.lightroom;
  void updateselectedskill(_SkillType skilltype) {
    setState(() {
      this._skill = skilltype;
    });
  }

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
          SizedBox(height: 12),
          Center(
            child: Wrap(
              direction: Axis.horizontal,
              spacing: 8,
              runSpacing: 8,
              children: [
                Skills(
                  type: _SkillType.lightroom,
                  title: 'Lightroom',
                  imagePath: 'assets/images/photoshop-lightroom.png',
                  shadowColor: Colors.blue,
                  isActive: _skill == _SkillType.lightroom,
                  onTap: () {
                    updateselectedskill(_SkillType.lightroom);
                  },
                ),
                Skills(
                  type: _SkillType.xd,
                  title: 'Adobe Xd',
                  imagePath: 'assets/images/xd.png',
                  shadowColor: Colors.pink,
                  isActive: _skill == _SkillType.xd,
                  onTap: () {
                    updateselectedskill(_SkillType.xd);
                  },
                ),
                Skills(
                  type: _SkillType.illustrator,
                  title: 'Illustrator',
                  imagePath: 'assets/images/illustrator.png',
                  shadowColor: Colors.orange,
                  isActive: _skill == _SkillType.illustrator,
                  onTap: () {
                    updateselectedskill(_SkillType.illustrator);
                  },
                ),
                Skills(
                  type: _SkillType.afterEffect,
                  title: 'After Effect',
                  imagePath: 'assets/images/after-effects.png',
                  shadowColor: Colors.blue.shade800,
                  isActive: _skill == _SkillType.afterEffect,
                  onTap: () {
                    updateselectedskill(_SkillType.afterEffect);
                  },
                ),
                Skills(
                  type: _SkillType.premiere,
                  title: 'Premiere',
                  imagePath: 'assets/images/premiere-pro.png',
                  shadowColor: Colors.purple,
                  isActive: _skill == _SkillType.premiere,
                  onTap: () {
                    updateselectedskill(_SkillType.premiere);
                  },
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
  final _SkillType type;
  final String title;
  final String imagePath;
  final Color shadowColor;
  final bool isActive;
  final Function() onTap;
  const Skills({
    super.key,
    required this.type,
    required this.title,
    required this.imagePath,
    required this.shadowColor,
    required this.isActive,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final BorderRadius defaultborderRadius = BorderRadius.circular(12);
    return InkWell(
      borderRadius: defaultborderRadius,
      onTap: onTap,
      child: Container(
        width: 110,
        height: 110,
        decoration: isActive
            ? BoxDecoration(
                color: Theme.of(context).dividerColor,
                borderRadius: defaultborderRadius)
            : null,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: isActive
                  ? BoxDecoration(boxShadow: [
                      BoxShadow(
                          color: shadowColor.withOpacity(0.5), blurRadius: 20),
                    ])
                  : null,
              child: Image.asset(
                imagePath,
                height: 40,
                width: 40,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(title),
          ],
        ),
      ),
    );
  }
}
