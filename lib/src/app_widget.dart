import 'package:acme/src/app_modules.dart';
import 'package:acme/src/shared/app/app_route.dart';
import 'package:acme/src/shared/app/app_theme.dart';
import 'package:acme/src/shared/services/alert_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AcmeApp extends StatelessWidget {
  const AcmeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: appModules,
      child: MaterialApp(
        title: "Acme",
        debugShowCheckedModeBanner: false,
        navigatorKey: AlertService.globalNavigator,
        onGenerateRoute: AppRouter.onGenerateRoutes,
        theme: AppTheme.themeData(),
      ),
    );
  }
}
