import 'package:act_hub_training/features/auth/data/mapper/login-mapper.dart';
import 'package:act_hub_training/features/auth/data/request/login-request.dart';
import 'package:dartz/dartz.dart';

import '../../../../../../core/ error_handler/error_handler.dart';
import '../../../../../../core/internet_checker/internet_checker.dart';

import '../../../../config/constants.dart';
import '../../domain/model/login-model.dart';
import '../../domain/repository/login_repository.dart';

import '../data_source/remote-data-source.dart';

class LoginRepositoryImpl implements LoginRepository {
  final RemoteLoginDataSource _dataSource;
  final NetworkInfo networkInfo;

  LoginRepositoryImpl(this._dataSource, this.networkInfo);

  @override
  Future<Either<Failure, Login>> login(LoginRequest loginRequest) async {
    if (await networkInfo.isConnected) {
      try {
        final response = await _dataSource.login(loginRequest);
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
