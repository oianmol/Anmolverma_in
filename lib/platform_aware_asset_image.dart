import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class PlatformAwareAssetImage extends StatelessWidget {
  const PlatformAwareAssetImage({
    this.asset,
    this.package,
    this.fit
  });

  final String asset;
  final String package;
  final BoxFit fit;

  @override
  Widget build(BuildContext context) {
    if (kIsWeb) {
      return Image.network(
        'assets/${package == null ? '' : 'packages/$package/'}$asset',
      fit: fit,);
    }

    return Image.asset(
      asset,
      package: package,
      fit: fit,
    );
  }
}