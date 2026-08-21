import 'package:flutter/cupertino.dart';
import 'package:news_app/l10n/app_localizations.dart';
import 'package:news_app/providers/app_theme_provider.dart';
import 'package:news_app/utils/app_assets.dart';
import 'package:provider/provider.dart';

class Category {
  String id;
  String title;
  String image;

  Category({
    required this.id, required this.title, required this.image
  });
  /*business
  entertainment
  general
  health
  science
  sports
  technology*/
  static List<Category> getCategoriesList(bool isDark,BuildContext context) {
    return [
      Category(
          id: 'general',
          title: AppLocalizations.of(context)!.general,
          image:isDark ? AppAssets.generalLight
              :  AppAssets.generalDark
      ),
      Category(
          id: 'business',
          title: AppLocalizations.of(context)!.business,
          image:isDark ? AppAssets.businessLight
              :  AppAssets.businessDark
      ),
      Category(
          id: 'sports',
          title: AppLocalizations.of(context)!.sports,
          image:isDark ? AppAssets.sportLight
              :  AppAssets.sportDark
      ),
      Category(
          id: 'technology',
          title: AppLocalizations.of(context)!.technology,
          image:isDark ? AppAssets.technologyLight
              :  AppAssets.technologyDark
      ),
      Category(
          id: 'entertainment',
          title: AppLocalizations.of(context)!.entertainment,
          image:isDark ? AppAssets.entertainmentLight
              :  AppAssets.entertainmentDark
      ),
      Category(
          id: 'health',
          title: AppLocalizations.of(context)!.health,
          image:isDark ? AppAssets.healthLight
              :  AppAssets.healthDark
      ),
      Category(
          id: 'science',
          title: AppLocalizations.of(context)!.science,
          image:isDark ? AppAssets.scienceLight
              : AppAssets.scienceDark
      ),


    ];
  }
}