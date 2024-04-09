
import 'package:havells_assignments/data/base_class/rest_api.dart';
import 'package:havells_assignments/data/models/image_response.dart';

class GetImageDao {
  GetImageDao._();

  static final instance = GetImageDao._();

  Future<ImageResponse?> getImages(int page) async {
    final response = await RestApi.instance.get('https://api.shutterstock.com/v2/images/search?page=$page');
    return response != null ? ImageResponse.fromJson(response) : null;
  }

}
