import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

Widget netWorkImage(String imageUrl,
    {double? height, double? width, BoxFit fit = BoxFit.cover}) {
  return CachedNetworkImage(
    imageUrl: imageUrl,
    height: height,
    width: width,
    fit: fit,
    placeholder: (context, url) {
      return Container(
        decoration: const BoxDecoration(color: Colors.grey),
        child: const CircularProgressIndicator(),
      );
    },
    errorWidget: (context, url, error) {
      return Container(
        decoration: const BoxDecoration(color: Colors.grey),
        child: const Center(
          child: Text(
            "加载失败",
            style: TextStyle(color: Colors.black),
          ),
        ),
      );
    },
  );
}
