import 'package:guide_selective_process/src/core/app.binding.dart';
import 'package:guide_selective_process/src/core/routes/pages.routes.dart';
import 'package:guide_selective_process/src/core/styles/apptheme.style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';

class MyAppView extends StatefulWidget {
  const MyAppView({super.key});

  @override
  State<MyAppView> createState() => _MyAppViewState();
}

class _MyAppViewState extends State<MyAppView> {
  // This widget is the root of your application.
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);
          if (!currentFocus.hasPrimaryFocus) {
            currentFocus.unfocus();
            FocusManager.instance.primaryFocus?.unfocus();
          }
        },
        child: GetMaterialApp(
          title: "Variação do Ativo",
          debugShowCheckedModeBanner: false,
          theme: AppTheme.themeData,
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale('pt', 'BR'),
          ],
          getPages: PagesRoutes.routes,
          initialRoute: PagesRoutes.INITIAL,
          initialBinding: AppBinding(),
        ));
  }
}
