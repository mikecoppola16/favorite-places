import 'package:equatable/equatable.dart';
import 'package:favorite_places/assets/strings.dart';
import 'package:favorite_places/features/places/data/network/failure.dart';

abstract class BaseState extends Equatable {
  final Failure? error;
  const BaseState({required this.error});

  String getSafeErrorMsg(bool retry) {
    if (error?.message == null) {
      return retry ? "${AppString.errorNoDetails} ${AppString.tapRetry}" : AppString.errorNoDetails;
    }
    return ( "${AppString.errorDetails} ${error?.message}" );
  }
}