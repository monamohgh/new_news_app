import 'package:flutter/material.dart';
import 'package:news_app/utils/app_styles.dart';
import 'package:news_app/utils/size_utils.dart';

class DrawerItem extends StatelessWidget {
final  Widget icon;
final String title;
  const DrawerItem({super.key,required this.icon,required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: context.height*.02,horizontal: context.width*.04),
      child: Row(
        spacing: context.width*.02,
        children: [
        icon,
          Text(title,style: AppStyles.bold20White,)
        ],
      ),
    );
  }
}
