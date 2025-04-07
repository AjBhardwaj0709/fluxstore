import 'package:flutter/foundation.dart';
import 'package:fluxstore/exports/app_exports.dart';

// import 'package:device_preview/device_preview.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

await Firebase.initializeApp();
 
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final AuthService authService = AuthService();

    return MultiBlocProvider(
      providers: [
        BlocProvider<LoginBloc>(
          create: (context) => LoginBloc(FirebaseAuth.instance),
        ),
        BlocProvider<SignUpBloc>(
          create: (context) => SignUpBloc(FirebaseAuth.instance),
        ),
      ],

      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'FluxStore',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        initialRoute: '/', // Start with SplashScreen
        routes: AppRoutes.getRoutes(),
      ),
    );
  }
}
