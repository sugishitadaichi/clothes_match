import 'package:flutter/material.dart';
import 'common_colors.dart';
import 'common_fonts.dart';

//ログイン・新規登録ボタン
class LoginButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final double width;
  final double height;
  final Color backgroundColor;
  final TextStyle textStyle;

  const LoginButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.width = 160.0,
    this.height = 48.0,
    this.backgroundColor = CommonColors.commonButtonBackground,
    this.textStyle = CommonFonts.commonButtonStyle,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          backgroundColor: backgroundColor,
        ),
        child: Text(
          text,
          style: textStyle,
        ),
      ),
    );
  }
}

//アプリ内の進むボタン
class ForwardButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final double width;
  final double height;
  final Color backgroundColor;
  final TextStyle textStyle;

  const ForwardButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.width = 129.0,
    this.height = 48.0,
    this.backgroundColor = CommonColors.commonButtonBackground,
    this.textStyle = CommonFonts.commonButtonStyle,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          backgroundColor: backgroundColor,
        ),
        child: Text(
          text,
          style: textStyle,
        ),
      ),
    );
  }
}

//戻るボタン(Flutter標準のBackButtonと区別するためCustomBackButton)
class CustomBackButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final double width;
  final double height;
  final Color backgroundColor;
  final TextStyle textStyle;

  const CustomBackButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.width = 129.0,
    this.height = 48.0,
    this.backgroundColor = CommonColors.backButtonBackground,
    this.textStyle = CommonFonts.backButtonStyle,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          backgroundColor: backgroundColor,
        ),
        child: Text(
          text,
          style: textStyle,
        ),
      ),
    );
  }
}

//備品・書籍追加ボタン
class AddItemButton extends StatelessWidget {
  final Icon? icon;
  final VoidCallback onPressed;
  final double width;
  final double height;
  final Color backgroundColor;
  final Color iconColor;

  const AddItemButton({
    super.key,
    this.icon,
    required this.onPressed,
    this.width = 72.0,
    this.height = 72.0,
    this.backgroundColor = CommonColors.commonButtonBackground,
    this.iconColor = CommonColors.commonButtonColor,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: FloatingActionButton(
        heroTag: 'addItem',
        backgroundColor: backgroundColor,
        foregroundColor: iconColor,
        onPressed: onPressed,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(width / 2),
        ),
        //FontAwesomeIcons.plusを使用
        child: icon,
      ),
    );
  }
}

//書籍検索・備品一覧ボタン
class ViewSwitchButton extends StatelessWidget {
  final Icon? icon;
  final VoidCallback onPressed;
  final double width;
  final double height;
  final Color backgroundColor;
  final Color iconColor;

  const ViewSwitchButton({
    super.key,
    required this.icon,
    required this.onPressed,
    this.width = 48.0,
    this.height = 48.0,
    this.backgroundColor = CommonColors.viewSwitchButtonBackground,
    this.iconColor = CommonColors.commonButtonColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: backgroundColor,
        shape: BoxShape.circle,
      ),
      child: FloatingActionButton(
        heroTag: 'viewSwitch',
        backgroundColor: backgroundColor,
        foregroundColor: iconColor,
        onPressed: onPressed,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(width / 2),
        ),
        child: icon,
      ),
    );
  }
}

//書籍一覧の検索ボタン
class BookSearchButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final double width;
  final double height;
  final Color backgroundColor;
  final TextStyle textStyle;

  const BookSearchButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.width = 81.0,
    this.height = 40.0,
    this.backgroundColor = CommonColors.commonButtonBackground,
    this.textStyle = CommonFonts.commonButtonStyle,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          backgroundColor: backgroundColor,
        ),
        child: Text(
          text,
          style: textStyle,
        ),
      ),
    );
  }
}

//書籍検索・備品一覧全削除ボタン
class EquipmentClearButton extends StatelessWidget {
  final Icon? icon;
  final VoidCallback onPressed;
  final double width;
  final double height;
  final Color backgroundColor;
  final Color iconColor;

  const EquipmentClearButton({
    super.key,
    required this.icon,
    required this.onPressed,
    this.width = 72.0,
    this.height = 72.0,
    this.backgroundColor = Colors.red,
    this.iconColor = CommonColors.commonButtonColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: backgroundColor,
        shape: BoxShape.circle,
      ),
      child: FloatingActionButton(
        heroTag: 'equipmentClear',
        backgroundColor: backgroundColor,
        foregroundColor: iconColor,
        onPressed: onPressed,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(width / 2),
        ),
        child: icon,
      ),
    );
  }
}

//ドロップダウン
class CommonDropdownButton extends StatelessWidget {
  final String? selectedOption;
  final Function(String?) onChanged;
  final double width;
  final double height;
  final List<String> items;

  const CommonDropdownButton({
    super.key,
    this.selectedOption,
    required this.onChanged,
    this.width = 96.0,
    this.height = 24.0,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        border:
            Border.all(color: CommonColors.buttonExplanationFlame, width: 1.0),
        borderRadius: BorderRadius.circular(8),
      ),
      child: DropdownButton<String>(
        value: selectedOption,
        icon: const Icon(
          Icons.arrow_drop_down,
          color: CommonColors.dropdownButtonIconColor,
        ),
        items: items.map<DropdownMenuItem<String>>((String time) {
          return DropdownMenuItem<String>(
            value: time,
            child: Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Text(
                time,
                style: CommonFonts.minimumStyle,
              ),
            ),
          );
        }).toList(),
        onChanged: onChanged,
        isExpanded: true,
        //下線を非表示
        underline: const SizedBox(),
        //ドロップダウンボタンの背景色
        dropdownColor: CommonColors.commonBackground,
      ),
    );
  }
}

//テキストボタン（画面遷移はNavigator.pop処理のように左から右へ遷移）
class CommonTextButton extends StatelessWidget {
  final String label; // ボタンのラベル
  final Widget destinationPage; // 遷移先のページ

  const CommonTextButton({
    super.key,
    required this.label,
    required this.destinationPage,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        Navigator.of(context).push(
          PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) =>
                destinationPage,
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              // 左から右への遷移アニメーション
              const begin = Offset(-1.0, 0.0);
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
      },
      child: Text(
        label,
        style: CommonFonts.commonStyle.copyWith(
          decoration: TextDecoration.underline,
          decorationThickness: 2.0,
        ),
      ),
    );
  }
}
