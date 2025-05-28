import 'package:flutter/material.dart';
import 'met_page.dart';

class PinPage extends StatelessWidget {
  const PinPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F7F7),
      appBar: AppBar(
        title: const Text('핀 꽂기', style: TextStyle(color: Color(0xFFBDBDBD))),
        backgroundColor: const Color(0xFFF7F7F7),
        elevation: 0,
      ),
      body: Center(
        child: GestureDetector(
          onTap: () {
            // 지도 핀을 "꽂았다" 가정하고 만났어요 페이지로 이동
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const MetPage()),
            );
          },
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                width: 270,
                height: 340,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.grey[200],
                  image: const DecorationImage(
                    image: AssetImage('assets/yeouido_map_sample.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              // 여러 핀(예시)
              const Positioned(
                left: 70, top: 90,
                child: Icon(Icons.park, color: Colors.red, size: 40),
              ),
              const Positioned(
                left: 150, top: 50,
                child: Icon(Icons.circle, color: Color(0xFF19C37D), size: 18),
              ),
              const Positioned(
                left: 100, top: 210,
                child: Icon(Icons.circle, color: Color(0xFF19C37D), size: 18),
              ),
              const Positioned(
                left: 190, top: 140,
                child: Icon(Icons.circle, color: Color(0xFF19C37D), size: 18),
              ),
              // 핀 꽂기 안내(임시)
              const Positioned(
                bottom: 20,
                child: Text(
                  '지도를 눌러서 핀을 꽂아보세요\n(터치 시 다음 단계)',
                  style: TextStyle(fontSize: 15, color: Colors.black87),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}