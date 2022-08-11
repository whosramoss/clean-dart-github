import 'package:url_launcher/url_launcher.dart' as url_launcher;

import '../../../main.dart';
import '../connection/base_error.dart';

class UrlOpen implements IUrlOpen {
  @override
  Future<bool> canLaunchUrl(String url) {
    return url_launcher.canLaunchUrl(Uri.parse(url));
  }

  @override
  Future<bool> launchUrl(
    String url, {
    bool inAppWebView = false,
    bool enableJavaScript = true,
    bool enableDomStorage = true,
    Map<String, String> headers = const <String, String>{},
    String? webOnlyWindowName,
  }) async {
    try {
      var result = await url_launcher.launchUrl(
        Uri.parse(url),
        mode: inAppWebView
            ? LaunchMode.inAppWebView
            : LaunchMode.externalApplication,
        webViewConfiguration: url_launcher.WebViewConfiguration(
          enableJavaScript: enableJavaScript,
          enableDomStorage: enableDomStorage,
          headers: headers,
        ),
        webOnlyWindowName: webOnlyWindowName,
      );

      return result;
    } catch (error, stackTrace) {
      throw UrlOpenError(
        stackTrace: stackTrace,
        exception: error,
        errorMessage: error.toString(),
      );
    }
  }

  @override
  Future<void> closeWebView() {
    return url_launcher.closeInAppWebView();
  }
}
