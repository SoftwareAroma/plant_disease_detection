import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:plant_disease_detection/index.dart';

class MyWebView extends StatefulWidget {
  final String selectedUrl;
  final String? title;

  const MyWebView({
    super.key,
    required this.selectedUrl,
    this.title,
  });

  @override
  State<MyWebView> createState() => _MyWebViewState();
}

class _MyWebViewState extends State<MyWebView> {
  bool _loaded = false;
  String error = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BrandColors.kColorBackground,
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Container(
            padding: EdgeInsets.symmetric(
              vertical: 5.0.h,
              horizontal: 5.0.w,
            ),
            decoration: BoxDecoration(
              color: Colors.transparent,
              border: Border.all(
                color: BrandColors.kColorWhiteAccent,
              ),
              borderRadius: BorderRadius.circular(5.0),
            ),
            child: Center(
              child: Icon(
                LineAwesomeIcons.angle_left_solid,
                color: BrandColors.kColorWhiteAccent,
                size: 30.0,
              ),
            ),
          ),
        ),
        title: CustomText(
          text: widget.title ?? "PRIVACY POLICY",
          fontSize: 22.0.sp,
          fontWeight: FontWeight.w900,
          maxLines: 3,
          color: BrandColors.kColorWhiteAccent,
        ),
        centerTitle: true,
        backgroundColor: BrandColors.kColorDarkGreen,
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            !_loaded
                ? const LinearProgressIndicator(
                    value: null,
                    backgroundColor: Colors.grey,
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
                  )
                : Container(),
            error.isNotEmpty
                ? Expanded(
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        "HTTP 404 Error: Failed to load resource",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 30.0.sp,
                        ),
                      ),
                    ),
                  )
                : Expanded(
                    child: InAppWebView(
                      initialUrlRequest: URLRequest(url: Uri.parse(widget.selectedUrl)),
                      initialOptions: InAppWebViewGroupOptions(
                        crossPlatform: InAppWebViewOptions(
                          javaScriptEnabled: true,
                          transparentBackground: true,
                        ),
                      ),
                      onWebViewCreated: (InAppWebViewController controller) {},
                      onLoadStart: (InAppWebViewController controller, Uri? url) {
                        setState(() {
                          _loaded = false;
                        });
                      },
                      onLoadStop: (InAppWebViewController controller, Uri? url) {
                        setState(() {
                          _loaded = true;
                        });
                      },
                      onLoadError: (InAppWebViewController controller, Uri? url, int code, String message) {
                        setState(() {
                          error = message;
                        });
                      },
                      gestureRecognizers: <Factory<OneSequenceGestureRecognizer>>{}..add(
                          Factory<VerticalDragGestureRecognizer>(
                            () => VerticalDragGestureRecognizer(),
                          ),
                        ),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
