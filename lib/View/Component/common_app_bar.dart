import 'package:clothes_match/View/Component/common_colors.dart';
import 'package:clothes_match/View/Component/common_fonts.dart';
import 'package:flutter/material.dart';

class CommonAppBar extends StatelessWidget implements PreferredSizeWidget {
  //タイトルを必須にする
  final String title;
  //左にアイコンをつける（選択可）
  final List<Widget>? actions;
  final bool automaticallyImplyLeading;
  //戻るボタンの画面遷移実装
  final VoidCallback? onLeadingPressed;
  //戻るボタン実装時の画面遷移カスタム
  final Widget Function(BuildContext)? nextPageBuilder;

  const CommonAppBar({
    super.key,
    required this.title,
    this.actions,
    //基本戻るボタンは実装
    this.automaticallyImplyLeading = true,
    this.onLeadingPressed,
    this.nextPageBuilder,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: CommonColors.appBarBackground,
      title: Text(
        title,
        style: CommonFonts.appBarTitleStyle,
      ),
      automaticallyImplyLeading: automaticallyImplyLeading,
      leading: automaticallyImplyLeading
          ? IconButton(
              icon: const Icon(Icons.arrow_back_ios),
              onPressed: onLeadingPressed ??
                  () {
                    if (nextPageBuilder != null) {
                      _navigateToNextPage(context);
                    } else {
                      // 通常の戻る処理
                      Navigator.of(context).pop();
                    }
                  },
            )
          : null,
      actions: actions,
    );
  }

  //戻るボタンと同様の画面遷移
  void _navigateToNextPage(BuildContext context) {
    if (nextPageBuilder != null) {
      Navigator.of(context).push(
        PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) =>
              nextPageBuilder!(context),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            // 左から右への遷移
            const begin = Offset(-1.0, 0.0);
            // 現在の位置
            const end = Offset.zero;
            const curve = Curves.easeInOut;

            var tween =
                Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
            var offsetAnimation = animation.drive(tween);

            return SlideTransition(
              position: offsetAnimation,
              child: child,
            );
          },
        ),
      );
    }
  }

  // PreferredSizeWidgetを実装するための処理(Barの高さを64に指定）
  @override
  Size get preferredSize => const Size.fromHeight(64);
}
