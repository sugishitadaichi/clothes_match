import 'package:flutter/material.dart';
import 'common_colors.dart';

//通常のTextField
class CommonTextField extends StatelessWidget {
  final TextEditingController controller;
  final String? errorText;
  final bool obscureText;
  final double width;
  final Function(String)? onChanged;
  final bool readOnly;
  final Color? fillColor;

  const CommonTextField({
    super.key,
    required this.controller,
    required this.width,
    required this.readOnly,
    this.errorText,
    this.obscureText = false,
    this.onChanged,
    this.fillColor,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const SizedBox(height: 4),
        SizedBox(
          height: 40,
          width: width,
          child: TextField(
            controller: controller,
            obscureText: obscureText,
            readOnly: readOnly,
            cursorColor: CommonColors.commonFontColor,
            onChanged: onChanged,
            decoration: InputDecoration(
              //テキストの背景色(デフォルトは通常色)
              filled: true,
              fillColor: fillColor ?? CommonColors.commonBackground,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: errorText != null
                      ? CommonColors.errorColor
                      : CommonColors.textFieldFrame,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: errorText != null
                      ? CommonColors.errorColor
                      : CommonColors.textFieldFrame,
                  width: 2.0,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              contentPadding: const EdgeInsets.symmetric(
                vertical: 8,
                horizontal: 12,
              ),
            ),
          ),
        ),
        if (errorText != null) ...[
          const SizedBox(height: 4),
          Text(
            errorText!,
            style: const TextStyle(
              color: CommonColors.errorColor,
              fontSize: 12,
            ),
          ),
        ],
      ],
    );
  }
}

//数量入力のTextField
class QuantityTextField extends StatelessWidget {
  final TextEditingController controller;
  final String? errorText;
  final double width;
  final Function(String)? onChanged;
  final bool readOnly;
  final Color? fillColor;

  const QuantityTextField({
    super.key,
    required this.controller,
    required this.width,
    required this.readOnly,
    this.errorText,
    this.onChanged,
    this.fillColor,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const SizedBox(height: 4),
        SizedBox(
          height: 40,
          width: width,
          child: TextField(
            controller: controller,
            readOnly: readOnly,
            //入力テキストを数字のみ
            keyboardType: TextInputType.number,
            cursorColor: CommonColors.commonFontColor,
            onChanged: onChanged,
            decoration: InputDecoration(
              //テキストの背景色(デフォルトは通常色)
              filled: true,
              fillColor: fillColor ?? CommonColors.commonBackground,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: errorText != null
                      ? CommonColors.errorColor
                      : CommonColors.textFieldFrame,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: errorText != null
                      ? CommonColors.errorColor
                      : CommonColors.textFieldFrame,
                  width: 2.0,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              contentPadding: const EdgeInsets.symmetric(
                vertical: 8,
                horizontal: 12,
              ),
            ),
          ),
        ),
        if (errorText != null) ...[
          const SizedBox(height: 4),
          Text(
            errorText!,
            style: const TextStyle(
              color: CommonColors.errorColor,
              fontSize: 12,
            ),
          ),
        ],
      ],
    );
  }
}

//日付選択のTextField（選択可能）
class DeadlineTextField extends StatelessWidget {
  final TextEditingController controller;
  final String? errorText;
  final double width;
  final Function(DateTime)? onTap;
  final Function(DateTime)? onChanged;
  final Color? fillColor;

  const DeadlineTextField({
    super.key,
    required this.controller,
    required this.width,
    this.errorText,
    this.onTap,
    this.onChanged,
    this.fillColor,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const SizedBox(height: 4),
        SizedBox(
          height: 40,
          width: width,
          child: TextField(
            controller: controller,
            cursorColor: CommonColors.commonFontColor,
            onTap: () async {
              DateTime? pickedDate = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(2000),
                lastDate: DateTime(2100),
              );
              if (pickedDate != null) {
                controller.text =
                    "${pickedDate.year}/${pickedDate.month}/${pickedDate.day}";
                if (onTap != null) {
                  //ここで日付がnullでも確認画面ボタンで制御しているのでアンラップでOK
                  onTap!(pickedDate);
                }
                if (onChanged != null) {
                  onChanged!(pickedDate);
                }
              }
            },
            decoration: InputDecoration(
              filled: true,
              fillColor: fillColor ?? CommonColors.commonBackground,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: errorText != null
                      ? CommonColors.errorColor
                      : CommonColors.textFieldFrame,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: errorText != null
                      ? CommonColors.errorColor
                      : CommonColors.textFieldFrame,
                  width: 2.0,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              contentPadding: const EdgeInsets.symmetric(
                vertical: 8,
                horizontal: 12,
              ),
            ),
          ),
        ),
        if (errorText != null) ...[
          const SizedBox(height: 4),
          Text(
            errorText!,
            style: const TextStyle(
              color: CommonColors.errorColor,
              fontSize: 12,
            ),
          ),
        ],
      ],
    );
  }
}

//日付選択のTextField（選択不可）
//DatePickerのonChanged場合、final bool readOnly;では制御できないため
class NotInputDeadlineTextField extends StatelessWidget {
  final TextEditingController controller;
  final String? errorText;
  final double width;
  final bool readOnly;
  final Color? fillColor;

  const NotInputDeadlineTextField({
    super.key,
    required this.controller,
    required this.width,
    required this.readOnly,
    this.errorText,
    this.fillColor,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const SizedBox(height: 4),
        SizedBox(
          height: 40,
          width: width,
          child: TextField(
            controller: controller,
            readOnly: readOnly,
            cursorColor: CommonColors.commonFontColor,
            decoration: InputDecoration(
              filled: true,
              fillColor: fillColor ?? CommonColors.notInputBackground,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: errorText != null
                      ? CommonColors.errorColor
                      : CommonColors.textFieldFrame,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: errorText != null
                      ? CommonColors.errorColor
                      : CommonColors.textFieldFrame,
                  width: 2.0,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              contentPadding: const EdgeInsets.symmetric(
                vertical: 8,
                horizontal: 12,
              ),
            ),
          ),
        ),
        if (errorText != null) ...[
          const SizedBox(height: 4),
          Text(
            errorText!,
            style: const TextStyle(
              color: CommonColors.errorColor,
              fontSize: 12,
            ),
          ),
        ],
      ],
    );
  }
}
