import 'package:flutter_dotenv/flutter_dotenv.dart';

extension DotenvEx on DotEnv{
  Future<void> loadEnv() async {
    await load(fileName: "assets/.env");
  }

  String get serverUrl => env['SERVER_URL']??'';
  String get clientKey => env['CLIENT_KEY']??'';
  String get appID => env['APP_ID']??'';
}