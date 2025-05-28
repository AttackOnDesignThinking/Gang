import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;

/// [createBubbleMarker]는 숫자가 들어간 노란 원 이미지를 생성해
/// 구글 맵 마커 아이콘으로 사용하도록 반환합니다.
Future<Uint8List> createBubbleMarker(int value, Color color) async {
  final ui.PictureRecorder recorder = ui.PictureRecorder();
  final Canvas canvas = Canvas(recorder);
  const double size = 80;

  // 원 그리기
  final Paint paint = Paint()..color = color;
  canvas.drawCircle(Offset(size / 2, size / 2), size / 2 - 2, paint);

  // 텍스트 스타일 (flutter의 TextStyle 사용!!)
  final textStyle = TextStyle(
    color: Colors.black,
    fontSize: 32,
    fontWeight: FontWeight.bold,
  );
  final textSpan = TextSpan(
    text: value.toString(),
    style: textStyle,
  );
  final textPainter = TextPainter(
    text: textSpan,
    textAlign: TextAlign.center,
    textDirection: TextDirection.ltr,
  );
  textPainter.layout();

  // 텍스트 중앙 배치
  final offset = Offset(
    (size - textPainter.width) / 2,
    (size - textPainter.height) / 2,
  );
  textPainter.paint(canvas, offset);

  final ui.Image image = await recorder.endRecording().toImage(size.toInt(), size.toInt());
  final byteData = await image.toByteData(format: ui.ImageByteFormat.png);
  return byteData!.buffer.asUint8List();
}