import 'dart:async';

import 'package:Homey/app_data_manager.dart';
import 'package:Homey/core/helpers/sql_helper/database.dart';
import 'package:Homey/core/helpers/utils.dart';
import 'package:Homey/core/router.dart';
import 'package:Homey/design/colors.dart';
import 'package:flare_flutter/flare_cache.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

final GetIt getIt = GetIt.instance;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  FlareCache.doesPrune = false;

  await warmUpFlare();
  runApp(ProviderScope(
    overrides: [
      sharedPreferencesProvider
          .overrideWithValue(await SharedPreferences.getInstance()),
      databaseProvider.overrideWithValue(await initDatabase()),
      applicationDocumentsDirectoryProvider
          .overrideWithValue(await getApplicationDocumentsDirectory()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      routerConfig: ref.watch(goRouterProvider),
      title: 'Homey',
      theme: ThemeData(
        useMaterial3: true,

        colorScheme: const ColorScheme(
            brightness: Brightness.dark,
            primary: ColorsTheme.primary,
            secondary: ColorsTheme.accent,
            background: ColorsTheme.background,
            surface: ColorsTheme.background,
            onBackground: ColorsTheme.background,
            error: ColorsTheme.error,
            onError: ColorsTheme.onError,
            onPrimary: Colors.black,
            onSecondary: ColorsTheme.accent,
            onSurface: Colors.white,
            outline: Colors.grey),
        appBarTheme: const AppBarTheme(
          elevation: 0,
          color: Colors.transparent,
        ),
        chipTheme: ChipThemeData(
          backgroundColor: ColorsTheme.primary,
          disabledColor: ColorsTheme.primary,
          selectedColor: ColorsTheme.primary,
          //ColorsTheme.primary
          secondarySelectedColor: ColorsTheme.backgroundCard,
          padding: const EdgeInsets.all(4),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(32),
          ),
          labelStyle: const TextStyle(
            color: Colors.black,
          ),
          secondaryLabelStyle: const TextStyle(
            color: Colors.white,
          ),
          side: BorderSide.none,
          brightness: Brightness.dark,
          labelPadding: const EdgeInsets.symmetric(horizontal: 8),
          selectedShadowColor: ColorsTheme.backgroundCard,
        ),

        // colorScheme: ColorScheme(
        //   brightness: Brightness.dark, primary: null
        // ),
        // sec: ColorsTheme.accent,
        // primaryColor: ColorsTheme.primary,
        // buttonColor: ColorsTheme.primary,
        inputDecorationTheme: const InputDecorationTheme(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(32)),
            borderSide: BorderSide(width: 3.0),
          ),
        ),
        brightness: Brightness.dark,
        scaffoldBackgroundColor: ColorsTheme.background,
        dialogBackgroundColor: ColorsTheme.backgroundCard,
        cardTheme:
            const CardTheme(elevation: 20, color: ColorsTheme.backgroundCard),
      ),

//       home: Scaffold(
//         body: FutureBuilder<dynamic>(
//           future: Future.wait<dynamic>(<Future<dynamic>>[
//             SqlHelper().initDatabase(),
// //            Future<dynamic>.delayed(const Duration(seconds: 2)),
//           ]).then<dynamic>((data) async {
//             return AppDataManager().fetchData();
//           }),
//           builder: (context, snapshot) {
//             log('snapshot data', error: snapshot);
//             if (snapshot.connectionState == ConnectionState.waiting ||
//                 snapshot.connectionState == ConnectionState.none) {
//               return Center(
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: <Widget>[
//                     Image.asset(
//                       'assets/images/Logo.png',
//                       height: 60,
//                     ),
//                     const Text(
//                       'Homey',
//                       style: TextStyle(
//                         color: Colors.white,
//                         fontFamily: 'Sriracha',
//                         fontSize: 35,
//                       ),
//                     ),
//                     const CircularProgressIndicator()
//                   ],
//                 ),
//               );
//             } else {
//               if (snapshot.hasData && snapshot.data.isNotEmpty) {
//                 return Menu();
//               } else {
//                 return const LoginPage();
//               }
//             }
//           },
//         ),
//       ),
    );
  }
}
