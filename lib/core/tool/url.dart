import 'package:url_launcher/url_launcher.dart';

class Url {
  static Future<bool> openUrl(String url) {
    return launchUrl(Uri.parse(url));
  }
}
