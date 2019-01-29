import 'package:inp_interecole/app_id.dart' show APP_ID;
import 'package:firebase_admob/firebase_admob.dart';

class AdMob {
  static final MobileAdTargetingInfo targetingInfo = MobileAdTargetingInfo(
    testDevices: APP_ID != null ? [APP_ID] : null,
    keywords: ['Games', 'Puzzles'],
  );

  static BannerAd buildBottomBanner() {
    return BannerAd(
        adUnitId: FirebaseAdMob.testAppId,
        size: AdSize.banner,
        listener: (MobileAdEvent event) {
          print(event);
        }
    );
  }


  static InterstitialAd buildInterstitialAd() {
    return InterstitialAd(
        adUnitId: FirebaseAdMob.testAppId,
        targetingInfo: targetingInfo,
        listener: (MobileAdEvent event) {
          print(event);
        }
    );
  }
}