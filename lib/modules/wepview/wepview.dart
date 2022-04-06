import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewScreen extends StatelessWidget {
  WebViewScreen({Key? key, required this.url,this.val}) : super(key: key);
  final String? url;
 String? val='';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            centerTitle: true,
            title: Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: ListTile(
                    title: Text(
                  'Author: ${val!}',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.syneMono(
                    textStyle: const TextStyle(
                        color: Colors.blueGrey,
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                )))),
        body: WebView(
          initialUrl: url,
        ));
  }
}
