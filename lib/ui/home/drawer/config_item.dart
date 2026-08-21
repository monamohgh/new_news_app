import 'package:flutter/material.dart';
import 'package:news_app/l10n/app_localizations.dart';
import 'package:news_app/utils/app_colors.dart';
import 'package:news_app/utils/app_styles.dart';
import 'package:news_app/utils/size_utils.dart';

class ConfigItem extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const ConfigItem({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: context.width * .04,
        vertical: context.height * .01,
      ),
      padding: EdgeInsets.symmetric(
        vertical: context.height * .01,
        horizontal: context.width * .04,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.whiteColor),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(text, style: AppStyles.medium20White),
          IconButton(
            onPressed: onPressed,
            icon: Icon(
              Icons.arrow_drop_down_sharp,
              color: AppColors.whiteColor,
              size: 35,
            ),
          ),
        ],
      ),
    );
  }
}
