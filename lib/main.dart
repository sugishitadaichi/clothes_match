import 'package:clothes_match/View/AuthView/login_page.dart';
import 'package:clothes_match/View/Component/common_app_bar.dart';
import 'package:clothes_match/firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(ClothesMatchApp());
}

class ClothesMatchApp extends StatelessWidget {
  //ログインしているかのチェック
  final bool isLogin = FirebaseAuth.instance.currentUser != null;

  ClothesMatchApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
      ),
      //起動時にログイン状態の場合Top画面、未ログイン状態の場合はログイン画面を表示
      home: isLogin ? const TopPage() : const LoginPage(),
    );
  }
}

class TopPage extends StatefulWidget {
  const TopPage({super.key});

  @override
  State<TopPage> createState() => _TopPageState();
}

class _TopPageState extends State<TopPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(
        title: 'TOP',
        //戻るボタンなし
        automaticallyImplyLeading: false,
        //サインアウトボタン
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () async {
              await FirebaseAuth.instance.signOut();
              if (!context.mounted) return;
              //ログイン画面へ遷移
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => const LoginPage(),
                ),
                (Route<dynamic> route) => false,
              );
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'ここがTOP画面です',
            ),
          ],
        ),
      ),
    );
  }
}
