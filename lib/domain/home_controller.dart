import 'package:havells_assignments/data/api_call.dart';
import 'package:havells_assignments/data/base_class/internet_connection_manager.dart';
import 'package:havells_assignments/data/models/image_response.dart';
import 'package:hive_flutter/adapters.dart';

class HomeController {
  Future<ImageResponse?> getImages(int page) async {
     final myBox = Hive.box('imageData');
    final response =
    InternetConnectionManager.instance.isInternetConnected ?
    await GetImageDao.instance.getImages(page)
        : myBox.get('images')
     ;
    if (response != null) {
      await myBox.put('images', response);
      return response;
    } else {
      return null;
    }
  }
}
