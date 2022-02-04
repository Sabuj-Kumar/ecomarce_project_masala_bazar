import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:efgecom/components/alerts/custom_alert_dialog.dart';
import 'package:efgecom/components/forms/custom_form.dart';
import 'package:efgecom/components/padding/padding_height.dart';
import 'package:efgecom/components/spinners/spinner.dart';
import 'package:efgecom/components/textfields/custom_input_form_field.dart';
import 'package:efgecom/config/theme_config.dart';
import 'package:efgecom/helpers/toast.dart';
import 'package:efgecom/models/user_model.dart';
import 'package:efgecom/providers/user_provider.dart';
import 'package:efgecom/services/api_service.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  final ApiService api = ApiService();
  final formKey = GlobalKey<FormState>();

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    usernameController.dispose();
    passwordController.dispose();
  }

  void loginSubmit() async {
    try {
      loadingIndicator();
      var res =
          await api.login(usernameController.text, passwordController.text);
      Navigator.of(context).pop();
      if (res.success) {
        var data = res.data!.Rows.first;
        var user = UserModel.fromJson(data);
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString('user', userModelToString(user));
        await prefs.setString('LOGGED_TOKEN', "Bearer " + user.jwt.toString());
        var userProvider = Provider.of<UserProvider>(context, listen: false);

        await userProvider.setUser(user);
        Navigator.pushReplacementNamed(context, "/");
      } else {
        CustomToast.show(message: res.message ?? "Failed to login");
      }
    } catch (e) {
      log("Error [AuthPage::loginSubmit]", error: e);
      CustomToast.show(
          message: e.toString(), backgroundColor: Colors.redAccent);
    }
  }

  Future<void> loadingIndicator() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return const CustomAlertDialog(
          title: Text('Logging in'),
          content: Center(
            child: Spinner(),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: SafeArea(
          child: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                "Euro Food",
                style: TextStyle(fontSize: 30, color: Colors.white),
              ),
              const Padding5(),

              //Login Form
              CustomForm(
                autovalidateMode: AutovalidateMode.disabled,
                onSubmit: loginSubmit,
                submitButtonText: "Login",
                submitButtonColor: Colors.white,
                submitTextColor: primaryColor,
                backgroundColor: Colors.white,
                child: Column(
                  children: [
                    //Username
                    CustomInputFormField(
                      controller: usernameController,
                      autofocus: false,
                      autovalidateMode: AutovalidateMode.disabled,
                      prefix: const Text("Username: "),
                      placeholder: "Enter your username",
                      style: const TextStyle(color: primaryColor),
                      inputDecoration: InputDecoration(
                        label: const Text("Username: "),
                        labelStyle: const TextStyle(color: primaryColor),
                        hintText: "Enter your username",
                        hintStyle:
                            TextStyle(color: primaryColor.withOpacity(0.5)),
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                      ),
                      placeholderStyle: const TextStyle(color: primaryColor),
                      keyboardType: TextInputType.text,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter username';
                        }
                        return null;
                      },
                    ),
                    const Divider(),
                    //Password
                    CustomInputFormField(
                      obscureText: true,
                      controller: passwordController,
                      autofocus: false,
                      autovalidateMode: AutovalidateMode.disabled,
                      prefix: const Text("Password: "),
                      placeholder: "Enter your password",
                      style: const TextStyle(color: primaryColor),
                      inputDecoration: InputDecoration(
                        label: const Text("Password: "),
                        labelStyle: const TextStyle(color: primaryColor),
                        hintText: "Enter your password",
                        hintStyle:
                            TextStyle(color: primaryColor.withOpacity(0.5)),
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                      ),
                      placeholderStyle: const TextStyle(color: primaryColor),
                      keyboardType: TextInputType.text,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter password';
                        }
                        return null;
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
