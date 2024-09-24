import 'package:clothes_match/View/Component/common_colors.dart';
import 'package:flutter/material.dart';

// AppBar共通フォント
class CommonFonts {
  static const TextStyle appBarTitleStyle = TextStyle(
    fontSize: 32,
    fontFamily: 'NotoSansJP',
    color: CommonColors.title,
  );

  //通常のフォント
  static const TextStyle commonStyle = TextStyle(
    fontSize: 16,
    fontFamily: 'NotoSansJP',
    color: CommonColors.commonFontColor,
  );

  //小さいフォント
  static const TextStyle minimumStyle = TextStyle(
    fontSize: 12,
    fontFamily: 'NotoSansJP',
    color: CommonColors.commonFontColor,
  );

  //エラーフォント
  static const TextStyle errorStyle = TextStyle(
    fontSize: 12,
    fontFamily: 'NotoSansJP',
    color: CommonColors.errorColor,
  );

  //タイトルフォント
  static const TextStyle textTitleStyle = TextStyle(
    fontSize: 24,
    fontFamily: 'NotoSansJPBold',
    color: CommonColors.title,
  );

  //調整用フォント
  static const TextStyle adjustTextTitleStyle = TextStyle(
    fontSize: 23,
    fontFamily: 'NotoSansJPBold',
    color: CommonColors.title,
  );

  //通常のボタンフォント
  static const TextStyle commonButtonStyle = TextStyle(
    fontSize: 16,
    fontFamily: 'NotoSansJPBold',
    color: CommonColors.commonButtonColor,
  );

  //戻るボタンフォント
  static const TextStyle backButtonStyle = TextStyle(
    fontSize: 16,
    fontFamily: 'NotoSansJPBold',
    color: CommonColors.backButtonColor,
  );

  //ボタン説明のフォント
  static const TextStyle buttonExplanationStyle = TextStyle(
    fontSize: 12,
    fontFamily: 'NotoSansJP',
    color: CommonColors.title,
  );
}
