import 'package:construction_mobile/presentation/pages/construction_information/construction_information_page.dart';
import 'package:construction_mobile/presentation/pages/home/home_page.dart';
import 'package:construction_mobile/presentation/pages/login/login_page.dart';
import 'package:construction_mobile/presentation/pages/process_confirmation/construction_information_details/construction_information_details_page.dart';
import 'package:construction_mobile/presentation/pages/process_confirmation/process_confirmation_page.dart';
import 'package:construction_mobile/presentation/pages/register/register_page.dart';
import 'package:get/get.dart';

class AppRoutes {
  static String _home = '/home';
  static String _login = '/login';
  static String _register = '/register';
  static String _constructionInformation = '/construction_information';
  static String _processConfirmation = '/_process_confirmation';
  static String _constructionInformationDetail =
      '/construction_information_details';

  static String getHomeRouteName() => _home;

  static String getLoginRouteName() => _login;

  static String getRegisterRouteName() => _register;

  static String getConstructionInformationRouteName() =>
      _constructionInformation;

  static String getProcessConfirmationRouteName() => _processConfirmation;

  static String getConstructionInformationDetailRouteName() =>
      _constructionInformationDetail;

  static List<GetPage> routes = [
    GetPage(page: LoginPage.new, name: getLoginRouteName()),
    GetPage(page: RegisterPage.new, name: getRegisterRouteName()),
    GetPage(page: HomePage.new, name: getHomeRouteName()),
    GetPage(
      page: ConstructionInformationPage.new,
      name: getConstructionInformationRouteName(),
    ),
    GetPage(
      page: ProcessConfirmationPage.new,
      name: getProcessConfirmationRouteName(),
    ),
    GetPage(
      page: ConstructionInformationDetailPage.new,
      name: getConstructionInformationDetailRouteName(),
    ),
  ];
}
