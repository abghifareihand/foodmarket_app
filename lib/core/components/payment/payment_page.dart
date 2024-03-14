import 'package:flutter/material.dart';
import 'package:foodmarket_app/core/components/payment/payment_failed_page.dart';
import 'package:foodmarket_app/core/components/payment/payment_success_page.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({
    super.key,
    required this.url,
  });
  final String url;
  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  WebViewController? _controller;

  @override
  void initState() {
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
          },
          onPageStarted: (String url) {
            if (url.contains('status_code=202&transaction_status=deny')) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const PaymentFailedPage();
                  },
                ),
              );
            }
            if (url.contains('status_code=200&transaction_status=settlement')) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const PaymentSuccessPage();
                  },
                ),
              );
            }
          },
          onPageFinished: (String url) {},
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith('https://www.youtube.com/')) {
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse(widget.url));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WebViewWidget(controller: _controller!),
    );
  }
}
