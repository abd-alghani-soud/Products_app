import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_code/blocs/auth/auth_bloc.dart';
import 'package:freezed_code/cubits/update_products/update_products_cubit.dart';
import 'package:freezed_code/views/first_page.dart';
import 'package:freezed_code/views/update_products_page.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox('productsBox');
  runApp(const MyApp());
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (BuildContext context) => AuthBloc()
            ..add(
              CheakAuthStatusEvent(),
            ),
        ),
        BlocProvider(
          create: (BuildContext context) =>
              UpdateProductsCubit()..loadSavedData(),
        ),
      ],
      child: MaterialApp(
        routes: {
          FirstPage.id: (context) => const FirstPage(),
          UpdateProductsPage.id: (context) => const UpdateProductsPage(),
        },
        debugShowCheckedModeBanner: false,
        initialRoute: FirstPage.id,
      ),
    );
  }
}
