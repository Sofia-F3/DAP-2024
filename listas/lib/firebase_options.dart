// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
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
        return macos;
      case TargetPlatform.windows:
        return windows;
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
    apiKey: 'AIzaSyBiqZTF-w5iVuiJGPTLMgB99VbToPzNOKQ',
    appId: '1:356911473802:web:589d94c1293fe99b857973',
    messagingSenderId: '356911473802',
    projectId: 'dap-final',
    authDomain: 'dap-final.firebaseapp.com',
    storageBucket: 'dap-final.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyApCVKZv7qh3GryHRkzar8zmFbHaCClrFw',
    appId: '1:356911473802:android:941676bf73ea811f857973',
    messagingSenderId: '356911473802',
    projectId: 'dap-final',
    storageBucket: 'dap-final.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDbGmvkeZKLJNo0L6Qat4oAr6tV2nvRGhs',
    appId: '1:356911473802:ios:6b2a48cc14882b73857973',
    messagingSenderId: '356911473802',
    projectId: 'dap-final',
    storageBucket: 'dap-final.appspot.com',
    iosBundleId: 'com.example.listas',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDbGmvkeZKLJNo0L6Qat4oAr6tV2nvRGhs',
    appId: '1:356911473802:ios:6b2a48cc14882b73857973',
    messagingSenderId: '356911473802',
    projectId: 'dap-final',
    storageBucket: 'dap-final.appspot.com',
    iosBundleId: 'com.example.listas',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBiqZTF-w5iVuiJGPTLMgB99VbToPzNOKQ',
    appId: '1:356911473802:web:78a617b53830926b857973',
    messagingSenderId: '356911473802',
    projectId: 'dap-final',
    authDomain: 'dap-final.firebaseapp.com',
    storageBucket: 'dap-final.appspot.com',
  );
}