import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';

import '../imports/imports.dart';

class CustomNetworkImage extends StatelessWidget {
  const CustomNetworkImage({
    Key? key,
    required this.imageUrl,
    this.fit = BoxFit.cover,
    this.width,
    this.height,
  }) : super(key: key);
  final String imageUrl;
  final BoxFit fit;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      width: width,
      height: height,
      filterQuality: FilterQuality.high,
      placeholder: (context, url) => const Padding(
        padding: EdgeInsets.all(8.0),
        child: Center(
          child: CircularProgressIndicator(
            color: AppColors.primary,
          ),
        ),
      ),
      errorWidget: (context, url, error) => Image.asset(
        Assets.imagesDefault,
        width: width,
        height: height,
        fit: fit,
      ),
      fit: fit,
    );
  }
}
