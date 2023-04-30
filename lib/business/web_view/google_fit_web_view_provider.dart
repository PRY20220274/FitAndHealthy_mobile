import 'package:fit_healthy/persistence/remote/implements/iot_repository.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class GoogleFiWebViewProvider extends ChangeNotifier {
  final IotRepository _iotRepository;

  GoogleFiWebViewProvider(this._iotRepository);

  late WebViewController _controller;
  late String _url = '';
  late String _code = '';
  late String _tempUrl = '';

  WebViewController get controller => _controller;
  String get url => _url;
  String get code => _code;

  void initialize() {
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {},
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.contains('oauth/error')) {
              _tempUrl = request.url;
            }

            return NavigationDecision.navigate;
          },
        ),
      )
      ..setUserAgent('random')
      ..loadRequest(Uri.parse(_url));
  }

  Future<void> getGoogleAuthenticationUrl() async {
    try {
      _url = await _iotRepository.getGoogleAuthenticationUrl();
      notifyListeners();
    } on Exception catch (_) {
      rethrow;
    }
  }

  void getCode({required bool develop}) {
    if (_tempUrl.length < 1) return;

    String regex = '';

    if (develop) {
      regex = r"""[?&]authError=([^&]+).*$""";
    } else {
      regex = r"""[?&]code=([^&]+).*$""";
    }

    final match = RegExp(regex).firstMatch(_tempUrl);
    final uri = Uri.parse(match!.group(1)!);
    _code = uri.path;
    notifyListeners();
  }

  void cleanUrls() {
    _tempUrl = '';
    _code = '';
  }
}
