import 'dart:io' show File;

import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_85bet_mobile/core/internal/global.dart';
import 'package:flutter_85bet_mobile/features/themes/theme_interface.dart';
import 'package:flutter_85bet_mobile/mylogger.dart';
import 'package:flutter_85bet_mobile/res.dart';

/// Check if image [url] has cached file.
/// If url image has been cached, return image's [File] else return url.
Future<dynamic> checkCachedImage(String url) async {
//    debugPrint('checking cached image: $url');
  return await getCachedImageFile(url).then((file) async {
    if (file == null) return url;
    return await file.exists().then((exist) {
      if (exist)
        return file;
      else
        return url;
    });
  });
}

Future<Widget> networkImageWidget(
  String url, {
  BoxFit fit = BoxFit.contain,
  double imgScale = 1.0,
  Color imgColor,
  bool addPendingIconOnError = false,
  bool cacheImage = true,
}) async {
  String imageUrl = (url.startsWith('http://') || url.startsWith('https://'))
      ? url
      : '${Global.CURRENT_BASE}$url'.replaceAll('//images/', '/images/');
  final image = await Future.value(checkCachedImage(imageUrl)).then((item) {
//    debugPrint('image: $imageUrl, item: ${item.runtimeType}');
    if (item is File) {
//      debugPrint('file state: ${item.statSync()}, length: ${item.lengthSync()}');
      return Image.file(
        item,
        fit: fit,
        scale: imgScale,
        color: imgColor,
      );
    } else {
      try {
        return ExtendedImage.network(
          imageUrl,
          fit: fit,
          scale: imgScale,
          color: imgColor,
          cache: cacheImage,
          loadStateChanged: (ExtendedImageState state) {
            switch (state.extendedImageLoadState) {
              case LoadState.completed:
                return state.completedWidget;
              case LoadState.failed:
                MyLogger.warn(msg: 'load image failed: $imageUrl');
                Future.sync(() => clearDiskCachedImage(imageUrl)).then(
                    (value) => debugPrint('clean image cache result: $value'));
                if (addPendingIconOnError) return Image.asset(Res.iconPending);
                return Icon(
                  Icons.broken_image,
                  color: themeColor.iconSubColor1,
                );
              default:
                return null;
            }
          },
        );
      } catch (e) {
        MyLogger.warn(msg: 'load image error: $imageUrl');
        debugPrint(e);
      }
    }
  });
  return image;
}

FutureBuilder networkImageBuilder(
  String url, {
  BoxFit fit = BoxFit.contain,
  double imgScale = 1.0,
  Color imgColor,
  bool roundCorner = false,
  double roundParam = 6.0,
  bool addPendingIconOnError = false,
  bool cacheImage = true,
}) {
  return FutureBuilder(
    future: networkImageWidget(
      url,
      fit: fit,
      imgScale: imgScale,
      imgColor: imgColor,
      addPendingIconOnError: addPendingIconOnError,
      cacheImage: cacheImage,
    ),
    builder: (_, snapshot) {
      if (snapshot.connectionState == ConnectionState.done &&
          !snapshot.hasError) {
        if (roundCorner) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(roundParam),
            child: snapshot.data,
          );
        } else {
          return snapshot.data;
        }
      } else if (snapshot.hasError) {
        MyLogger.warn(
            msg: 'network image builder error: ${snapshot.error}',
            error: snapshot.error);
        return Icon(Icons.broken_image, color: themeColor.iconSubColor1);
      } else {
        return SizedBox.shrink();
      }
    },
  );
}
