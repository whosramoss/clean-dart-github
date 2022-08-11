abstract class IUrlOpen {
  Future<bool> canLaunchUrl(String url);
  Future<bool> launchUrl(
    String url, {
    bool inAppWebView = false,
    bool enableJavaScript = true,
    bool enableDomStorage = true,
    Map<String, String> headers = const <String, String>{},
    String? webOnlyWindowName,
  });

  Future<void> closeWebView();
}
