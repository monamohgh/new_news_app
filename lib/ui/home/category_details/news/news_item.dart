import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:news_app/ui/home/widget/main_loading_widget.dart';
import 'package:news_app/utils/size_utils.dart';
import '../../../../api/model/news/news.dart';
import 'news_details.dart';

class NewsItem extends StatefulWidget {
  final News news;

  const NewsItem({super.key, required this.news});

  @override
  State<NewsItem> createState() => _NewsItemState();
}

class _NewsItemState extends State<NewsItem> {
  @override
  Widget build(BuildContext context) {
    var height = context.height;
    var width = context.width;
    return InkWell(
      //todo:show news details
      onTap: () {
        showNewsDetails();
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: width * .04),
        padding: EdgeInsets.symmetric(
          horizontal: width * .02,
          vertical: height * .01,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Theme.of(context).splashColor, width: 2),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: height * .02,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: CachedNetworkImage(
                imageUrl: widget.news.urlToImage ?? '',
                placeholder: (context, url) => MainLoadingWidget(),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            ),
            Text(widget.news.title ?? '', style: Theme.of(context).textTheme.labelLarge),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    'By : ${widget.news.author ?? ''}',
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                ),Text(
                 DateFormat('dd/MM/yyyy').format(DateTime.parse(widget.news.publishedAt??'')),
                  style: Theme.of(context).textTheme.labelSmall,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void showNewsDetails(){
    showModalBottomSheet(
        context: context,
        builder:  (context) {
          News news=News();
          return NewsDetails(news:widget.news ,);
        },
    );
  }
}
