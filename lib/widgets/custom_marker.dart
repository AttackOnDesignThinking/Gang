import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;

/// value: 사용자 수 (숫자)
/// color: 원 색상
/// zoomFactor: 지도 확대 비율 (1.0이 기본, 더 크면 더 커짐)
Future<Uint8List> createBubbleMarker(
    int value,
    Color color, {
      double zoomFactor = 1.0,
    }) async {
  // 원 종류: 두 개만 (작은 원/큰 원)
  final bool isSmall = value <= 50;
  final double size = (isSmall ? 120.0 : 220.0) * zoomFactor;
  final double fontSize = (isSmall ? 56.0 : 110.0) * zoomFactor;

  final ui.PictureRecorder recorder = ui.PictureRecorder();
  final Canvas canvas = Canvas(recorder);

  // 원 그리기
  final Paint paint = Paint()..color = color;
  canvas.drawCircle(Offset(size / 2, size / 2), size / 2, paint);

  // 텍스트 스타일 (검은색, 가운데 정렬)
  final textStyle = TextStyle(
    color: Colors.black,
    fontSize: fontSize,
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

  final offset = Offset(
    (size - textPainter.width) / 2,
    (size - textPainter.height) / 2,
  );
  textPainter.paint(canvas, offset);

  final ui.Image image = await recorder.endRecording().toImage(
    size.toInt(),
    size.toInt(),
  );
  final byteData = await image.toByteData(format: ui.ImageByteFormat.png);
  return byteData!.buffer.asUint8List();
}