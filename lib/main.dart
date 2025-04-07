import 'package:flutter/foundation.dart';
import 'package:fluxstore/exports/app_exports.dart';

// import 'package:device_preview/device_preview.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (kIsWeb) {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: "AIzaSyDEHuboaneZqAEp0ubJZQScKy0uj6qHPf0",
        authDomain: "fluxstore-f3d3a.firebaseapp.com",
        projectId: "fluxstore-f3d3a",
        storageBucket: "fluxstore-f3d3a.firebasestorage.app",
        messagingSenderId: "681657905883",
        appId: "1:681657905883:web:0542ae16b9cfa4426792fe",
      ),
    );
  }
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
