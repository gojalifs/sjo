import 'package:flutter/material.dart';

import 'package:sjo/pages/forgot_pass_page.dart';
import 'package:sjo/model/product_model.dart';
import 'package:sjo/page_manager.dart';
import 'package:sjo/pages/home_page.dart';
import 'package:sjo/pages/new_home_page.dart';
import 'package:sjo/pages/product_detail_page/product_detail.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _loginFormKey = GlobalKey<FormState>();

  final _usernameController = TextEditingController();

  final _passwordController = TextEditingController();

  bool _isVisible = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                ImageIcon(
                  const AssetImage('assets/images/1.png'),
                  color: Theme.of(context).colorScheme.primary,
                  size: 250,
                ),
                const SizedBox(height: 20),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Login',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                ),
                const SizedBox(height: 20),
                Form(
                  key: _loginFormKey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: _usernameController,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        decoration: const InputDecoration(
                          labelText: 'Nama Pengguna',
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'nama pengguna tidak boleh kosong';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        controller: _passwordController,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        obscureText: _isVisible,
                        decoration: InputDecoration(
                          labelText: 'Kata Sandi',
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                _isVisible = !_isVisible;
                              });
                            },
                            icon: _isVisible
                                ? const Icon(Icons.visibility_rounded)
                                : const Icon(Icons.visibility_off_rounded),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Kata sandi tidak boleh kosong';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          const Text('Lupa kata sandi?'),
                          TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: ((context) => const ForgotPage()),
                                  ),
                                );
                              },
                              child: const Text('Klik di sini')),
                        ],
                      ),
                      const SizedBox(height: 10),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50),
                              ),
                            ),
                          ),
                          onPressed: () {
                            // if (_loginFormKey.currentState!.validate()) {
                            //   FocusScope.of(context).unfocus();
                            // Navigator.of(context).pushReplacement(
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) =>
                                    // const PageManager(),
                                    const NewHomePage(),
                              ),
                            );
                            // }
                          },
                          child: const Padding(
                            padding: EdgeInsets.symmetric(vertical: 10),
                            child: Text('Masuk'),
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: Text('Atau'),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(bottom: 10),
                        child: LoginMethodButton(
                          label: 'Masuk Dengan Google',
                          assetImage: 'assets/icons/google.png',
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: LoginMethodButton(
                            label: 'Masuk Dengan Apple',
                            assetImage: 'assets/icons/apple.png'),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: LoginMethodButton(
                          label: 'Buat Akun Baru',
                          assetImage: '',
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class LoginMethodButton extends StatelessWidget {
  final String label;
  final String assetImage;
  final Function()? onPressed;

  const LoginMethodButton({
    Key? key,
    required this.label,
    required this.assetImage,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          side: BorderSide(color: Theme.of(context).colorScheme.tertiary),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
        ),
        onPressed: onPressed,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              assetImage.isNotEmpty
                  ? ImageIcon(AssetImage(assetImage), color: Colors.black)
                  : const SizedBox(),
              const SizedBox(
                width: 10,
              ),
              Text(
                label,
                style: const TextStyle(
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
