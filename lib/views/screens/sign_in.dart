import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_group_1/app_settings.dart';
import 'package:flutter_group_1/views/screens/home_page.dart';
import 'package:flutter_group_1/views/widgets/app_button.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 150),
              SizedBox(
                width: 200,
                height: 200,
                child: Image.network(
                    "https://img.freepik.com/free-vector/bird-colorful-gradient-design-vector_343694-2506.jpg?size=338&ext=jpg&ga=GA1.1.1448711260.1707004800&semt=ais"),
              ),
              SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: TextFormField(
                  controller: phoneNumberController,
                  keyboardType: TextInputType.phone,
                  decoration: const InputDecoration(
                    labelText: "Phone Number",
                  ),
                  validator: (value) {
                    if (value! == 11) {
                      return null;
                    } else {
                      return "Invalid Phone number";
                    }
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: TextFormField(
                  controller: passwordController,
                  decoration: const InputDecoration(
                    labelText: "Password",
                  ),
                  obscureText: true,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "invalid Password";
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(
                height: 100,
              ),
              AppButton(
                label: "Log in",
                color: Color.fromARGB(255, 8, 118, 152),
                onTap: () async {
                  if (_formKey.currentState!.validate()) {
                    if (kDebugMode) {
                      print("Logged in");
                    }
                    final SharedPreferences prefs =
                        await SharedPreferences.getInstance();
                    await prefs.setString(AppSettings.phoneNumberSharedPrefsKey,
                        phoneNumberController.text);
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => const HomePage()),
                    );
                    passwordController.clear();
                  }
                },
              ),
              const SizedBox(
                height: 50,
              ),
              AppButton(
                label: "No account, sign up",
                color: Color.fromARGB(255, 127, 112, 112),
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
