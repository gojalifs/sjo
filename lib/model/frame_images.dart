import 'dart:convert';

class FrameImage {
  final int frameId;
  final List imgPath;
  FrameImage({
    required this.frameId,
    required this.imgPath,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'frameId': frameId,
      'imgPath': imgPath,
    };
  }

  factory FrameImage.fromMap(Map<String, dynamic> map) {
    return FrameImage(
      frameId: map['frameId'].toInt() as int,
      imgPath: List.from((map['imgPath'] as List)),
    );
  }

  String toJson() => json.encode(toMap());

  factory FrameImage.fromJson(String source) =>
      FrameImage.fromMap(json.decode(source) as Map<String, dynamic>);
}
