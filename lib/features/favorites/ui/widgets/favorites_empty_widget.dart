import 'package:flutter/material.dart';
import 'package:surf_places/assets/images/app_svg_icons.dart';
import 'package:surf_places/assets/strings/app_strings.dart';
import 'package:surf_places/uikit/images/svg_picture_widget.dart';
import 'package:surf_places/uikit/themes/colors/app_color_theme.dart';
import 'package:surf_places/uikit/themes/text/app_text_theme.dart';

class FavoritesEmptyWidget extends StatelessWidget {
  const FavoritesEmptyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final colorTheme = AppColorTheme.of(context);
    final textTheme = AppTextTheme.of(context);

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPictureWidget(
            AppSvgIcons.icEmptyVisited,
            color: colorTheme.textSecondaryVariant,
          ),
          const SizedBox(height: 32),
          Text(
            AppStrings.favoritesEmptyTitle,
            style: textTheme.subtitle.copyWith(color: colorTheme.textInactive),
          ),
        ],
      ),
    );
  }
}
