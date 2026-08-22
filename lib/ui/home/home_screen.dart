  import 'package:flutter/material.dart';
  import 'package:flutter_svg/flutter_svg.dart';
  import 'package:news_app/api/api_manager.dart';
  import 'package:news_app/api/model/category/category.dart';
  import 'package:news_app/l10n/app_localizations.dart';
  import 'package:news_app/providers/app_theme_provider.dart';
  import 'package:news_app/ui/home/category_fragment/category_fragment.dart';
  import 'package:news_app/ui/home/drawer/home_drawer.dart';
  import 'package:news_app/ui/home/widget/custom_text_field.dart';
  import 'package:news_app/utils/app_assets.dart';
  import 'package:news_app/utils/app_colors.dart';
  import 'package:news_app/utils/size_utils.dart';
  import 'package:provider/provider.dart';

  import '../../api/model/news/news.dart';
  import '../../api/model/source/source.dart';
  import 'category_details/source/category_details.dart';

  class HomeScreen extends StatefulWidget {
    const HomeScreen({super.key});

    @override
    State<HomeScreen> createState() => _HomeScreenState();
  }

  class _HomeScreenState extends State<HomeScreen> {
      bool isSearching=false ;
      final TextEditingController searchController = TextEditingController();

    @override
    Widget build(BuildContext context) {
      var themProvider = Provider.of<AppThemeProvider>(context);
      return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: !isSearching,
          actionsPadding: EdgeInsets.symmetric(horizontal: context.width * .02),
          actions:
          isSearching?[]
          :
          [
            InkWell(
              onTap: () {
               //todo:show search field
                setState(() {
                  isSearching=true;

                });
              },
              child: SvgPicture.asset(
                AppAssets.searchIcon,
                colorFilter: themProvider.isDarkMode()
                    ? ColorFilter.mode(AppColors.whiteColor, BlendMode.srcIn)
                    : ColorFilter.mode(AppColors.blackColor, BlendMode.srcIn),
              ),
            ),
          ],
          title: isSearching
              ? CustomTextFormField(
            onSearch: (queryText){
              if(queryText.trim().isNotEmpty){
                // ApiManager.getNewsBySourceId();
                setState(() {

                });
              }
            },
            controller: searchController,
            borderColor: Theme.of(context).splashColor,
            hintText: AppLocalizations.of(context)!.search,
            hintStyle: Theme.of(context).textTheme.headlineLarge,
            prefixIcon:Icon(Icons.search,color: Theme.of(context).splashColor,size: 25,),
            suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  isSearching = false;
                });
              },
              icon: Icon(
                Icons.close,
                color: Theme.of(context).splashColor,
              ),
            ),
          )
              : Text(
            selectedCategory == null
                ? AppLocalizations.of(context)!.home
                : selectedCategory!.title,
            style: Theme.of(context).textTheme.headlineLarge,
          ),
        ),
        drawer: Drawer(
          backgroundColor: AppColors.blackColor,
          child: HomeDrawer(onDrawerItemClick:onDrawerItemClick ,),
        ),
        body: selectedCategory == null
            ? CategoryFragment(onCategoryItemClick: onCategoryItemClick)
            : CategoryDetails(category: selectedCategory!),
      );
    }

    Category? selectedCategory;

    void onCategoryItemClick(Category newCategory) {
      //todo: newCategory=>user selected it
      selectedCategory = newCategory;
      setState(() {});
    }
    void onDrawerItemClick(){
      selectedCategory=null;
      Navigator.pop(context);
      setState(() {
      });
    }


  }
