import 'package:flutter/material.dart';
import 'package:surf_places/assets/images/app_svg_icons.dart';
import 'package:surf_places/assets/strings/app_strings.dart';
import 'package:surf_places/uikit/images/svg_picture_widget.dart';
import 'package:surf_places/uikit/themes/colors/app_color_theme.dart';
import 'package:surf_places/uikit/themes/text/app_text_theme.dart';

class DismissibleBackgroundWidget extends StatelessWidget {
  const DismissibleBackgroundWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final colorTheme = AppColorTheme.of(context);
    final textTheme = AppTextTheme.of(context);

    return DecoratedBox(
      decoration: BoxDecoration(
        color: colorTheme.error,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Align(
        alignment: Alignment.centerRight,
        child: Padding(
          padding: const EdgeInsets.only(right: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPictureWidget(
                AppSvgIcons.icBucket,
                color: colorTheme.neutralWhite,
              ),
              const SizedBox(height: 8),
              Text(
                AppStrings.delete,
                style: textTheme.text.copyWith(
                  color: colorTheme.neutralWhite,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
