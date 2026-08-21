import 'package:flutter/material.dart';
import 'package:news_app/api/model/category/category.dart';
import 'package:news_app/l10n/app_localizations.dart';
import 'package:news_app/providers/app_theme_provider.dart';
import 'package:news_app/ui/home/category_fragment/category_item.dart';
import 'package:news_app/utils/size_utils.dart';
import 'package:provider/provider.dart';
typedef OnCategoryClick=void Function(Category);
class CategoryFragment extends StatelessWidget {
  final OnCategoryClick onCategoryItemClick;
  const CategoryFragment({super.key,required this.onCategoryItemClick});

  @override
  Widget build(BuildContext context) {
    var width = context.width;
    var height = context.height;
    var themeProvider = Provider.of<AppThemeProvider>(context);
    var categoriesList = Category.getCategoriesList(
      themeProvider.isDarkMode(),
      context,
    );
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * .03),
      child: Column(
        spacing: height * .01,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppLocalizations.of(context)!.good_morning,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          Text(
            AppLocalizations.of(context)!.here_is_some_news_for_you,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          Expanded(
            child: ListView.separated(
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    //todo:click
                    onCategoryItemClick(categoriesList[index]);
                  },
                  child: CategoryItem(
                    category: categoriesList[index],
                    index: index,
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return SizedBox(height: height * .02);
              },
              itemCount: categoriesList.length,
            ),
          ),
        ],
      ),
    );
  }
}
