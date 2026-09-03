import 'package:flutter/material.dart';
import 'package:news_app/l10n/app_localizations.dart';
import 'package:news_app/ui/home/drawer/drawer_item.dart';
import 'package:news_app/ui/home/drawer/theme_bottom_sheet.dart';
import 'package:news_app/utils/app_assets.dart';
import 'package:news_app/utils/app_colors.dart';
import 'package:news_app/utils/app_styles.dart';
import 'package:news_app/utils/size_utils.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../../providers/app_language_provider.dart';
import '../../../providers/app_theme_provider.dart';
import 'config_item.dart';
import 'divider_item.dart';
import 'language_bottom_sheet.dart';

class HomeDrawer extends StatefulWidget {
  final VoidCallback onDrawerItemClick;

  const HomeDrawer({super.key,required this.onDrawerItemClick});

  @override
  State<HomeDrawer> createState() => _HomeDrawerState();
}

class _HomeDrawerState extends State<HomeDrawer> {
  @override
  Widget build(BuildContext context) {
    var height = context.height;
    var languageProvider = Provider.of<AppLanguageProvider>(context);
    var themeProvider = Provider.of<AppThemeProvider>(context);
    return Column(
      children: [
        Container(
          alignment: Alignment.center,
          height: height * 0.19,
          decoration: BoxDecoration(color: AppColors.whiteColor),
          child: Text(
            AppLocalizations.of(context)!.news_app,
            style: AppStyles.bold24Black,
          ),
        ),
        InkWell(
          onTap: () {
            //todo:go to home
            widget.onDrawerItemClick();
          },
          child: DrawerItem(
            icon: SvgPicture.asset(AppAssets.homeIcon),
            title: AppLocalizations.of(context)!.go_to_home,
          ),
        ),
        DividerItem(),
        DrawerItem(
          icon: SvgPicture.asset(AppAssets.themeIcon),
          title: AppLocalizations.of(context)!.theme,
        ),
        ConfigItem(text:themeProvider.appTheme==ThemeMode.light?
        AppLocalizations.of(context)!.light:
    AppLocalizations.of(context)!.dark,
        onPressed: (){
          //todo:show theme bottom sheet
            showThemeBottomSheet();
          },
        ),
        SizedBox(height: height*.02,),
        DividerItem(),
        DrawerItem(
          icon: SvgPicture.asset(AppAssets.languageIcon),
          title: AppLocalizations.of(context)!.language,
        ),
        ConfigItem(

          text:
          languageProvider.appLanguage=='en'?
    AppLocalizations.of(context)!.english:
    AppLocalizations.of(context)!.arabic,
    onPressed: (){
      //todo:show language  bottom sheet
      showLanguageBottomSheet();
    },
    ),
      ],
    );
  }

  void showLanguageBottomSheet(){
    showModalBottomSheet(
      context: context,
      builder:(context) => LanguageBottomSheet(),
    );
  }

  void showThemeBottomSheet(){
    showModalBottomSheet(
      context: context,
      builder:(context) => ThemeBottomSheet(),
    );
  }
}
