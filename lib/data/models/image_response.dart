
import 'package:hive/hive.dart';
part 'image_response.g.dart';

@HiveType(typeId: 1)
class ImageResponse extends HiveObject{
  @HiveField(0)
  int? totalCount;
  @HiveField(1)
  String? searchId;
  @HiveField(2)
  int? page;
  @HiveField(3)
  int? perPage;
  @HiveField(4)
  SpellcheckInfo? spellcheckInfo;
  @HiveField(5)
  List<Data>? data;

  ImageResponse(
      {this.totalCount,
        this.searchId,
        this.page,
        this.perPage,
        this.spellcheckInfo,
        this.data
      });

  ImageResponse.fromJson(Map<String, dynamic> json) {
    totalCount = json['total_count'];
    searchId = json['search_id'];
    page = json['page'];
    perPage = json['per_page'];
    spellcheckInfo = json['spellcheck_info'] != null
        ? SpellcheckInfo.fromJson(json['spellcheck_info'])
        : null;
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['total_count'] = totalCount;
    data['search_id'] = searchId;
    data['page'] = page;
    data['per_page'] = perPage;
    if (spellcheckInfo != null) {
      data['spellcheck_info'] = spellcheckInfo!.toJson();
    }
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

@HiveType(typeId: 2)
class SpellcheckInfo extends HiveObject{
  @HiveField(6)
  String? spellcheckedQuery;
  @HiveField(7)
  int? origResultsCount;

  SpellcheckInfo({this.spellcheckedQuery, this.origResultsCount});

  SpellcheckInfo.fromJson(Map<String, dynamic> json) {
    spellcheckedQuery = json['spellchecked_query'];
    origResultsCount = json['orig_results_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['spellchecked_query'] = spellcheckedQuery;
    data['orig_results_count'] = origResultsCount;
    return data;
  }
}

@HiveType(typeId: 3)
class Data extends HiveObject{
  @HiveField(8)
  String? id;
  @HiveField(9)
  double? aspect;
  @HiveField(10)
  Assets? assets;
  @HiveField(11)
  Contributor? contributor;
  @HiveField(12)
  String? description;
  @HiveField(13)
  String? imageType;
  @HiveField(14)
  bool? hasModelRelease;
  @HiveField(15)
  String? mediaType;

  Data(
      {this.id,
        this.aspect,
        this.assets,
        this.contributor,
        this.description,
        this.imageType,
        this.hasModelRelease,
        this.mediaType});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    aspect = json['aspect'];
    assets =
    json['assets'] != null ? Assets.fromJson(json['assets']) : null;
    contributor = json['contributor'] != null
        ? Contributor.fromJson(json['contributor'])
        : null;
    description = json['description'];
    imageType = json['image_type'];
    hasModelRelease = json['has_model_release'];
    mediaType = json['media_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['aspect'] = aspect;
    if (assets != null) {
      data['assets'] = assets!.toJson();
    }
    if (contributor != null) {
      data['contributor'] = contributor!.toJson();
    }
    data['description'] = description;
    data['image_type'] = imageType;
    data['has_model_release'] = hasModelRelease;
    data['media_type'] = mediaType;
    return data;
  }
}

@HiveType(typeId: 4)
class Assets extends HiveObject{
  @HiveField(16)
  Preview? preview;
  @HiveField(17)
  Preview? smallThumb;
  @HiveField(18)
  Preview? largeThumb;
  @HiveField(19)
  Preview? mosaic;
  @HiveField(20)
  Preview? preview1000;
  @HiveField(21)
  Preview? preview1500;
  @HiveField(22)
  Preview? hugeThumb;

  Assets(
      {this.preview,
        this.smallThumb,
        this.largeThumb,
        this.mosaic,
        this.preview1000,
        this.preview1500,
        this.hugeThumb});

  Assets.fromJson(Map<String, dynamic> json) {
    preview =
    json['preview'] != null ? Preview.fromJson(json['preview']) : null;
    smallThumb = json['small_thumb'] != null
        ? Preview.fromJson(json['small_thumb'])
        : null;
    largeThumb = json['large_thumb'] != null
        ? Preview.fromJson(json['large_thumb'])
        : null;
    mosaic =
    json['mosaic'] != null ? Preview.fromJson(json['mosaic']) : null;
    preview1000 = json['preview_1000'] != null
        ? Preview.fromJson(json['preview_1000'])
        : null;
    preview1500 = json['preview_1500'] != null
        ? Preview.fromJson(json['preview_1500'])
        : null;
    hugeThumb = json['huge_thumb'] != null
        ? Preview.fromJson(json['huge_thumb'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (preview != null) {
      data['preview'] = preview!.toJson();
    }
    if (smallThumb != null) {
      data['small_thumb'] = smallThumb!.toJson();
    }
    if (largeThumb != null) {
      data['large_thumb'] = largeThumb!.toJson();
    }
    if (mosaic != null) {
      data['mosaic'] = mosaic!.toJson();
    }
    if (preview1000 != null) {
      data['preview_1000'] = preview1000!.toJson();
    }
    if (preview1500 != null) {
      data['preview_1500'] = preview1500!.toJson();
    }
    if (hugeThumb != null) {
      data['huge_thumb'] = hugeThumb!.toJson();
    }
    return data;
  }
}

@HiveType(typeId: 5)
class Preview extends HiveObject{
  @HiveField(23)
  int? height;
  @HiveField(24)
  int? width;
  @HiveField(25)
  String? url;

  Preview({this.height, this.width, this.url});

  Preview.fromJson(Map<String, dynamic> json) {
    height = json['height'];
    width = json['width'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['height'] = height;
    data['width'] = width;
    data['url'] = url;
    return data;
  }
}

@HiveType(typeId: 6)
class Contributor extends HiveObject{
  @HiveField(26)
  String? id;

  Contributor({this.id});

  Contributor.fromJson(Map<String, dynamic> json) {
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    return data;
  }
}