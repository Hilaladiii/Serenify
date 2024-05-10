import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:serenify/bloc/auth/auth_bloc.dart';
import 'package:serenify/presentations/pages/auth/register_page.dart';
import 'package:serenify/presentations/pages/main_page.dart';
import 'package:serenify/presentations/widgets/button.dart';
import 'package:serenify/presentations/widgets/button_auth.dart';
import 'package:serenify/presentations/widgets/snackbar.dart';
import 'package:serenify/presentations/widgets/text_field.dart';
import 'package:serenify/styles/my_colors.dart';
import 'package:serenify/styles/my_text.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: BlocConsumer<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is LoginFetchFailure) {
              mySnackBar(context, state.status);
            }
            if (state is LoginFetchSuccess) {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) {
                return const MainPage();
              }));
            }
          },
          builder: (context, state) {
            return Stack(
              children: [
                Positioned.fill(
                  child: Image.asset(
                    'assets/images/authImage.png',
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned.fill(
                  child: Container(
                    decoration:
                        BoxDecoration(color: Colors.blue.withOpacity(0.5)),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 22),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const Spacer(),
                      SvgPicture.asset(
                        'assets/svgs/serenify_logo.svg',
                        color: Colors.white,
                      ),
                      const Spacer(),
                      Text(
                        'Selamat Datang \nKembali!',
                        style: MyTextStyle.h11bold(color: Colors.white),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      MyTextField(
                          label: 'Email',
                          controller: emailController,
                          hint: "Masukkan Email",
                          fieldType: Type.email,
                          isObsecure: false),
                      const SizedBox(
                        height: 16,
                      ),
                      MyTextField(
                          label: 'Kata Sandi',
                          controller: passwordController,
                          hint: "Masukkan kata sandi",
                          fieldType: Type.password,
                          isObsecure: true),
                      const SizedBox(
                        height: 11,
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: GestureDetector(
                          onTap: () {},
                          child: const Text(
                            'Lupa kata sandi?',
                            style: TextStyle(
                                color: Colors.white,
                                decoration: TextDecoration.underline,
                                decorationColor: Colors.white),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 29,
                      ),
                      Button(
                          label: (state is LoginFetchLoading)
                              ? "Loading..."
                              : 'Masuk',
                          color: MyColors.tertiary400,
                          backgroundColor: Colors.white,
                          size: Size.big,
                          onPressed: () {
                            if (emailController.text != "" &&
                                passwordController.text != "") {
                              context.read<AuthBloc>().add(LoginEvent(
                                  email: emailController.text.trim(),
                                  password: passwordController.text.trim()));
                            }
                          }),
                      const Spacer(),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 22),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              width: 80,
                              height: 1,
                              color: Colors.white,
                            ),
                            Text(
                              'atau',
                              style: MyTextStyle.h8reg(color: Colors.white),
                            ),
                            Container(
                              width: 80,
                              height: 1,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ),
                      const Spacer(),
                      ButtonAuth(
                          icon: 'google.svg',
                          label: 'Masuk dengan google',
                          onPressed: () {}),
                      ButtonAuth(
                          icon: 'facebook.svg',
                          label: 'Masuk dengan facebook',
                          onPressed: () {}),
                      const Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Belum memiliki akun?',
                            style: MyTextStyle.h7reg(color: Colors.white),
                          ),
                          GestureDetector(
                              onTap: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return const RegisterPage();
                                }));
                              },
                              child: const Text(
                                'Daftar',
                                style: TextStyle(
                                    decoration: TextDecoration.underline,
                                    color: Colors.white,
                                    decorationColor: Colors.white,
                                    fontSize: 13),
                              ))
                        ],
                      ),
                      const Spacer()
                    ],
                  ),
                )
              ],
            );
          },
        ));
  }
}
