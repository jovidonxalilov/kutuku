class Routes{
  static const String splash = '/splash';
  static const String onboarding = '/onboarding';
  static const String signUp = '/sign-up';
  static const String login = '/login';
  static const String home = '/home';
  static const String productDetail = '/productDetail/:id';

  static  String product(int id) => "/productDetail/$id";
}