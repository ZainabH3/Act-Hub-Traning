

import 'package:act_hub_training/features/auth/data/mapper/register_mapper.dart';
import 'package:dartz/dartz.dart';

import '../../../../config/constants.dart';
import '../../../../core/ error_handler/error_handler.dart';
import '../../../../core/internet_checker/internet_checker.dart';
import '../../domain/model/register.dart';
import '../../domain/repository/register_repository.dart';
import '../data_source/remote_register_data_source.dart';
import '../request/Register_request.dart';

class RegisterRepositoryImpl implements RegisterRepository {
  final RemoteRegisterDataSource _dataSource;
  final NetworkInfo networkInfo;

  RegisterRepositoryImpl(this._dataSource, this.networkInfo);

  @override
  Future<Either<Failure, Register>> register(RegisterRequest registerRequest) async {
    if (await networkInfo.isConnected) {
      try {
        final response = await _dataSource.register(registerRequest);
        return Right(response.toDomain());
      } catch (e) {
        return Left(
          ErrorHandler.handle(e).failure,
        );
      }
    } else {
      return Left(
        Failure(
          ResponseCode.NO_INTERNET_CONNECTION.value,
          ApiConstants.noInternetConnection,
        ),
      );
    }
  }



}