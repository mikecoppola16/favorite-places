import 'package:favorite_places/features/places/data/network/error_handler.dart';
import 'package:favorite_places/features/places/data/network/failure.dart';

class BaseRepository {
  
  Failure nullCheckFailure(int? statusCode, String? statusMessage) {
    return Failure(statusCode ?? ApiInternalStatus.FAILURE,
        statusMessage ?? ResponseMessage.DEFAULT);
  }
}
