import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is The root of your application.
  ThemeMode _themeMode = ThemeMode.dark;
  @override
  Widget build(BuildContext context) {
    Color surfaceColor = Color(0x0dffffff);
    Color primaryColor = Colors.pink.shade400;

    return MaterialApp(
      title: 'Flutter Demo',
      theme: _themeMode == ThemeMode.dark
          ? MyAppThemeConfig.dark().getTheme()
          : MyAppThemeConfig.light().getTheme(),
      home: MyHomePage(
        toggleThemeMode: () {
          setState(() {
            if (_themeMode == ThemeMode.dark)
              _themeMode = ThemeMode.light;
            else
              _themeMode = ThemeMode.dark;
          });
        },
      ),
    );
  }
}

class MyAppThemeConfig {
  final Color primaryColor = Colors.pink.shade400;
  final Color primaryTextColor;
  final Color secondaryTextColor;
  final Color surfaceColor;
  final Color backgroundColor;
  final Color appBarColor;
  final Brightness brightness;

  MyAppThemeConfig.dark()
      : primaryTextColor = Colors.white,
        secondaryTextColor = Colors.white70,
        surfaceColor = Color(0x0dffffff),
        backgroundColor = Color.fromARGB(255, 30, 30, 30),
        appBarColor = Colors.black,
        brightness = Brightness.dark;

  MyAppThemeConfig.light()
      : primaryTextColor = Colors.grey.shade900,
        secondaryTextColor = Colors.grey.shade900,
        surfaceColor = Color(0x0d000000),
        backgroundColor = Colors.white,
        appBarColor = Color.fromARGB(255, 235, 235, 235),
        brightness = Brightness.light;

  ThemeData getTheme() {
    return ThemeData(
      // This is the theme of your application.
      //
      // Try running your application with "flutter run". You'll see the
      // application has a blue toolbar. Then, without quitting the app, try
      // changing the primarySwatch below to Colors.green and then invoke
      // "hot reload" (press "r" in the console where you ran "flutter run",
      // or simply save your changes to "hot reload" in a Flutter IDE).
      // Notice that the counter didn't reset back to zero; the application
      // is not restarted.
      primarySwatch: Colors.pink,
      primaryColor: primaryColor,
      brightness: brightness,
      dividerColor: surfaceColor,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(primaryColor),
        ),
      ),
      scaffoldBackgroundColor: backgroundColor,
      appBarTheme: AppBarTheme(
          elevation: 0,
          backgroundColor: appBarColor,
          foregroundColor: primaryTextColor),
      inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide.none),
          filled: true,
          fillColor: surfaceColor),
      textTheme: GoogleFonts.latoTextTheme(
        TextTheme(
          bodyText2: TextStyle(fontSize: 15, color: primaryTextColor),
          bodyText1: TextStyle(fontSize: 13, color: secondaryTextColor),
          headline6:
              TextStyle(fontWeight: FontWeight.bold, color: primaryTextColor),
          subtitle1: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: primaryTextColor),
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final Function() toggleThemeMode;

  const MyHomePage({super.key, required this.toggleThemeMode});
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

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
          InkWell(
            onTap: widget.toggleThemeMode,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
              child: Icon(CupertinoIcons.ellipsis_vertical),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
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
                              color:
                                  Theme.of(context).textTheme.bodyText1!.color,
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
            SizedBox(height: 8),
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
            Divider(),
            Padding(
              padding: const EdgeInsets.fromLTRB(32, 12, 32, 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Personal information',
                    style: Theme.of(context)
                        .textTheme
                        .bodyText2!
                        .copyWith(fontWeight: FontWeight.w800),
                  ),
                  SizedBox(height: 12),
                  TextField(
                      decoration: InputDecoration(
                    labelText: 'Email',
                    prefixIcon: Icon(CupertinoIcons.at),
                  )),
                  SizedBox(height: 8),
                  TextField(
                      decoration: InputDecoration(
                    labelText: 'Password',
                    prefixIcon: Icon(CupertinoIcons.lock),
                  )),
                  SizedBox(
                    height: 8,
                  ),
                  SizedBox(
                      width: double.infinity,
                      height: 48,
                      child:
                          ElevatedButton(onPressed: () {}, child: Text('Save')))
                ],
              ),
            )
          ],
        ),
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
        width: 100,
        height: 100,
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

enum _SkillType { lightroom, xd, illustrator, afterEffect, premiere }
