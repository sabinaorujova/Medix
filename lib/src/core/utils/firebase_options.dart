

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
        return macos;
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
    apiKey: 'AIzaSyBUG-mcE2GK9IEfd6r79VJN8gABwAzQ4cI',
    appId: '1:765898624337:web:4dce32ce2f05869b0d1770',
    messagingSenderId: '765898624337',
    projectId: 'fir-brewapp-14b10',
    authDomain: 'fir-brewapp-14b10.firebaseapp.com',
    storageBucket: 'fir-brewapp-14b10.appspot.com',
    measurementId: 'G-DTCQLCW585',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBJewehxpPxfWlVoKHLpeOQqATA6q_z8Es',
    appId: '1:765898624337:android:c0dd185770408ac20d1770',
    messagingSenderId: '765898624337',
    projectId: 'fir-brewapp-14b10',
    storageBucket: 'fir-brewapp-14b10.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAI-hUxj4TVUHsz78HsXN_CAqeBYYReYmQ',
    appId: '1:765898624337:ios:6c5f9d535dc123c40d1770',
    messagingSenderId: '765898624337',
    projectId: 'fir-brewapp-14b10',
    storageBucket: 'fir-brewapp-14b10.appspot.com',
    iosBundleId: 'com.example.nutriPlate',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAI-hUxj4TVUHsz78HsXN_CAqeBYYReYmQ',
    appId: '1:765898624337:ios:1e398bd1b434b77a0d1770',
    messagingSenderId: '765898624337',
    projectId: 'fir-brewapp-14b10',
    storageBucket: 'fir-brewapp-14b10.appspot.com',
    iosBundleId: 'com.example.nutriPlate.RunnerTests',
  );
}