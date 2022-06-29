import 'package:azkar/riverpod/favorite_notifier.dart';
import 'package:azkar/screens/app/main_screen.dart';
import 'package:azkar/screens/app/prayer_times_screen.dart';
import 'package:azkar/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// final favoriteProvider = StateProvider((ref) => favorite);
final favoriteProvider = ChangeNotifierProvider((ref) => FavoriteNotifier());
void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'JF Flat'),
      debugShowCheckedModeBanner: false,
      initialRoute: '/splash_screen',
      routes: {
        '/splash_screen': (context) => const SplashScreen(),
        '/main_screen': (context) => const MainScreen(),
        '/prayer_times_screen': (context) => const PrayerTimesScreen(),
      },
    );
  }
}
