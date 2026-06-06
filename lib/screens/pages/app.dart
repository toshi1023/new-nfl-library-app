import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nfl_library_app/routes/router.dart';
import 'package:nfl_library_app/screens/components/loading/loading_overlay.dart';

class MyApp extends ConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Stack(
        children: [
          MaterialApp.router(
            routerDelegate: goRouter.routerDelegate,
            routeInformationParser: goRouter.routeInformationParser,
            routeInformationProvider: goRouter.routeInformationProvider,
            title: 'NFL Library',
            theme: ThemeData(
              primarySwatch: Colors.orange,
            ),
          ),
          const LoadingOverlay(),
        ],
      ),
    );
  }
}