
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyCLQ3BdJVBtFTNCSJfli2ii-x_Rqt4f9SE',
    appId: '1:281400867590:web:ae41084200d08e0f1d3c87',
    messagingSenderId: '281400867590',
    projectId: 'memorygame-40ac8',
    authDomain: 'memorygame-40ac8.firebaseapp.com',
    storageBucket: 'memorygame-40ac8.firebasestorage.app',
    measurementId: 'G-VZXJTJXYQ6',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAhy_Lflb3Fs1mn-HtbbxakMW4G3OYqHrI',
    appId: '1:281400867590:android:edb1c9bcd2dd21c21d3c87',
    messagingSenderId: '281400867590',
    projectId: 'memorygame-40ac8',
    storageBucket: 'memorygame-40ac8.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCRHLPSqg-APKyPX8kWK09htrKwX5i7Asw',
    appId: '1:281400867590:ios:9eaaa402f3c2752b1d3c87',
    messagingSenderId: '281400867590',
    projectId: 'memorygame-40ac8',
    storageBucket: 'memorygame-40ac8.firebasestorage.app',
    iosBundleId: 'com.example.memoryGame',
  );
}
