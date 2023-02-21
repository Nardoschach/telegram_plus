import 'package:flutter/material.dart';
import 'package:telegram_plus/blocs/app_state.dart';
import 'package:telegram_plus/blocs/app_bloc.dart';
import 'package:telegram_plus/pages/add_category_page.dart';
import 'package:telegram_plus/pages/category_page.dart';
import 'package:telegram_plus/pages/group_page.dart';
import 'package:telegram_plus/pages/image_veiw_page.dart';
import 'package:telegram_plus/pages/new_message.dart';
import 'package:telegram_plus/pages/search_page.dart';
import 'package:telegram_plus/pages/settings_page.dart';
import 'my_plus.dart';

void main() {
  var blockProvider = BlockProvider(
    appBloc: AppBloc(),
  );

  runApp(
    AppStateContainer(child: const MyApp(), blockProvider: blockProvider),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        "/settings": (context) => SettingsPage(),
        "/imageView": (context) => ImageViewPage(),
        "/newMessage": (context) => NewMessagePage(),
        "/category": (context) => CategoryPage(),
        "/addCategory": (context) => AddCategoryPage(),
        "/search": (context) => SearchPage(),
        "/group": (context) => GroupPage(),
        //
      },
      title: "My Plus",
      debugShowCheckedModeBanner: false,
      home: MyPlus(),
    );
  }
}
