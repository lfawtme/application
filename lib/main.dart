import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Locale _locale = Locale('en');
  // This widget is The root of your application.
  ThemeMode _themeMode = ThemeMode.dark;
  @override
  Widget build(BuildContext context) {
    Color surfaceColor = Color(0x0dffffff);
    Color primaryColor = Colors.pink.shade400;

    return MaterialApp(
      title: 'Flutter Demo',
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: AppLocalizations.supportedLocales,
      locale: _locale,
      theme: _themeMode == ThemeMode.dark
          ? MyAppThemeConfig.dark().getTheme(_locale.languageCode)
          : MyAppThemeConfig.light().getTheme(_locale.languageCode),
      home: MyHomePage(toggleThemeMode: () {
        setState(() {
          if (_themeMode == ThemeMode.dark)
            _themeMode = ThemeMode.light;
          else
            _themeMode = ThemeMode.dark;
        });
      }, selectedLanguageChanged: (_Language newSelectedLanguageByUser) {
        setState(() {
          _locale = newSelectedLanguageByUser == _Language.en
              ? Locale('en')
              : Locale('fa');
        });
      }),
    );
  }
}

class MyAppThemeConfig {
  static const String faPrimaryFontFamily = 'IranYekan';
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

  ThemeData getTheme(String languageCode) {
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
          labelStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.normal),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide.none),
          filled: true,
          fillColor: surfaceColor),
      textTheme: languageCode == 'en' ? enPrimaryTextTheme : faPrimaryTextTheme,
    );
  }

  TextTheme get enPrimaryTextTheme => GoogleFonts.latoTextTheme(TextTheme(
        bodyText2: TextStyle(fontSize: 15, color: primaryTextColor),
        bodyText1: TextStyle(fontSize: 13, color: secondaryTextColor),
        headline6:
            TextStyle(fontWeight: FontWeight.bold, color: primaryTextColor),
        subtitle1: TextStyle(
            fontSize: 16, fontWeight: FontWeight.bold, color: primaryTextColor),
      ));
  TextTheme get faPrimaryTextTheme => TextTheme(
        bodyText2: TextStyle(
            height: 1.5,
            fontSize: 15,
            color: primaryTextColor,
            fontFamily: faPrimaryFontFamily),
        caption: TextStyle(fontSize: 10, fontFamily: faPrimaryFontFamily),
        button: TextStyle(fontFamily: faPrimaryFontFamily),
        bodyText1: TextStyle(
            fontSize: 14,
            height: 1.5,
            color: secondaryTextColor,
            fontFamily: faPrimaryFontFamily),
        headline6: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: primaryTextColor,
            fontFamily: faPrimaryFontFamily),
        subtitle1: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: primaryTextColor,
            fontFamily: faPrimaryFontFamily),
      );
}

class MyHomePage extends StatefulWidget {
  final Function() toggleThemeMode;
  final Function(_Language _language) selectedLanguageChanged;

  const MyHomePage(
      {super.key,
      required this.toggleThemeMode,
      required this.selectedLanguageChanged});
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  _SkillType _skill = _SkillType.lightroom;
  _Language _language = _Language.en;
  void _updateSelectedSkill(_SkillType skilltype) {
    setState(() {
      this._skill = skilltype;
    });
  }

  void _updateSelectedLanguage(_Language language) {
    widget.selectedLanguageChanged(language);
    setState(() {
      this._language = language;
    });
  }

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(
        title: Text(localization.profile),
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
                          localization.name,
                          style: Theme.of(context).textTheme.subtitle1,
                        ),
                        SizedBox(
                          height: 2,
                        ),
                        Text(localization.job),
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
                            Text(localization.location,
                                style: Theme.of(context).textTheme.caption),
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
                localization.summary,
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.fromLTRB(32, 12, 32, 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(localization.selectedLanguage),
                  CupertinoSlidingSegmentedControl<_Language>(
                      groupValue: _language,
                      thumbColor: Theme.of(context).colorScheme.primary,
                      children: {
                        _Language.en: Text(
                          localization.enLanguage,
                          style: TextStyle(fontSize: 13),
                        ),
                        _Language.fa: Text(
                          localization.faLanguage,
                          style: TextStyle(fontSize: 13),
                        ),
                      },
                      onValueChanged: (value) => {
                            if (value != null) _updateSelectedLanguage(value),
                          })
                ],
              ),
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.fromLTRB(32, 16, 32, 12),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    localization.skills,
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
                      _updateSelectedSkill(_SkillType.lightroom);
                    },
                  ),
                  Skills(
                    type: _SkillType.xd,
                    title: 'Adobe Xd',
                    imagePath: 'assets/images/xd.png',
                    shadowColor: Colors.pink,
                    isActive: _skill == _SkillType.xd,
                    onTap: () {
                      _updateSelectedSkill(_SkillType.xd);
                    },
                  ),
                  Skills(
                    type: _SkillType.illustrator,
                    title: 'Illustrator',
                    imagePath: 'assets/images/illustrator.png',
                    shadowColor: Colors.orange,
                    isActive: _skill == _SkillType.illustrator,
                    onTap: () {
                      _updateSelectedSkill(_SkillType.illustrator);
                    },
                  ),
                  Skills(
                    type: _SkillType.afterEffect,
                    title: 'After Effect',
                    imagePath: 'assets/images/after-effects.png',
                    shadowColor: Colors.blue.shade800,
                    isActive: _skill == _SkillType.afterEffect,
                    onTap: () {
                      _updateSelectedSkill(_SkillType.afterEffect);
                    },
                  ),
                  Skills(
                    type: _SkillType.premiere,
                    title: 'Premiere',
                    imagePath: 'assets/images/premiere-pro.png',
                    shadowColor: Colors.purple,
                    isActive: _skill == _SkillType.premiere,
                    onTap: () {
                      _updateSelectedSkill(_SkillType.premiere);
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
                    localization.personalInformation,
                    style: Theme.of(context)
                        .textTheme
                        .bodyText2!
                        .copyWith(fontWeight: FontWeight.w800),
                  ),
                  SizedBox(height: 12),
                  TextField(
                      decoration: InputDecoration(
                    labelText: localization.email,
                    prefixIcon: Icon(CupertinoIcons.at),
                  )),
                  SizedBox(height: 8),
                  TextField(
                      decoration: InputDecoration(
                    labelText: localization.password,
                    prefixIcon: Icon(CupertinoIcons.lock),
                  )),
                  SizedBox(
                    height: 8,
                  ),
                  SizedBox(
                      width: double.infinity,
                      height: 48,
                      child: ElevatedButton(
                          onPressed: () {}, child: Text(localization.save)))
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

enum _Language {
  en,
  fa,
}
