import 'package:clothes_match/View/Component/common_app_bar.dart';
import 'package:clothes_match/View/Component/common_button.dart';
import 'package:clothes_match/View/Component/common_colors.dart';
import 'package:clothes_match/View/Component/common_fonts.dart';
import 'package:clothes_match/View/Component/common_text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class NewUserRegistrationPage extends StatefulWidget {
  const NewUserRegistrationPage({super.key});

  @override
  State<NewUserRegistrationPage> createState() =>
      _NewUserRegistrationPageState();
}

class _NewUserRegistrationPageState extends State<NewUserRegistrationPage> {
  String email = "";
  String password = "";

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String? _newUserRegistrationEmailError;
  String? _newUserRegistrationPasswordError;

  void _newUserRegistrationValidateForm() {
    setState(() {
      _newUserRegistrationEmailError = _emailValidator(_emailController.text);
      _newUserRegistrationPasswordError =
          _passwordValidator(_passwordController.text);
    });

    if (_newUserRegistrationEmailError == null &&
        _newUserRegistrationPasswordError == null) {
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
      appBar: const CommonAppBar(title: '新規ユーザー登録'),
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
                        errorText: _newUserRegistrationEmailError,
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
                        errorText: _newUserRegistrationPasswordError,
                        onChanged: (value) {
                          password = value;
                        },
                        //伏せ字
                        obscureText: true,
                      ),
                      const SizedBox(height: 48),
                      Align(
                        child: LoginButton(
                          text: '新規登録',
                          onPressed: () async {
                            //入力に誤りがないか確認
                            _newUserRegistrationValidateForm();
                            //メールアドレスとパスワードに入力ミスがなければ以下を実行
                            if (_newUserRegistrationEmailError == null &&
                                _newUserRegistrationPasswordError == null) {
                              try {
                                // Firebase Authへ登録
                                await FirebaseAuth.instance
                                    .createUserWithEmailAndPassword(
                                  email: email,
                                  password: password,
                                );
                                // 前の画面に戻る
                                if (!context.mounted) return;
                                Navigator.pop(context);
                              } on FirebaseAuthException catch (e) {
                                if (e.code == 'email-already-in-use') {
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
                                          'このメールアドレスは\n既に登録されています。',
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
                                  debugPrint('登録中に不具合が発生しました');
                                }
                              }
                            } else {
                              debugPrint('入力が正しくありません');
                            }
                          },
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
