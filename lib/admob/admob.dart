import 'package:inp_interecole/app_id.dart';
import 'package:firebase_admob/firebase_admob.dart';

class AdMob {
  static final MobileAdTargetingInfo targetingInfo = MobileAdTargetingInfo(
    testDevices: ADMOB_APP_ID != null ? [ADMOB_APP_ID] : null,
    keywords: ['Games', 'Puzzles'],

  );

  static BannerAd buildBottomBanner() {
    return BannerAd(
        adUnitId: BOTTOM_BANNER_ID,
        size: AdSize.banner,
        listener: (MobileAdEvent event) {
          print(event);
        }
    );
  }


  static InterstitialAd buildFootballInterstitialAd() {
    return InterstitialAd(
        adUnitId: FOOTBALL_INTERSTITIAL_ID,
        targetingInfo: targetingInfo,
        listener: (MobileAdEvent event) {
          print(event);
        }
    );
  }

  static InterstitialAd buildBasketballInterstitialAd() {
    return InterstitialAd(
        adUnitId: BASKETBALL_INTERSTITIAL_ID,
        targetingInfo: targetingInfo,
        listener: (MobileAdEvent event) {
          print(event);
        }
    );
  }

  static InterstitialAd buildVolleyballInterstitialAd() {
    return InterstitialAd(
        adUnitId: VOLLEYBALL_INTERSTITIAL_ID,
        targetingInfo: targetingInfo,
        listener: (MobileAdEvent event) {
          print(event);
        }
    );
  }

  static InterstitialAd buildHandballInterstitialAd() {
    return InterstitialAd(
        adUnitId: HANDBALL_INTERSTITIAL_ID,
        targetingInfo: targetingInfo,
        listener: (MobileAdEvent event) {
          print(event);
        }
    );
  }
}