import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:sjo/model/frame_images.dart';

import '../model/product.dart';

class ApiService {
  final String _baseUrl = 'https://078d-182-3-37-91.ap.ngrok.io/api';
  Future<List<Frame>> getFrame() async {
    final response = await http.get(Uri.parse('$_baseUrl/frames'));

    final body = jsonDecode(response.body);
    List data = body['data'];

    return data.map((e) => Frame.fromMap(e)).toList();
  }

  Future<FrameImage> getFrameImages(id) async {
    final response = await http.get(Uri.parse('$_baseUrl/frameimages/$id'));
    final body = jsonDecode(response.body);
    List data = body['data'];

    return FrameImage.fromMap(data[0]);
  }
}
