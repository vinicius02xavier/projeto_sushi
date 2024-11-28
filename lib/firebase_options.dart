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
    apiKey: 'AIzaSyCEaxFr6cBPmvGDxRM_TQ4mwhcZHultOCo',
    appId: '1:106788598563:web:668cc3560916fd15ae1296',
    messagingSenderId: '106788598563',
    projectId: 'sushi-delivery-ba591',
    authDomain: 'sushi-delivery-ba591.firebaseapp.com',
    storageBucket: 'sushi-delivery-ba591.firebasestorage.app',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDdk_0Pnuvw2AfsP1pBmInlgGk_LxtTkdA',
    appId: '1:106788598563:android:cfdbfa128a93146bae1296',
    messagingSenderId: '106788598563',
    projectId: 'sushi-delivery-ba591',
    storageBucket: 'sushi-delivery-ba591.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCZmRQRHdqVMsdTnitpb62bGucRU0rKajU',
    appId: '1:106788598563:ios:f42d5a7f5a50caf3ae1296',
    messagingSenderId: '106788598563',
    projectId: 'sushi-delivery-ba591',
    storageBucket: 'sushi-delivery-ba591.firebasestorage.app',
    iosBundleId: 'com.example.helloWorld',
  );
}
