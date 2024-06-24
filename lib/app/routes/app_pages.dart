import 'package:get/get.dart';

import '../modules/acknowledgment/bindings/acknowledgment_binding.dart';
import '../modules/acknowledgment/views/acknowledgment_view.dart';
import '../modules/address/bindings/address_binding.dart';
import '../modules/address/views/address_view.dart';
import '../modules/agreement/bindings/agreement_binding.dart';
import '../modules/agreement/views/agreement_view.dart';
import '../modules/contactUs/bindings/contact_us_binding.dart';
import '../modules/contactUs/views/contact_us_view.dart';
import '../modules/createNewPassword/bindings/create_new_password_binding.dart';
import '../modules/createNewPassword/views/create_new_password_view.dart';
import '../modules/damageReason/bindings/damage_reason_binding.dart';
import '../modules/damageReason/views/damage_reason_view.dart';
import '../modules/damageReport/bindings/damage_report_binding.dart';
import '../modules/damageReport/views/damage_report_view.dart';
import '../modules/dashboard/bindings/dashboard_binding.dart';
import '../modules/dashboard/views/dashboard_view.dart';
import '../modules/driverDetail/bindings/driver_detail_binding.dart';
import '../modules/driverDetail/views/driver_detail_view.dart';
import '../modules/editProfile/bindings/edit_profile_binding.dart';
import '../modules/editProfile/views/edit_profile_view.dart';
import '../modules/feedback/bindings/feedback_binding.dart';
import '../modules/feedback/views/feedback_view.dart';
import '../modules/forgotPassword/bindings/forgot_password_binding.dart';
import '../modules/forgotPassword/views/forgot_password_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/recoveryCode/bindings/recovery_code_binding.dart';
import '../modules/recoveryCode/views/recovery_code_view.dart';
import '../modules/splash/bindings/splash_binding.dart';
import '../modules/splash/views/splash_view.dart';
import '../modules/trackCart/bindings/track_cart_binding.dart';
import '../modules/trackCart/views/track_cart_view.dart';
import '../modules/welcome/bindings/welcome_binding.dart';
import '../modules/welcome/views/welcome_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.SPLASH,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.WELCOME,
      page: () => const WelcomeView(),
      binding: WelcomeBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.FORGOT_PASSWORD,
      page: () => const ForgotPasswordView(),
      binding: ForgotPasswordBinding(),
    ),
    GetPage(
      name: _Paths.RECOVERY_CODE,
      page: () => const RecoveryCodeView(),
      binding: RecoveryCodeBinding(),
    ),
    GetPage(
      name: _Paths.CREATE_NEW_PASSWORD,
      page: () => const CreateNewPasswordView(),
      binding: CreateNewPasswordBinding(),
    ),
    GetPage(
      name: _Paths.DASHBOARD,
      page: () => DashboardView(),
      binding: DashboardBinding(),
    ),
    GetPage(
      name: _Paths.EDIT_PROFILE,
      page: () => const EditProfileView(),
      binding: EditProfileBinding(),
    ),
    GetPage(
      name: _Paths.TRACK_CART,
      page: () => const TrackCartView(),
      binding: TrackCartBinding(),
    ),
    GetPage(
      name: _Paths.DRIVER_DETAIL,
      page: () => const DriverDetailView(),
      binding: DriverDetailBinding(),
    ),
    GetPage(
      name: _Paths.DAMAGE_REPORT,
      page: () => const DamageReportView(),
      binding: DamageReportBinding(),
    ),
    GetPage(
      name: _Paths.DAMAGE_REASON,
      page: () => const DamageReasonView(),
      binding: DamageReasonBinding(),
    ),
    GetPage(
      name: _Paths.ACKNOWLEDGMENT,
      page: () => const AcknowledgmentView(),
      binding: AcknowledgmentBinding(),
    ),
    GetPage(
      name: _Paths.FEEDBACK,
      page: () => const FeedbackView(),
      binding: FeedbackBinding(),
    ),
    GetPage(
      name: _Paths.ADDRESS,
      page: () => const AddressView(),
      binding: AddressBinding(),
    ),
    GetPage(
      name: _Paths.AGREEMENT,
      page: () => const AgreementView(),
      binding: AgreementBinding(),
    ),
    GetPage(
      name: _Paths.CONTACT_US,
      page: () => const ContactUsView(),
      binding: ContactUsBinding(),
    ),
  ];
}
