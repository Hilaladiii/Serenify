import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:serenify/presentations/pages/login_page.dart';
import 'package:serenify/presentations/widgets/button.dart';
import 'package:serenify/presentations/widgets/text_field.dart';
import 'package:serenify/styles/my_colors.dart';
import 'package:serenify/styles/my_text.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController namaController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController tanggalLahirController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Positioned.fill(
          child: Image.asset(
            'assets/images/authImage.png',
            fit: BoxFit.cover,
          ),
        ),
        Positioned.fill(
          child: Container(
            decoration: BoxDecoration(color: Colors.blue.withOpacity(0.5)),
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
                width: 156,
                height: 66,
              ),
              const Spacer(),
              Text(
                'Selamat Datang!',
                style: MyTextStyle.h11bold(color: Colors.white),
              ),
              const SizedBox(
                height: 16,
              ),
              MyTextField(
                  label: 'Nama Lengkap',
                  controller: namaController,
                  hint: "Masukkan Nama",
                  fieldType: Type.text,
                  isObsecure: false),
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
                  label: 'Tanggal Lahir',
                  controller: tanggalLahirController,
                  hint: "dd/mm/yyyy",
                  fieldType: Type.text,
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
                height: 16,
              ),
              MyTextField(
                  label: 'Konfirmasi Kata Sandi',
                  controller: confirmPasswordController,
                  hint: "Masukkan kata sandi",
                  fieldType: Type.password,
                  isObsecure: true),
              const SizedBox(
                height: 29,
              ),
              Button(
                  label: 'Daftar',
                  color: MyColors.tertiary400,
                  backgroundColor: Colors.white,
                  onPressed: () {}),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Sudah memiliki akun?',
                    style: MyTextStyle.h7reg(color: Colors.white),
                  ),
                  GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return const LoginPage();
                        }));
                      },
                      child: const Text(
                        'Masuk',
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
    ));
  }
}
