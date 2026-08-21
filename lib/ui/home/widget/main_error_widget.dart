import 'package:flutter/material.dart';
import 'package:news_app/l10n/app_localizations.dart';
import 'package:news_app/utils/app_styles.dart';
import 'package:news_app/utils/size_utils.dart';

class  MainErrorWidget extends StatelessWidget {
  final String errorMessage;
  final VoidCallback onPressed;
    const MainErrorWidget({super.key,required this.errorMessage, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding:  EdgeInsets.symmetric(horizontal: context.width*.04),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: context.height*.02,
          children: [
            Text(errorMessage,style: Theme.of(context).textTheme.labelMedium,),
            ElevatedButton(onPressed:onPressed , child:Text(AppLocalizations.of(context)!.try_again,style: AppStyles.bold16Black,) )
          ],
        ),
      ),
    );
  }
}
