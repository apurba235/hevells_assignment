import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:havells_assignments/data/base_class/internet_connection_manager.dart';
import 'package:havells_assignments/data/models/image_response.dart';
import 'package:havells_assignments/presentation/home.dart';
import 'package:havells_assignments/presentation/home_provider.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';

void main() async{
  Provider.debugCheckInvalidValueType = null;
  WidgetsFlutterBinding.ensureInitialized();
  InternetConnectionManager.instance.initialize();
  await Hive.initFlutter();
  Hive.registerAdapter(ContributorAdapter());
  Hive.registerAdapter(PreviewAdapter());
  Hive.registerAdapter(AssetsAdapter());
  Hive.registerAdapter(DataAdapter());
  Hive.registerAdapter(SpellcheckInfoAdapter());
  Hive.registerAdapter(ImageResponseAdapter());
  await Hive.openBox('imageData');
  log(InternetConnectionManager.instance.isInternetConnected.toString(), name: 'Connectivity');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HomeProvider(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home:  HomeScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
