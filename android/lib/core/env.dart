class Env {
  static const admobAndroidAppId = String.fromEnvironment('ADMOB_ANDROID_APP_ID', defaultValue: 'ca-app-pub-xxx~android');
  static const admobIosAppId = String.fromEnvironment('ADMOB_IOS_APP_ID', defaultValue: 'ca-app-pub-xxx~ios');
}
