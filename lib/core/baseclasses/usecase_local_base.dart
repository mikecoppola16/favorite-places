import 'package:either_dart/either.dart';
import 'package:favorite_places/core/db/local_db_failure.dart';

abstract class LocalBaseUseCase<In, Out> {
  Future<Either<DBFailure, Out>> execute(In input);
}
