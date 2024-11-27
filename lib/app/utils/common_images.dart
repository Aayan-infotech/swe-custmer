
import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:southwaltoncarts_customer/app/theme/theme.dart';
import 'package:southwaltoncarts_customer/app/utils/extension.dart';

import '../gen/assets.gen.dart';


class SquareImageFromAsset extends StatelessWidget {
  final String image;
  final double size;
  final BoxFit fit;
  final Color? color;
  final bool matchTextDirection;

  const SquareImageFromAsset(
      this.image, {
        this.size = 24,
        this.fit = BoxFit.contain,
        this.color,
        this.matchTextDirection = true,
        super.key,
      });

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      image,
      fit: fit,
      color: color,
      width: size,
      height: size,
      matchTextDirection: matchTextDirection,
    );
  }
}

class CircleSvgImageFromAsset extends StatelessWidget {
  final String image;
  final double size;
  final BoxFit fit;
  final Color? color;
  final bool matchTextDirection;

  const CircleSvgImageFromAsset(
      this.image, {
        this.size = 24,
        this.fit = BoxFit.none,
        this.color,
        this.matchTextDirection = true,
        super.key,
      });

  @override
  Widget build(BuildContext context) {
    return  ClipOval(
       child: Image.asset(
             image,
             fit: fit,
             color: color,
             width: size,
             height: size,
             matchTextDirection: matchTextDirection,
       )
    );
  }
}

class SquareSvgImageFromAsset extends StatelessWidget {
  final String image;
  final double size;
  final BoxFit fit;
  final Color color;
  final bool matchTextDirection;

  const SquareSvgImageFromAsset(this.image, {this.size = 24, this.fit = BoxFit.contain, this.color=Colors.black, this.matchTextDirection = true, super.key});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(image, fit: fit, colorFilter: ColorFilter.mode(color, BlendMode.srcIn), width: size, height: size, matchTextDirection: matchTextDirection);
  }
}

class SquareImageFromNetwork extends StatelessWidget {
  final String imageUrl;
  final String? placeholder;
  final Widget? placeholderWidget;
  final double width;
  final double height;
  final BoxFit fit;
  final Color? color;
  final bool matchTextDirection;

  const SquareImageFromNetwork({
    required this.imageUrl,
    this.placeholder,
    this.placeholderWidget,
    this.width = 24,
    this.height = 24,
    this.fit = BoxFit.fill,
    this.color,
    this.matchTextDirection = true,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    if (imageUrl.isEmpty) {
      return Image.asset(placeholder ?? Assets.imagesPlaceHolder.path,
          fit: fit, width: width, height: height);
    }
    return CachedNetworkImage(
      width: width,
      height: height,
      imageUrl: imageUrl,
      // placeholder: (context, url) => Image.asset(placeholder ?? Assets.imagesNoProduct.path, fit: fit, width: size, height: size),
      errorWidget: (context, url, error) => Image.asset(
        Assets.imagesPlaceHolder.path,
        fit: fit,
        width: width,
        height: height,
      ),
      fit: fit,
      useOldImageOnUrlChange: true,
      progressIndicatorBuilder: (m, url, prog) {
        return SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Center(
            child: SizedBox(
              height: 24,
              width: 24,
              child: Platform.isIOS
                  ? const CircularProgressIndicator.adaptive(
                backgroundColor: primary,
              )
                  : const CircularProgressIndicator.adaptive(),
            ),
          ),
        );
      },
    );
  }
}

class CachedImage extends StatelessWidget {
  final String imageUrl;
  final String? placeholder;
  final Widget? placeholderWidget;
  final double width;
  final double height;
  final BoxFit fit;
  final Color? color;
  final bool matchTextDirection;

  const CachedImage({
    required this.imageUrl,
    this.placeholder,
    this.placeholderWidget,
    this.width = 24,
    this.height = 24,
    this.fit = BoxFit.contain,
    this.color,
    this.matchTextDirection = true,
    super.key,
  }) : assert(placeholder == null || placeholderWidget == null);

  @override
  Widget build(BuildContext context) {
    if (imageUrl.isEmpty) {
      return placeholderWidget ??
          (placeholder.isNullOrEmpty
              ? const SizedBox.shrink()
              : Image.asset(placeholder!, fit: fit));
    }
    return CachedNetworkImage(
      width: width,
      height: height,
      imageUrl: imageUrl,
      placeholder: (context, url) =>
      placeholderWidget ??
          (placeholder.isNullOrEmpty
              ? const SizedBox.shrink()
              : Image.asset(placeholder!, fit: fit)),
      errorWidget: (context, url, error) =>
      placeholderWidget ??
          (placeholder.isNullOrEmpty
              ? const SizedBox.shrink()
              : Image.asset(placeholder!, fit: fit)),
      fit: fit,
      useOldImageOnUrlChange: true,
    );
  }
}

