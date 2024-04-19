import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:webview_flutter/webview_flutter.dart';

class DetailPage extends StatefulWidget {
  final String strLink, strTitle;

  const DetailPage({super.key, required this.strLink, required this.strTitle});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  late final WebViewController controller;
  late String strLinkWeb, strTitleWeb;

  @override
  void initState() {
    super.initState();
    strLinkWeb = widget.strLink;
    strTitleWeb = widget.strTitle;

    //webview controller
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(
        Uri.parse(strLinkWeb),
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: Column(
            children: [
              Text(
                strTitleWeb,
                style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black
                ),
              ),
              const SizedBox(
                height: 4,
              ),
              Text(
                strLinkWeb,
                style: const TextStyle(
                    fontSize: 12, color: Colors.black
                ),
              ),
            ],
          ),
        actions: [
          Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: GestureDetector(
                onTap: () {
                  Share.share(strLinkWeb, subject: strTitleWeb);
                },
                child: const Icon(
                  Icons.share,
                  color: Colors.black,
                ),
              ),
          )
        ],
      ),
      body: WebViewWidget(
        controller: controller,
      ),
    );
  }
}
