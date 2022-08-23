import 'package:url_launcher/url_launcher.dart' as url_launcher;

class UrlOpen {
  Future<bool> openUrl(String url) async {
    return await url_launcher.launchUrl(Uri.parse(url));
  }
}
