import 'dart:developer';

import 'package:firebase_admob/firebase_admob.dart';

// 広告ターゲット
const MobileAdTargetingInfo targetingInfo = MobileAdTargetingInfo(
  testDevices: <String>['7AC426FD-8338-4B41-947C-AEF71C81A937'],
  keywords: <String>['flutterio', 'beautiful apps'],
  contentUrl: 'https://flutter.io',
  childDirected: false,
  nonPersonalizedAds: true,
);

// 広告バナーのWidget
final BannerAd myBanner = BannerAd(
  adUnitId: "ca-app-pub-9097303817244208/8550614410",
  size: AdSize.smartBanner,
  targetingInfo: targetingInfo,
  listener: (MobileAdEvent event) {
    log('BannerAd event is $event');
  },
);
