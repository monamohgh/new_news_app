import 'package:flutter/material.dart';
import 'package:news_app/api/model/category/category.dart';
import 'package:news_app/l10n/app_localizations.dart';
import 'package:news_app/providers/app_language_provider.dart';
import 'package:news_app/providers/app_theme_provider.dart';
import 'package:news_app/utils/app_colors.dart';
import 'package:provider/provider.dart';

import '../../../utils/size_utils.dart';

class CategoryItem extends StatelessWidget {
  final Category category;
  final int index;

  const CategoryItem({super.key, required this.category, required this.index});

  @override
  Widget build(BuildContext context) {
    var width = context.width;
    var height = context.height;
    var isEven = (index % 2 == 0);
    var themProvider = Provider.of<AppThemeProvider>(context);
    var languageProvider = Provider.of<AppLanguageProvider>(context);
    return Stack(
      alignment: isEven ? Alignment.bottomRight : Alignment.bottomLeft,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(24),
          child: Image.asset(category.image),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width * .04),
          child: Column(
            children: [
              Text(
                category.title,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              SizedBox(height: height * 0.05),
              Container(
                height: height*.07,
                padding: EdgeInsets.only(
                  left: isEven ? width * .04 : 0,
                  right: !isEven ? width * .04 : 0,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: AppColors.greyColor,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  textDirection: isEven ? TextDirection.ltr : TextDirection.rtl,
                  children: [
                    Text(
                      AppLocalizations.of(context)!.view_all,
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    SizedBox(width: width * .03),
                    CircleAvatar(
                      backgroundColor: Theme.of(context).primaryColor,
                      radius: 25,
                      child: Icon(
                        isEven ? Icons.arrow_forward_ios : Icons.arrow_back_ios_new,
                        color: Theme.of(context).splashColor,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: height * .02),
            ],
          ),
        ),
      ],
    );
  }
}
