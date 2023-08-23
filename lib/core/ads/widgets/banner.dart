import 'dart:io';

import 'package:design/design.dart';
import 'package:flutter/foundation.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

/// A simple app that loads a banner ad.
class AppBanner extends StatefulWidget {
  const AppBanner({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  AppBannerState createState() => AppBannerState();
}

class AppBannerState extends State<AppBanner> {
  BannerAd? _bannerAd;

  // final String _adUnitId = 'ca-app-pub-2409404877810508~3154473225';
  final String _adUnitId = 'ca-app-pub-2409404877810508/5880762810';

  @override
  void initState() {
    super.initState();
    _loadAd();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        widget.child,
        if (_bannerAd != null)
          Align(
            alignment: Alignment.bottomCenter,
            child: SafeArea(
              child: SizedBox(
                width: _bannerAd!.size.width.toDouble(),
                height: _bannerAd!.size.height.toDouble(),
                child: AdWidget(ad: _bannerAd!),
              ),
            ),
          )
      ],
    );
  }

  /// Loads and shows a banner ad.
  ///
  /// Dimensions of the ad are determined by the AdSize class.
  void _loadAd() async {
    BannerAd(
      adUnitId: _adUnitId,
      request: const AdRequest(),
      size: AdSize.banner,
      listener: BannerAdListener(
        // Called when an ad is successfully received.
        onAdLoaded: (ad) {
          setState(() {
            _bannerAd = ad as BannerAd;
          });
        },
        // Called when an ad request failed.
        onAdFailedToLoad: (ad, err) {
          ad.dispose();
        },
        // Called when an ad opens an overlay that covers the screen.
        onAdOpened: (Ad ad) {},
        // Called when an ad removes an overlay that covers the screen.
        onAdClosed: (Ad ad) {},
        // Called when an impression occurs on the ad.
        onAdImpression: (Ad ad) {},
      ),
    ).load();
  }

  @override
  void dispose() {
    _bannerAd?.dispose();
    super.dispose();
  }
}
