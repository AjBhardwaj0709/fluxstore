import 'package:fluxstore/exports/app_exports.dart';


class AppRoutes {
  static const String splash_page = '/';
  static const String login_page = 'login_page';
  static const String sign_up_page = 'signup_page';
    static const String homepage = 'homepage';

  static Map<String, Widget Function(BuildContext)> getRoutes() => {
    splash_page: (context) => SplashScreen(),
    login_page: (context) => LoginPage(),
    sign_up_page:(Context)=> SignupScreen(),
     homepage:(Context)=> HomepageScreen()
  };
}
