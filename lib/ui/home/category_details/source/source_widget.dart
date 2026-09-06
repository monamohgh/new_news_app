import 'package:flutter/material.dart';
import 'package:news_app/api/model/source/source.dart';
import 'package:news_app/ui/home/category_details/news/news_widget.dart';
import 'package:news_app/ui/home/category_details/source/source_name.dart';
import 'package:news_app/utils/app_colors.dart';
import 'package:news_app/utils/size_utils.dart';

class SourceWidget extends StatefulWidget {
  final List<Source> sourcesList;
   const SourceWidget({super.key, required this.sourcesList});

  @override
  State<SourceWidget> createState() => _SourceWidgetState();
}

class _SourceWidgetState extends State<SourceWidget> {
  int selectedIndex=0;


  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: widget.sourcesList.length,
      child: Column(
        spacing: context.height*.02,
        children: [
          TabBar(
            //todo:add state  in view model to change selected index
            onTap: (index) {
              selectedIndex=index;
              setState(() {

              });
            },
            dividerColor: AppColors.transparentColor,
            indicatorColor:Theme.of(context).splashColor,
            tabAlignment:  TabAlignment.start,
            isScrollable: true,
            tabs: widget.sourcesList.map((source) {
              return SourceName(source: source, isSelected: selectedIndex==widget.sourcesList.indexOf(source));
            }).toList(),
          ),
          Expanded(child: NewsWidget(source: widget.sourcesList[selectedIndex]))
        ],
      ),
    );
  }
}
