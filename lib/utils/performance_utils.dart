import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class PerformanceUtils {
  // Optimize images using cacheWidth and cacheHeight
  static Widget optimizedNetworkImage(
    String url, {
    double? width,
    double? height,
    BoxFit fit = BoxFit.cover,
    Widget? placeholder,
    Widget? errorWidget,
  }) {
    // Calculate cache dimensions based on device pixel ratio
    final pixelRatio = WidgetsBinding.instance.window.devicePixelRatio;
    final cacheWidth = width != null ? (width * pixelRatio).round() : null;
    final cacheHeight = height != null ? (height * pixelRatio).round() : null;

    return Image.network(
      url,
      width: width,
      height: height,
      fit: fit,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
      loadingBuilder: (context, child, loadingProgress) {
        if (loadingProgress == null) return child;
        return placeholder ??
            Center(
              child: CircularProgressIndicator(
                value:
                    loadingProgress.expectedTotalBytes != null
                        ? loadingProgress.cumulativeBytesLoaded /
                            loadingProgress.expectedTotalBytes!
                        : null,
              ),
            );
      },
      errorBuilder: (context, error, stackTrace) {
        return errorWidget ??
            Container(
              color: Colors.grey.shade200,
              child: const Center(
                child: Icon(Icons.error_outline, color: Colors.grey),
              ),
            );
      },
    );
  }

  // Debounce function for search queries
  static Function(T) debounce<T>(Function(T) callback, Duration duration) {
    Timer? timer;
    return (T param) {
      if (timer != null) {
        timer!.cancel();
      }
      timer = Timer(duration, () => callback(param));
    };
  }

  // Measure widget build time in debug mode
  static Widget measureBuildTime(Widget child, String widgetName) {
    if (kDebugMode) {
      final stopwatch = Stopwatch()..start();
      return Builder(
        builder: (context) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            stopwatch.stop();
            print('$widgetName build time: ${stopwatch.elapsedMilliseconds}ms');
          });
          return child;
        },
      );
    }
    return child;
  }
}
