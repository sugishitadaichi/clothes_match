import 'package:clothes_match/View/Component/common_app_bar.dart';
import 'package:clothes_match/View/Component/common_button.dart';
import 'package:clothes_match/View/Component/common_colors.dart';
import 'package:clothes_match/View/Component/common_fonts.dart';
import 'package:clothes_match/View/Component/common_text_field.dart';
import 'package:clothes_match/View/AuthView/new_user_registration_page.dart';
import 'package:clothes_match/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String email = "";
  String password = "";

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String? _loginEmailError;
  String? _loginPasswordError;

  void _loginValidateForm() {
    setState(() {
      _loginEmailError = _emailValidator(_emailController.text);
      _loginPasswordError = _passwordValidator(_passwordController.text);
    });

    if (_loginEmailError == null && _loginPasswordError == null) {
      // フォームが有効な場合、ログイン処理を実行
      debugPrint('ログイン処理を実行');
    } else {
      // エラーがある場合の処理
      debugPrint('入力が正しくありません');
    }
  }

  String? _emailValidator(String value) {
    if (value.isEmpty) {
      return '必須項目が正しい形式で入力されていません';
    } else if (!RegExp(r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+')
        .hasMatch(value)) {
      return '必須項目が正しい形式で入力されていません';
    }
    return null;
  }

  String? _passwordValidator(String value) {
    if (value.isEmpty) {
      return '必要項目が入力されていません';
    } else if (value.length < 6) {
      return 'パスワードは6文字以上でなければなりません';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBar(
        title: 'ようこそ',
        //戻るボタンの非表示
        automaticallyImplyLeading: false,
      ),
      backgroundColor: CommonColors.commonBackground,
      body: Center(
        child: SizedBox(
          width: 382,
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'メールアドレス',
                        style: CommonFonts.textTitleStyle,
                      ),
                      const SizedBox(height: 8),
                      CommonTextField(
                        width: 342,
                        //入力可能
                        readOnly: false,
                        controller: _emailController,
                        errorText: _loginEmailError,
                        onChanged: (value) {
                          email = value;
                        },
                      ),
                      const SizedBox(height: 32),
                      const Text(
                        'パスワード',
                        style: CommonFonts.textTitleStyle,
                      ),
                      const SizedBox(height: 8),
                      CommonTextField(
                        width: 342,
                        //入力可能
                        readOnly: false,
                        controller: _passwordController,
                        errorText: _loginPasswordError,
                        onChanged: (value) {
                          password = value;
                        },
                        obscureText: true,
                      ),
                      const SizedBox(height: 8),
                      const TextButton(
                        onPressed: null,
                        child: Text(
                          'パスワードを忘れた方はこちら',
                          style: CommonFonts.commonStyle,
                        ),
                      ),
                      const SizedBox(height: 40),
                      Align(
                        child: LoginButton(
                          text: 'ログイン',
                          onPressed: () async {
                            //入力に誤りがないか確認
                            _loginValidateForm();
                            //Firebase Authでログイン
                            try {
                              await FirebaseAuth.instance
                                  .signInWithEmailAndPassword(
                                email: email,
                                password: password,
                              );
                              //Top画面へ遷移(遷移先で戻るボタンなし)
                              if (!context.mounted) return;
                              Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const TopPage(),
                                ),
                                (Route<dynamic> route) => false,
                              );
                            } on FirebaseAuthException catch (e) {
                              if (e.code == 'invalid-credential') {
                                // ポップアップを表示
                                if (!context.mounted) return;
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: const Text(
                                        'エラー',
                                        style: CommonFonts.textTitleStyle,
                                      ),
                                      content: const Text(
                                        'メールアドレスか\nパスワードが誤っています。',
                                        style: CommonFonts.commonStyle,
                                      ),
                                      actions: <Widget>[
                                        TextButton(
                                          child: const Text(
                                            'OK',
                                            style: CommonFonts.commonStyle,
                                          ),
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                        ),
                                      ],
                                    );
                                  },
                                );
                              } else {
                                //invalid-credential以外のエラーの場合はそのエラーを表示
                                if (kDebugMode) {
                                  print(e);
                                }
                              }
                            }
                          },
                        ),
                      ),
                      const SizedBox(height: 8),
                      Align(
                        child: TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const NewUserRegistrationPage(),
                              ),
                            );
                          },
                          child: Text(
                            '新規登録はこちらへ',
                            style: CommonFonts.minimumStyle.copyWith(
                              decoration: TextDecoration.underline,
                              decorationThickness: 2.0,
                            ),
                          ),
                        ),
                      ),
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
