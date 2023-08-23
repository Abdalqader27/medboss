// A simple app that loads a rewarded ad.
import 'dart:io';

import 'package:design/design.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class RewardedAds extends StatefulWidget {
  const RewardedAds({super.key, required this.child});

  final Widget child;

  @override
  RewardedAdsState createState() => RewardedAdsState();
}

class RewardedAdsState extends State<RewardedAds> {
  RewardedAd? _rewardedAd;

  final String _adUnitId = 'ca-app-pub-2409404877810508/9164685091';

  @override
  void initState() {
    super.initState();
    _loadAd();
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }

  /// Loads a rewarded ad.
  void _loadAd() {
    RewardedAd.load(
        adUnitId: _adUnitId,
        request: const AdRequest(),
        rewardedAdLoadCallback: RewardedAdLoadCallback(onAdLoaded: (ad) {
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
          _rewardedAd = ad;
        }, onAdFailedToLoad: (LoadAdError error) {
          // ignore: avoid_print
          print('RewardedAd failed to load: $error');
        }));
  }

  @override
  void dispose() {
    _rewardedAd?.dispose();
    super.dispose();
  }
}
