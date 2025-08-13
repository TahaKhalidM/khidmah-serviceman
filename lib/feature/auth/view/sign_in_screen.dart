import 'package:get/get.dart';
import 'package:demandium_serviceman/utils/core_export.dart';


class SignInScreen extends StatefulWidget {
  final bool exitFromApp;
  const SignInScreen({super.key, required this.exitFromApp});

  @override
  SignInScreenState createState() => SignInScreenState();
}


class SignInScreenState extends State<SignInScreen> {
  final TextEditingController _phoneController = TextEditingController();
  final FocusNode _phoneFocus = FocusNode();
  final FocusNode _passwordFocus = FocusNode();
  final TextEditingController _passwordController = TextEditingController();
  String _countryDialCode='+963'; // Fixed to Syria
  bool _canExit = GetPlatform.isWeb ? true : false;

  @override
  void initState(){
    super.initState();

    if(Get.find<SplashController>().configModel?.content != null){

      if(Get.find<AuthController>().getUserCountryCode()!=''){
        _countryDialCode = Get.find<AuthController>().getUserCountryCode();
      }else{
        _countryDialCode = '+963'; // Fixed to Syria
      }
    }
    _phoneController.text =  Get.find<AuthController>().getUserNumber()
        .replaceFirst( Get.find<AuthController>().getUserCountryCode(), '');

    _passwordController.text = Get.find<AuthController>().getUserPassword();

    if(Get.find<AuthController>().getUserPassword() != "" && Get.find<AuthController>().getUserNumber() !=""){
      Get.find<AuthController>().toggleRememberMe(newValue: true, shouldUpdate: false);
    }else{
      Get.find<AuthController>().toggleRememberMe(newValue: false, shouldUpdate: false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return CustomPopScopeWidget(
      onPopInvoked: () {
        if (_canExit) {
          exit(0);
        } else {
          showCustomSnackBar('back_press_again_to_exit'.tr, type : ToasterMessageType.info);
          _canExit = true;
          Timer(const Duration(seconds: 2), () {
            _canExit = false;
          });
        }
      },
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.surface,
        body: SafeArea(child: Center(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.all(Dimensions.paddingSizeLarge),
            child: Center(
              child: GetBuilder<SplashController>(builder: (splashController) {
                return GetBuilder<AuthController>(builder: (authController) {
                  return Column(children: [
                    // GetBuilder<ThemeController>(builder: (themeController) {
                    //   return Text(
                    //         AppConstants.appName,
                    //         style: robotoBold.copyWith(
                    //           fontSize: 32,
                    //           color: themeController.darkTheme ? Colors.white : Theme.of(context).primaryColor,
                    //         ),
                    //       );
                    // }),
                    Image.asset(Images.logo,width: Dimensions.logoWidth,),
                    const SizedBox(height: Dimensions.paddingSizeExtraLarge),
                    const SizedBox(height: Dimensions.paddingSizeDefault),
                    Directionality(
                      textDirection: TextDirection.ltr,
                      child: _buildPhoneInputField(),
                    ),
                    const SizedBox(height: Dimensions.paddingSizeLarge),
                    Directionality(
                      textDirection: TextDirection.ltr,
                      child: CustomTextField(
                        title: 'password'.tr,
                        hintText: 'enter_your_password'.tr,
                        controller: _passwordController,
                        focusNode: _passwordFocus,
                        inputType: TextInputType.visiblePassword,
                        isPassword: true,
                        inputAction: TextInputAction.done,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Expanded(
                          child: ListTile(
                            onTap: () => authController.toggleRememberMe(),
                            title: Row(
                              children: [
                                SizedBox(
                                  width: 20.0,
                                  child: Checkbox(
                                    activeColor: Theme.of(context).primaryColor,
                                    value: authController.isActiveRememberMe,
                                    onChanged: (bool? isChecked) => authController.toggleRememberMe(),
                                  ),
                                ),
                                const SizedBox(width: Dimensions.paddingSizeSmall),
                                Text(
                                  'remember_me'.tr,
                                  style: robotoRegular.copyWith(fontSize: Dimensions.fontSizeDefault),
                                ),
                              ],
                            ),
                            contentPadding: EdgeInsets.zero,
                            dense: true,
                            horizontalTitleGap: 0,
                          ),
                        ),
                        TextButton(
                          style: TextButton.styleFrom(minimumSize: const Size(1, 40),backgroundColor: Theme.of(context).colorScheme.surface),
                          onPressed: () => Get.to(const ForgetPassScreen()),
                          child: Text('forgot_password?'.tr, style: robotoRegular.copyWith(
                            fontSize: Dimensions.fontSizeDefault, color: Theme.of(context).colorScheme.tertiary.withValues(alpha:0.8),)
                          ),
                        ),
                    ]),
                    const SizedBox(height: Dimensions.paddingSizeLarge),
                     CustomButton(
                      isLoading: authController.isLoading!,
                      btnTxt: 'sign_in'.tr,
                      onPressed: () => _login(authController, _countryDialCode),
                    ),
                    const SizedBox(height: Dimensions.paddingSizeDefault),
                  ]);
                });
              }),
            ),
          ),
        )),
      ),
    );
  }

