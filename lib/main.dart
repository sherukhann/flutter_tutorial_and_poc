import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

// Import for Android features.
import 'package:webview_flutter_android/webview_flutter_android.dart';

// Import for iOS features.
import 'package:webview_flutter_wkwebview/webview_flutter_wkwebview.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primarySwatch: Colors.purple,
          brightness: Brightness.light,
          textTheme: const TextTheme(
            bodyMedium: TextStyle(fontSize: 20, color: Colors.red),
          )),
      home: const Dummy(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Dummy extends StatelessWidget {
  const Dummy({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('home'),
      ),
      body: TextButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) {
                return const HomePage();
              },
            ),
          );
        },
        child: const Text('go to onboarding module'),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // state full widget
  late final WebViewController _controller;

  @override
  void initState() {
    super.initState();

    late final PlatformWebViewControllerCreationParams params;

    //platform_features
    if (WebViewPlatform.instance is WebKitWebViewPlatform) {
      params = WebKitWebViewControllerCreationParams(
        allowsInlineMediaPlayback: true,
        mediaTypesRequiringUserAction: const <PlaybackMediaTypes>{},
      );
    } else {
      params = const PlatformWebViewControllerCreationParams();
    }

    final WebViewController controller =
        WebViewController.fromPlatformCreationParams(params);

    // we have to initiate the webview controller and pass it to webview widget
    controller
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(NavigationDelegate(
        onProgress: (int progress) {
          debugPrint('WebView is loading (progress : $progress%)');
        },
        // onPageStarted: (String url) {
        //   debugPrint('Page started loading: $url');
        // },
        // onPageFinished: (String url) {
        //   debugPrint('Page finished loading: $url');
        // },
        // onWebResourceError: (WebResourceError error) {
        //   debugPrint('''
        //         Page resource error:
        //         code: ${error.errorCode}
        //         description: ${error.description}
        //         errorType: ${error.errorType}
        //         isForMainFrame: ${error.isForMainFrame}
        //   ''');
        // },
        onUrlChange: (UrlChange change) {
          debugPrint('url change to ${change.url}');
        },
      ))
      ..addJavaScriptChannel(
        'Toaster',
        onMessageReceived: (JavaScriptMessage message) {
          // IN FE SIDE: window?.Toaster?.postMessage("Toaster message");
          debugPrint('toaster message to ${message.message}');
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(message.message)),
          );
        },
      )
      ..addJavaScriptChannel(
        'OpenUrl',
        onMessageReceived: (JavaScriptMessage message) {
          // IN FE SIDE: window?.OpenUrl?.postMessage("HIII skkkk");
          debugPrint('toaster message to ${message.message}');
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(message.message)),
          );
        },
      )
      ..loadRequest(Uri.parse(
          'https://student-onboarding-devtest.byjus.com/home?onboarding-token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJub25jZSI6ImFVbGFUMjltTlRSd2MzcHBhalZKZVVaWmJ6UlhUbTV6VmtZPSIsInN1YiI6IlUyRnNkR1ZrWDEvYmZkUlNCTFRXUjBzZ1Bmdm1hYks5cG1vRks5VjNFUlVVOC9HK245cDJBdXY2ZmRYSmtJeHE0TWpQazhKenUyWm9VcW1PQ2ZxelB6QTdlNmNsM2E1bUwydnNmRFFaQmltNC9uOXA1OXJMdFpQOTlhZmZ1SGEzNjRHOXorNzV5VGQvaXV2cnBndkQzRGJqUnJ5MlVUK1haWHRhSDRTbVJkSTh3QjZBWHNjRlJPQS9FcW5yV1g2OUF1WnVmM3lUeUpWQWlvN3hVMGVCWWxJZDRBcTVXNmxjdlp4ekV3RlJIWnJJRVdEaGRMZFZUbVEyK3JxaTdvMmJ1ZDNKN3VPNkFpWlFvcVcvcC90ckpZRlMvdHhCVnMvZ29IdXI4bVh1QTlRTm11ZE9FcXZsV1QzQVN4RnV6czVwYXRDWkwzNFFiSjJhNnRpRjBIdVJ0ZnVKcWI1blVndytCaXBvcDNyUmNWRC85M1A2c2Z4SDd3UGZrbjFHckp0Q3pyc3lQRWpwVjA2SjhDTGdFOTdwenRXOXg0Nzc5Q3J4THZPV2psNzZsNHBkbWwvaHEzZHdxb2pScDNmemsxMkw2Wm5sVGZhNzZtNUhKSWpPdGhEcGZTaXhHbHdlTkQ2azhPK056MklxWFhRUGtjc3RWTnE4UlRKcGtBSElZeWZvNmZhVmVTQWVJb09KWTVZU2xkaU1peXlSUk9EdWdJWG5uT3Z5b0ZOeUw5Ynp0VmJvdVlsZGFFZnZjb1h4Mmo3djFzZmZaT3pWVDRUVUhjMk9INjM3aHlBQUpTckFGL3prSWE1YW1OaXp3a2pYdWhoY01CVXpKK2lHOFY5blZ0QnpHSlFWZnpEQXVlQkc1TnBiMCtwSy9wbU9QRmpFai9UejVLcW1iS2xYZmZPSWJ3bUkrcVBhd0R6RmQ4UEpEbFpCSFJzS1VjK2QzYmY5M0RJLzNTa0d1WkdrSVdQSWl3a01DYWdlNVRaVS8wQ21wWCtvRmdzZHRuWDliU1dPdWtMdHR4T2NpdnBFaG1mNmdJcVg2SkFEenZwcDl1bEd5VkVucEtibnp2bEdNUGc2ZGxPZmVoTElUVmFWY0JKTVhlaW03R0s1cjFFanJvWjN1emlXNG1DVEhaSTB3VFV3bWloLzlIak9SU3pyQ0NBZ1JkL2ZEV2FXaEM3d20wSmFJaStiZ0pHdHY0UHNZVFQ4cGFzeEl6T0FPczlUdi9CMTR3dHU1dko5NGlzK1B0c1hVUzdRRnlqUnEvY0RBVkxZODhVciIsImlhdCI6MTY4Mzc4OTgyODI0OCwiZXhwIjoxNjg1MDg1ODI4LCJ0eXBlIjoiYWNjZXNzIn0.0dUxFlM1Midz5o0-5L3RYia4csP11UAW4Q7gXJaVAJo&premium_id=1230914681&grade_name=Standard%20VIII&platform=learn_portal&device_type=Desktop'));

    if (controller.platform is AndroidWebViewController) {
      AndroidWebViewController.enableDebugging(true);
      (controller.platform as AndroidWebViewController)
          .setMediaPlaybackRequiresUserGesture(false);
    }

    _controller = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Onboarding Module',
        ),
        centerTitle: true,
        // backgroundColor: Colors.green,
      ),
      body: WebViewWidget(controller: _controller),
    );
  }
}
