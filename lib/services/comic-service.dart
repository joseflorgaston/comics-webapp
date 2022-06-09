import 'package:comic_test/models/comic.dart';
import 'package:dio/dio.dart';

class ComicService {
  Dio dio = Dio();

  Future<ComicListResponse> getComics() async {
    try {
      dynamic response = await dio.get(
        "https://pacific-ravine-45457.herokuapp.com/api/comics",
      );

      return ComicListResponse.fromJson(response.data["results"]);
    } catch (e) {
      return ComicListResponse(comicsList: []);
    }
  }

  Future<ComicDetailsModel> getComicDetails(apiDetailUrl) async {
    try {
      dynamic response = await dio.get(
        "https://pacific-ravine-45457.herokuapp.com/api/comic",
        queryParameters: {
          "apiUrl" : apiDetailUrl
        }
      );

      return ComicDetailsModel.fromJson(response.data);
    } catch (e) {
      return ComicDetailsModel();
    }
  }
}
