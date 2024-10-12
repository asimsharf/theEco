import 'package:flutter/cupertino.dart';
import 'package:theeco/app/shared/utilities/colors/the_colors.dart';
import 'package:theeco/app/shared/utilities/styles/the_styles.dart';

class TheCupertinoButton extends StatelessWidget {
  final String? text;
  final VoidCallback? onPressed;
  final bool? filled;
  final bool? disabled;
  final bool? loading;

  const TheCupertinoButton({
    super.key,
    this.text,
    this.onPressed,
    this.filled,
    this.disabled,
    this.loading,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      color: TheColors.activeBlue,
      onPressed: onPressed,
      minSize: 56,
      disabledColor: TheColors.inactiveGray,
      borderRadius: BorderRadius.circular(8),
      alignment: Alignment.center,
      child: Text(
        text ?? '',
        style: TheStyles.button,
      ),
    );
  }
}