  Widget _buildPhoneInputField() {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Theme.of(context).primaryColor,
            width: 1.0,
          ),
        ),
      ),
      child: Row(
        children: [
          // Syria Flag and Country Code
          Container(
            width: 120,
            padding: const EdgeInsets.symmetric(horizontal: 3),
            child: Row(
              children: [
                                 // Syria Flag
                 Container(
                   width: 25,
                   height: 18,
                   decoration: BoxDecoration(
                     borderRadius: BorderRadius.circular(2),
                     border: Border.all(color: Colors.grey.shade300),
                   ),
                   child: ClipRRect(
                     borderRadius: BorderRadius.circular(2),
                                          child: Image.asset(
                       'assets/images/Flag_Syria.png',
                       width: 25,
                       height: 18,
                       fit: BoxFit.cover,
                       errorBuilder: (context, error, stackTrace) {
                         // Fallback to a colored rectangle if flag image is not available
                         return Container(
                           width: 25,
                           height: 18,
                           decoration: BoxDecoration(
                             color: const Color(0xFFCE1126), // Syria red color
                             borderRadius: BorderRadius.circular(2),
                           ),
                           child: const Center(
                             child: Text(
                               'SY',
                               style: TextStyle(
                                 color: Colors.white,
                                 fontSize: 8,
                                 fontWeight: FontWeight.bold,
                               ),
                             ),
                           ),
                         );
                       },
                     ),
                   ),
                 ),
                const SizedBox(width: 8),
                // Country Code
                Text(
                  _countryDialCode,
                  style: robotoRegular.copyWith(
                    fontSize: Dimensions.fontSizeLarge,
                    color: Theme.of(context).textTheme.bodyLarge!.color,
                  ),
                ),
              ],
            ),
          ),
          // Phone Number Input
          Expanded(
            child: Directionality(
              textDirection: TextDirection.ltr,
              child: TextField(
                controller: _phoneController,
                focusNode: _phoneFocus,
                style: robotoRegular.copyWith(
                  color: Theme.of(context).textTheme.bodyLarge!.color!.withValues(alpha:0.8),
                ),
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.phone,
                cursorColor: Theme.of(context).primaryColor,
                textCapitalization: TextCapitalization.none,
                enabled: true,
                autofocus: false,
                autofillHints: [AutofillHints.telephoneNumber],
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.allow(RegExp('[0-9+]')),
                ],
                decoration: InputDecoration(
                  isDense: true,
                  contentPadding: const EdgeInsets.symmetric(horizontal: 5, vertical: 15),
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  hintText: 'phone_hint'.tr,
                  hintStyle: robotoRegular.copyWith(
                    color: Theme.of(context).hintColor.withValues(alpha:0.5),
                    fontSize: Dimensions.fontSizeDefault,
                  ),
                ),
                onSubmitted: (text) => FocusScope.of(context).requestFocus(_passwordFocus),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _login(AuthController authController, String countryDialCode) async {

    String password = _passwordController.text.trim();
    String phone = ValidationHelper.getValidPhone(countryDialCode+_phoneController.text, withCountryCode: true);

    if (_phoneController.text.isEmpty) {
      showCustomSnackBar('phone_hint'.tr, type: ToasterMessageType.info);
    }else if (phone == "") {
      showCustomSnackBar('invalid_phone_number'.tr, type: ToasterMessageType.info);
    }else if (password.isEmpty) {
      showCustomSnackBar('enter_password'.tr, type: ToasterMessageType.info);
    }else if (password.length < 8) {
      showCustomSnackBar('password_should_be'.tr, type: ToasterMessageType.info);
    }else {
      authController.login(phone, countryDialCode, phone, password).then((status) async {
      });
    }
  }
}
