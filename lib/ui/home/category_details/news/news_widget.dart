import 'package:flutter/material.dart';
import 'package:news_app/api/api_manager.dart';
import 'package:news_app/l10n/app_localizations.dart';
import 'package:news_app/ui/home/category_details/news/news_item.dart';
import 'package:news_app/ui/home/widget/main_error_widget.dart';
import 'package:news_app/ui/home/widget/main_loading_widget.dart';
import 'package:news_app/utils/size_utils.dart';

import '../../../../api/model/news/news_response.dart';
import '../../../../api/model/source/source.dart';

class NewsWidget extends StatefulWidget {
  final Source source;

  const NewsWidget({super.key, required this.source});

  @override
  State<NewsWidget> createState() => _NewsWidgetState();
}

class _NewsWidgetState extends State<NewsWidget> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<NewsResponse>(
      future: ApiManager.getNewsBySourceId(widget.source.id ?? ''),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return MainLoadingWidget();
        } else if (snapshot.hasError) {
          return MainErrorWidget(
            errorMessage: AppLocalizations.of(context)!.something_went_wrong,
            onPressed: () {
              ApiManager.getNewsBySourceId(widget.source.id ?? '');
              setState(() {

              });
            },
          );
        } else if (snapshot.data?.status != 'ok') {
          return MainErrorWidget(
            errorMessage: snapshot.data!.message!,
            onPressed: () {
              ApiManager.getNewsBySourceId(widget.source.id ?? '');
              setState(() {

              });
            },
          );
        } else {
          var newsList = snapshot.data!.articles ?? [];
          return newsList.isEmpty
              ? Center(
                  child: Text(
                    AppLocalizations.of(context)!.no_news_found,
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                )
              : ListView.separated(
                  itemBuilder: (context, index) {
                    return NewsItem(news: newsList[index]);
                  },
                  itemCount: newsList.length,
                  separatorBuilder: (context, index) {
                    return SizedBox(height: context.height * .02);
                  },
                );
        }
      },
    );
  }
}
