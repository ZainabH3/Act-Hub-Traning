
import '../../../../core/network/app-api.dart';
import '../request/login-request.dart';
import '../response/login-response.dart'
;

abstract class RemoteLoginDataSource {
  Future<LoginResponse> login(LoginRequest loginRequest);
}
class RemoteLoginDataSourceImplement implements RemoteLoginDataSource {
  final AppApi _appApi;

  RemoteLoginDataSourceImplement(this._appApi);

  @override
  Future<LoginResponse> login(LoginRequest loginRequest) async {
    return await _appApi.login(loginRequest.email, loginRequest.password);
  }}