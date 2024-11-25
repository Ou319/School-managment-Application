import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show defaultTargetPlatform, TargetPlatform;
import 'package:flutter_gemini/flutter_gemini.dart'; 
import 'package:ofppt_project/pages/getStartedPage.dart';
import 'package:ofppt_project/pages/pages_App/ropotpage/apigeminai.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:webview_flutter_android/webview_flutter_android.dart';
import 'package:webview_flutter_wkwebview/webview_flutter_wkwebview.dart';
void main() async {

  Gemini.init(apiKey: GEMINI_API_KEY);
  WidgetsFlutterBinding.ensureInitialized(); 

  //  WebView
  if (WebViewPlatform.instance == null) {
    if (defaultTargetPlatform == TargetPlatform.android) {
      WebViewPlatform.instance = AndroidWebViewPlatform();
    } else if (defaultTargetPlatform == TargetPlatform.iOS) {
      WebViewPlatform.instance = WebKitWebViewPlatform();
    }
  }

  //  Supabase
  await Supabase.initialize(
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6IndsYXFyanFoeGxmemV3Z21hbXlmIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzE3NzcyMDEsImV4cCI6MjA0NzM1MzIwMX0.McFCWY6Y6BpmHYHERhIWbPjSh7zPrgGgWDRiabzEN3c',
    url: 'https://wlaqrjqhxlfzewgmamyf.supabase.co',
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(useMaterial3: true),
      home: const MeanRecived(), 
    );
  }
}

class MeanRecived extends StatelessWidget { 
  const MeanRecived({super.key});

  @override
  Widget build(BuildContext context) {
    return const Getstartedpage();
  }
}