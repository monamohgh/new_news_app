import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/l10n/app_localizations.dart';
import 'package:news_app/ui/home/category_details/news/news_web_view.dart';
import 'package:news_app/ui/home/widget/custom_elevauted_button.dart';
import 'package:news_app/utils/app_colors.dart';
import 'package:news_app/utils/size_utils.dart';
import '../../../../api/model/news/news.dart';
import 'package:webview_flutter/webview_flutter.dart';

class NewsDetails extends StatefulWidget {
  final News news;

  const NewsDetails({super.key, required this.news});

  @override
  State<NewsDetails> createState() => _NewsDetailsState();
}

class _NewsDetailsState extends State<NewsDetails> {

  @override
  Widget build(BuildContext context) {
    var height=context.height;
    var width=context.width;
    return Container(padding:  EdgeInsets.symmetric(horizontal:width*.04 ,vertical:height*.04 ),
      decoration: BoxDecoration(
        color:Theme.of(context).splashColor
      ),
      child: SingleChildScrollView(
        child: Column(
          spacing: height*.01,
          mainAxisSize: MainAxisSize.min,
          children: [
            if (widget.news.urlToImage != null && widget.news.urlToImage!.isNotEmpty)
              ClipRRect(
                borderRadius:  BorderRadius.circular(8),
                child: CachedNetworkImage(
                  imageUrl: widget.news.urlToImage!,
                  placeholder: (context, url) =>
                      const Center(child: CircularProgressIndicator()),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
            Text(widget.news.content ?? '', style: Theme.of(context).textTheme.titleMedium),
            CustomElevatedButton(
              radius: 16,
              verticalPadding: height*.02,
              onPressed: () {
                //todo:view full article
                if(widget.news.url!=null&&widget.news.url!.isNotEmpty){
                  Navigator.push(context, 
                    MaterialPageRoute(builder: (context) => NewsWebView(url: widget.news.url!),)
                  );
                }
              },
              child: Text(
                AppLocalizations.of(context)!.view_full_article,
                  style: Theme.of(context).textTheme.labelLarge,
              ),
              backgroundColor:Theme.of(context).primaryColor
            ),
          ],
        ),
      ),
    );
  }
}
