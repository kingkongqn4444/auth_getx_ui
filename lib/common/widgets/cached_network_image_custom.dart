import '../extensions/assets.dart';

import '../../theme/theme.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CachedImageNetworkWidget extends StatelessWidget {
  final String url;
  final BoxFit? fit;
  final String? urlImageError;
  final bool isMaxSize;

  const CachedImageNetworkWidget({Key? key, required this.url, this.fit, this.urlImageError, this.isMaxSize = true}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: url,
      placeholder: (context, url) => _buildPlaceHolder(),
      errorWidget: (context, url, error) => _buildErrorWidget(),
      fit: fit ?? BoxFit.cover,
      width: isMaxSize ? double.infinity : null,
      height: isMaxSize ? double.infinity : null,
    );
  }

  Widget _buildPlaceHolder() {
    return Shimmer.fromColors(
      baseColor: AssetColors.shimmerBaseColor,
      highlightColor: AssetColors.shimmerHighlightColor,
      child: Container(
        width: isMaxSize ? double.infinity : null,
        height: isMaxSize ? double.infinity : null,
        color: Colors.white,
      ),
    );
  }

  Widget _buildErrorWidget() {
    return Image.asset(
      urlImageError ?? 'img_photo_error'.assetPathPNG,
      width: isMaxSize ? double.infinity : null,
      height: isMaxSize ? double.infinity : null,
      fit: BoxFit.cover,
    );
  }
}
