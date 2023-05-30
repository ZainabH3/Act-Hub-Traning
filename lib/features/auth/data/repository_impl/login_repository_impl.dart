
import 'package:act_hub_training/features/auth/data/mapper/login-mapper.dart';
import 'package:act_hub_training/features/auth/data/request/login-request.dart';
import 'package:dartz/dartz.dart';

import '../../../../../../core/ error_handler/error_handler.dart';
import '../../../../../../core/internet_checker/internet_checker.dart';
import '../../../../../core/resources/manager_strings.dart';


import '../../domain/model/login-model.dart';
import '../../domain/repository/login_repository.dart';

import '../data_source/remote-data-source.dart';


class LoginRepositoryImplement implements LoginRepository {
  final RemoteLoginDataSource _remoteLoginDataSource;
  final NetworkInfo _networkInfo;
  LoginRepositoryImplement(this._remoteLoginDataSource, this._networkInfo);
  @override
  Future<Either<Failure, Login>> login(LoginRequest loginRequest) async {
    if (await _networkInfo.isConnected) {
      final response = await _remoteLoginDataSource.login(loginRequest);
      return Right(response.toDomain());
    } else {
      return Left(
        Failure(ResponseCode.NO_INTERNET_CONNECTION.value,
            ManagerStrings.noInternetConnection),
      );
    }
  }
}
