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
      home: const HomePage(),
      debugShowCheckedModeBanner: false,
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
          'http://localhost:3000/home?onboarding-token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJub25jZSI6ImFVbGFUMjltTlRSd2MzcHBhalZKZVVaWmJ6UlhUbTV6VmtZPSIsInN1YiI6IlUyRnNkR1ZrWDErS3ZmVnNrZWZSS1hkN09VNjVpMjdnd1YrcTJlOUtLSmJIaWxOYUMzdXlBWnFmUXpSemdoTEpKeDg0SGhVSEtwVjBGeXVSYVczbElCS1hyQ011eVNNWGJsRmg0MmtReUFZL01hNEE2OTA0Sk4rd2lrMXlIeVF6ZXFlYXh0eENMM3REb2tIa0dHVXVvSjBVZDEzRVVxN29ITWVUazhvZ3JsK2ozbTVSQWhPdVVvZlp0Q1o5cE1ZVGNsVDc3SGduWDJtUmd2RFh1NytXMGpBVVdTbWx0M09zYmw2aDFEanFGeGN1T2FYZEYrbld5MVkvbHlFR3JybkRqVVZycFVZK3doa1RZTXJ5c0dYcm5CcWhMaEJKWVZDcTNsNVkxeUoxRE81WWhkc0hCa3k0Z1kvcTUyaVo3eDU5cHgyZnBOOU5TZHFsVkJxdkJ0TlJMT0RKUUpkdjRnd243dkZCRit1azhiVjFzbDQ3Q09ia1pmK3FKTnlIbHQ2bEJEcVJ2WlUrNmY1UEtMbjJ2cHV2Z2FyckVxTzhwTWZtQ2J3b0Y3cjdlSHNqcENqakx3Qzk1MnZYYUFvMENONXoyeEhGL05UbGRZWWZWMklMQ0JXYlNUYTF4WHU4Nk9tUVF4OXl4cDhIT2ZuVTFLYnkweUVFWTRSUGNEbWlaZEJtS3dJVGVxOXNjTDlHeWRFNnZtZ2tkeVFBNzZmRTdrNnVwRWZOZnZhZG5EamVKYmN3empFbUw0WXpBMXc5VkI0UlhYVklWL3cwd0x2V0tBaTk2MllXamdwSlNaR21NZzgxSC9XVTFiM2FyWU9uWUNieGZ0eWhYTVh2YkFzNXZoMW1vWSthQ3FDUS8wNEpDRHNML0xCS09ueXpCOVU0UHNsaG10NmwxUkI1dmNJclByVVpNZHRGNzZFT1BXVCtFM1FxYnNRdXkwaGYrNCs5RWl4b09DUlFtUmtoMjFuODg3ZlhYWFVYVDdMRTNRZFFxK2wwWjNHWFJYakNEU0hFb2lzdDc0blQ4cVZJTXE0dXY1MitrWjgvQ1V3dEk0ckNmZm8zM3JFWnpDVzFZOElwcEM1WjduSURMeSszaFh3NFRaTVNldExSZi9mRG1JK2ROM2FkS1p1dXBLcVhHaEhlZkhiSkFDSDdEMDBVNGdDQjF2ampMZXNlYmx5aDRaRkljd1Iwc3ZKYTFDaDQ3bE8vblB6RTVqSjZLaWJ4NTZkWEtMZkF4UEloUXFrRUt2TE5QNzlySzZPbTFQK0pwYzVjR3M4SCIsImlhdCI6MTY4MjQyMzM5MTAzOSwiZXhwIjoxNjgzNzE5MzkxLCJ0eXBlIjoiYWNjZXNzIn0.xoIOQuNLGBhWZJIeaKXvQMjbQeNtUmGDxi5oQ6KMyRg&premium_id=1230914681&grade_name=Standard%20VIII&platform=learn_portal&device_type=Desktop'));

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
