import 'dart:async';

import 'package:design/design.dart';
import 'package:flutter/foundation.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

/// A simple app that loads an interstitial ad.
class InterstitialAds extends StatefulWidget {
  const InterstitialAds({super.key, required this.child});

  final Widget child;

  @override
  InterstitialAdsState createState() => InterstitialAdsState();
}

class InterstitialAdsState extends State<InterstitialAds> {
  InterstitialAd? _interstitialAd;

  final String _adUnitId = (kDebugMode)
      ? 'ca-app-pub-3940256099942544/8691691433'
      : 'ca-app-pub-2409404877810508/4535653879';

  @override
  void initState() {
    super.initState();
    _loadAd();
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }

  /// Loads an interstitial ad.
  void _loadAd() {
    InterstitialAd.load(
        adUnitId: _adUnitId,
        request: const AdRequest(),
        adLoadCallback: InterstitialAdLoadCallback(
          // Called when an ad is successfully received.
          onAdLoaded: (InterstitialAd ad) {
            ad.fullScreenContentCallback = FullScreenContentCallback(
                // Called when the ad showed the full screen content.
                onAdShowedFullScreenContent: (ad) {},
                // Called when an impression occurs on the ad.
                onAdImpression: (ad) {},
                // Called when the ad failed to show full screen content.
                onAdFailedToShowFullScreenContent: (ad, err) {
                  ad.dispose();
                },
                // Called when the ad dismissed full screen content.
                onAdDismissedFullScreenContent: (ad) {
                  ad.dispose();
                },
                // Called when a click is recorded for an ad.
                onAdClicked: (ad) {});

            // Keep a reference to the ad so you can show it later.
            _interstitialAd = ad;
          },
          // Called when an ad request failed.
          onAdFailedToLoad: (LoadAdError error) {
            // ignore: avoid_print
            print('InterstitialAd failed to load: $error');
          },
        ));
  }

  @override
  void dispose() {
    _interstitialAd?.dispose();
    super.dispose();
  }
}
