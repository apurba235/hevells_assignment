import 'package:flutter/material.dart';
import 'package:havells_assignments/data/models/image_response.dart';
import 'package:havells_assignments/domain/home_controller.dart';

class HomeProvider with ChangeNotifier {

   ImageResponse? _imageList = ImageResponse();

  bool _isLoading = false;

  ImageResponse? get images => _imageList;

  bool get loading => _isLoading;

  Future<void> fetchImages(int page) async {
    _isLoading = true;
    _imageList = await HomeController().getImages(page);
    notifyListeners();
    _isLoading = false;
  }
}
