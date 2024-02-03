import 'package:new_project/ui/bottom_sheets/notice/notice_sheet.dart';
import 'package:new_project/ui/dialogs/info_alert/info_alert_dialog.dart';
import 'package:new_project/ui/views/home/home_view.dart';
import 'package:new_project/ui/views/startup/startup_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:new_project/ui/views/login/login_view.dart';
import 'package:new_project/ui/views/signup/signup_view.dart';
import 'package:new_project/ui/views/set_profile/set_profile_view.dart';
import 'package:new_project/ui/views/product_list/product_list_view.dart';
import 'package:new_project/ui/views/product/product_view.dart';
import 'package:new_project/ui/views/edit_profile/edit_profile_view.dart';
import 'package:new_project/ui/views/setting/setting_view.dart';
import 'package:new_project/ui/views/navbar/navbar_view.dart';
import 'package:new_project/services/api_service.dart';
import 'package:new_project/services/user_service.dart';
import 'package:new_project/services/auth_service.dart';
// @stacked-import

@StackedApp(
  routes: [
    MaterialRoute(page: HomeView),
    MaterialRoute(page: StartupView),
    MaterialRoute(page: LoginView),
    MaterialRoute(page: SignupView),
    MaterialRoute(page: SetProfileView),
    MaterialRoute(page: ProductListView),
    MaterialRoute(page: ProductView),
    MaterialRoute(page: EditProfileView),
    MaterialRoute(page: SettingView),
    MaterialRoute(page: NavbarView),
// @stacked-route
  ],
  dependencies: [
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: ApiService),
    LazySingleton(classType: UserService),
    LazySingleton(classType: AuthService),
// @stacked-service
  ],
  bottomsheets: [
    StackedBottomsheet(classType: NoticeSheet),
    // @stacked-bottom-sheet
  ],
  dialogs: [
    StackedDialog(classType: InfoAlertDialog),
    // @stacked-dialog
  ],
)
class App {}
