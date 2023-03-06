import 'package:flutter/material.dart';
import 'package:scaled_app/scaled_app.dart';
import 'package:sjo/pages/new_home_page.dart';
import 'package:sjo/splash.dart';
import 'package:sjo/themes/theme.dart';

const double baseWidth = 449;
void main() {
  // ScaledWidgetsFlutterBinding.ensureInitialized(
  //   baseWidth: 449,
  //   applyScaling: (deviceWidth) => deviceWidth > 300 && deviceWidth < 420,
  // );
  runAppScaled(
    const MyApp(),
    scaleFactor: (deviceSize) {
      return deviceSize.width / baseWidth;
    },
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Optik Satria Jaya',
        theme: CustomTheme.themeData,
        home: const NewHomePage()
        // const Splash(),
        // const PageManager(),
        );
  }
}
