import 'package:flutter/material.dart';
import 'package:news_app/utils/size_utils.dart';

class PageItem extends StatelessWidget {
  final int page;
  final bool isSelected;
  final VoidCallback onTap;
  const PageItem({
    super.key,
    required this.page,
    required this.onTap,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    var height = context.height;
    var width = context.width;
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: .only(bottom: height * 0.008),
        alignment: .center,
        padding: .symmetric(
          vertical: height * 0.004,
          horizontal: isSelected ? width * 0.025 : width * 0.016,
        ),
        decoration: BoxDecoration(
          borderRadius: .circular(8),
          border: isSelected
              ? null
              : .all(color: Theme.of(context).splashColor),
          color: isSelected
              ? Theme.of(context).splashColor
              : Theme.of(context).primaryColor,
        ),
        child: Text(
          page.toString(),
          style: isSelected
              ? Theme.of(context).textTheme.titleSmall
              : Theme.of(context).textTheme.labelMedium,
        ),
      ),
    );
  }
}