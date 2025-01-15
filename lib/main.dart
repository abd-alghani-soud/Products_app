import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_code/blocs/auth/auth_bloc.dart';
import 'package:freezed_code/views/first_page.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
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
      ],
      child: MaterialApp(
        routes: {
          FirstPage.id: (context) => const FirstPage(),
          // UpdateProductsPage.id: (context) => const UpdateProductsPage(),
        },
        debugShowCheckedModeBanner: false,
        initialRoute: FirstPage.id,
      ),
    );
  }
}
