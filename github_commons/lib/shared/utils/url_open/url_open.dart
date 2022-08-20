import 'package:url_launcher/url_launcher.dart' as url_launcher;

import '../../../main.dart';

class UrlOpen implements IUrlOpen {
  @override
  Future<bool> launchUrl(String url) async {
    return await url_launcher.launchUrl(Uri.parse(url));
  }
}
