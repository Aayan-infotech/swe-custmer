import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:southwaltoncarts_customer/app/theme/theme.dart';

import '../../generated/assets.dart';
import 'common_images.dart';
import 'common_text_view.dart';


class CommonAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final VoidCallback? onBackTap;
  final PreferredSizeWidget? bottom;
  final bool hasBackIcon,isTitleCenter,isHome;
  final List<Widget>? actions;
  final String? leadingIcon;
  final Color? bgColor;

  const CommonAppBar({
    required this.title,
    this.onBackTap,
    this.bottom,
    this.hasBackIcon = false,
    this.isTitleCenter = false,
    this.isHome = false,
    this.actions,
    this.leadingIcon,
    this.bgColor,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AppBar(
          backgroundColor: bgColor,
          leading: hasBackIcon
              ? IconButton(
              splashRadius: 24,
              onPressed: onBackTap ?? () => Navigator.of(context).pop(),
              icon: SquareSvgImageFromAsset(leadingIcon ?? Assets.svgIcBack, color: onPrimary))
              : isHome ? InkWell(
                onTap: onBackTap,
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(8),
                    bottomLeft:Radius.circular(8),
                    topRight: Radius.circular(24),
                    bottomRight: Radius.circular(24)),
                child: Container(
                  decoration: const BoxDecoration(
                    color: primary,
                    borderRadius: BorderRadius.only(topRight: Radius.circular(20),bottomRight: Radius.circular(20))
                  ),
                            child: const Icon(Icons.menu,color: onPrimary,),
                          ).paddingAll(4),
              ):const SizedBox(width: 0),
          title: CommonText.bold(title, size: 18, color: onPrimary, textAlign: TextAlign.start),
          centerTitle: isTitleCenter,
          actions: actions,
          elevation: 0,
          bottomOpacity: 0.0,
          scrolledUnderElevation: 0.0,
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(56 + (bottom?.preferredSize.height ?? 0));
}