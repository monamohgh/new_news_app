import 'package:flutter/material.dart';
import 'package:news_app/utils/app_colors.dart';
import 'package:news_app/utils/size_utils.dart';

class DividerItem extends StatelessWidget {
  const DividerItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Divider(
      color: AppColors.whiteColor,
      thickness: 1,
      endIndent:context.width*.06 ,
      indent: context.width*.06,
    ) ;
  }
}
