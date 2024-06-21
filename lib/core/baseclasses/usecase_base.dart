import 'package:either_dart/either.dart';
import 'package:favorite_places/features/places/data/network/failure.dart';

abstract class BaseUseCase<In, Out> {
  Future<Either<Failure, Out>> execute(In input);
}
