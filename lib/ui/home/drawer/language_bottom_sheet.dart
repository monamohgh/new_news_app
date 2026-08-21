import 'package:flutter/material.dart';
import 'package:news_app/l10n/app_localizations.dart';
import 'package:news_app/utils/size_utils.dart';
import 'package:provider/provider.dart';

import '../../../providers/app_language_provider.dart';
import '../../../providers/app_theme_provider.dart';
import '../../../utils/app_styles.dart';

class LanguageBottomSheet extends StatelessWidget {
  const LanguageBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    var height=context.height;
    var width=context.width;
    var languageProvider = Provider.of<AppLanguageProvider>(context);
    var themeProvider = Provider.of<AppThemeProvider>(context);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width*.04,vertical: height*.04),
      child: Column(mainAxisSize: MainAxisSize.min,
        spacing: height*.03,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          InkWell(
            onTap: (){
            languageProvider.changeLanguage('en');
            Navigator.pop(context);
            },
              child: Text(AppLocalizations.of(context)!.english,style: AppStyles.medium20Black)),
          InkWell(
              onTap: (){
                languageProvider.changeLanguage('ar');
                Navigator.pop(context);
              },
              child: Text(AppLocalizations.of(context)!.arabic,style: AppStyles.medium20Black)),
        ],
      ),
    );
  }
}
