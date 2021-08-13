import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foodybite/constants/colors.dart';
import 'package:foodybite/constants/consts.dart';
import 'package:foodybite/constants/icons.dart';
import 'package:foodybite/constants/images.dart';
import 'package:foodybite/utils/size_config.dart';
import 'package:foodybite/utils/validators.dart';
import 'package:foodybite/view/Widgets/input_field.dart';
import 'package:foodybite/view/Widgets/mbutton.dart';
import 'package:foodybite/view/pages/AuthFlow/Login/login_page.dart';
import 'package:get/get.dart';
import 'package:glassmorphism/glassmorphism.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _emailController = TextEditingController();
  final _nameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  final _registerFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: SizedBox.expand(
          child: Stack(
            children: [
              SizedBox(
                height: SizeConfig.screenHeight,
                width: SizeConfig.screenWidth,
                child: Image.asset(
                  Images.register,
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                color: Colors.black54,
              ),
              SizedBox(
                height: SizeConfig.screenHeight,
                width: SizeConfig.screenWidth,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: kPadding * 2,
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: getRelativeHeight(0.04),
                      ),
                      SizedBox(
                        height: getRelativeHeight(0.04),
                      ),
                      SizedBox(
                        height: getRelativeWidth(0.4),
                        width: getRelativeWidth(0.4),
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            GlassmorphicContainer(
                              width: getRelativeWidth(0.4),
                              height: getRelativeWidth(0.4),
                              borderRadius: 120,
                              blur: 3,
                              alignment: Alignment.bottomCenter,
                              border: 0,
                              linearGradient: LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: [
                                    const Color(0xFFffffff).withOpacity(0.15),
                                    const Color(0xFFFFFFFF).withOpacity(0.05),
                                  ],
                                  stops: const [
                                    0.1,
                                    1,
                                  ]),
                              borderGradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [
                                  Colors.white.withOpacity(0.15),
                                  Colors.white.withOpacity(0.5),
                                ],
                              ),
                              child: Center(
                                child: SvgPicture.asset(
                                  MIcons.user_o,
                                  height: 50,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            Positioned(
                              right: 0,
                              bottom: 0,
                              child: Container(
                                  height: 40,
                                  width: 40,
                                  decoration: BoxDecoration(
                                      color: kPrimaryColor,
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        width: 2,
                                        color: Colors.white,
                                      )),
                                  child: const Icon(
                                    Icons.arrow_upward,
                                    color: Colors.white,
                                  )),
                            ),
                          ],
                        ),
                      ),
                      Form(
                        key: _registerFormKey,
                        child: SizedBox(
                          height: getRelativeHeight(0.5),
                          child: ListView(
                            shrinkWrap: true,
                            children: [
                              SizedBox(height: getRelativeHeight(0.05)),
                              InputField(
                                controller: _nameController,
                                hint: 'Name',
                                iconPath: MIcons.user_o,
                              ),
                              const SizedBox(height: kPadding),
                              InputField(
                                textInputType: TextInputType.emailAddress,
                                controller: _emailController,
                                hint: 'Email',
                                iconPath: MIcons.mail,
                                validator: (val) =>
                                    Validators.emailValidator(val),
                              ),
                              const SizedBox(height: kPadding),
                              InputField(
                                textInputType: TextInputType.visiblePassword,
                                isPassword: true,
                                controller: _passwordController,
                                hint: 'Password',
                                iconPath: MIcons.lock,
                                validator: (val) =>
                                    Validators.passwordValidator(val),
                              ),
                              const SizedBox(height: kPadding),
                              InputField(
                                textInputType: TextInputType.visiblePassword,
                                isPassword: true,
                                controller: _confirmPasswordController,
                                hint: 'Confirm Password',
                                iconPath: MIcons.lock,
                                validator: (val) =>
                                    Validators.confirmPasswordValidator(
                                        _passwordController.text, val),
                              ),
                              SizedBox(
                                height: getRelativeHeight(0.14),
                              )
                            ],
                          ),
                        ),
                      ),
                      const Spacer(),
                      MButton(
                        label: 'Register',
                        onTap: () {
                          _validateInput();
                        },
                      ),
                      const SizedBox(height: kPadding * 3),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Already have an account? ',
                            style:
                                Theme.of(context).textTheme.subtitle1.copyWith(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w300,
                                    ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.off(() => LoginPage());
                            },
                            child: Text(
                              'Login',
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle1
                                  .copyWith(
                                    color: kPrimaryColor,
                                    fontWeight: FontWeight.w400,
                                    decoration: TextDecoration.underline,
                                  ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: kPadding),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }

  void _validateInput() {
    if (_registerFormKey.currentState.validate()) {}
  }

  @override
  void dispose() {
    super.dispose();
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
  }
}