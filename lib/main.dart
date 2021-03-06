import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import 'constants/get_it_instance_name.dart';
import 'feature/fruit/store/fruit_store.dart';
import 'utils/injector_helpers.dart';
import 'utils/router.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initializeDependencies();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: <SingleChildWidget>[
        ChangeNotifierProvider<FruitStore>(create: (_) {
          return injector.get(instanceName: GetItInstanceName.FRUIT_STORE);
        }),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Testing',
        initialRoute: AppRouter.initialRoute,
        onGenerateRoute: (RouteSettings settings) {
          return AppRouter.navigate(settings).asRoute<dynamic>(settings);
        },
      ),
    );
  }
}
