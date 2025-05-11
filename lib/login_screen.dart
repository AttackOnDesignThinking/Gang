import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mannapin'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue, // 페이스북 색상
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/map');
              },
              child: Text('페이스북 계정으로 로그인', style: TextStyle(color: Colors.white)),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.yellow, // 카카오톡 색상
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/map');
              },
              child: Text('카카오톡 계정으로 로그인', style: TextStyle(color: Colors.black)),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green, // 네이버 색상
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/map');
              },
              child: Text('네이버 계정으로 로그인', style: TextStyle(color: Colors.white)),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white, // 구글 색상
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                side: BorderSide(color: Colors.grey),
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/map');
              },
              child: Text('구글 계정으로 로그인', style: TextStyle(color: Colors.black)),
            ),
          ],
        ),
      ),
    );
  }
}