import 'package:flutter/material.dart';
import 'package:flutter_application_markdown/string_markdown.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  String markdownData1 = '1. Masukkan PIN anda \n1232. Pilih menu **Penarikan Tunai** atau **Penarikan Lainnya**https://cdn.myanimelist.net/images/anime/1483/126005.jpg';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              color: Colors.green.withOpacity(0.2),
              child: Markdown(
                shrinkWrap: true,
                styleSheet: MarkdownStyleSheet(
                  p: const TextStyle(
                    color: Colors.black,
                    fontSize: 14
                  ),
                  strong: const TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w500
                  ),
                  listBullet: const TextStyle(
                    color: Colors.blue,
                    fontSize: 14,
                    fontWeight: FontWeight.w500
                  )
                ),
                data: '1. Masukkan PIN anda \n1232. Pilih menu **Penarikan Tunai** atau **Penarikan Lainnya** \n 3. ![image](https://cdn.myanimelist.net/images/anime/1483/126005.jpg)',
              ),
            ),
          ],
        )
      ),
    );
  }
}