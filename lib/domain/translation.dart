import 'package:get/get_navigation/src/root/internacionalization.dart';

class Translate implements Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en': {
          'a': 'Home Screen',
          'b': 'Profile Screen',
          'c': 'Cart Screen',
          'd': 'Arabic',
          'e': 'English',
          'f': "Sign In",
        },
        'ar': {
          'a': 'الصفحة الرئيسيه',
          'b': 'الصفحة الشخصية',
          'c': 'السلة',
          'd': 'عربي',
          'e': 'إتجليزي',
          'f': "تسجيل الدخول",
        }
      };
}
