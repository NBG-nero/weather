import 'package:flutter/material.dart';

class BackgroundImages {
  List<AssetImage> bImages = [];

  static List<AssetImage> bAssets(List<String> images) {
    List<AssetImage> asset = <AssetImage>[];
    for (String i in images) {
      asset.add(AssetImage(i));
    }
    return asset;
  }


}
