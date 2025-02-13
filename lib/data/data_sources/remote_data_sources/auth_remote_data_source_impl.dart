import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app/core/api/api_manger.dart';
import 'package:movie_app/core/api/end_points.dart';
import 'package:movie_app/core/errors/failures.dart';
import 'package:movie_app/data/model/RegisterResponseDM.dart';
import 'package:movie_app/domain/repositories/data_sources/remote_data_sources/auth_remote_data_source.dart';

@Injectable(as: AuthRemoteDataSource)
class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  ApiManger apiManger;

  AuthRemoteDataSourceImpl({required this.apiManger});

  @override
  Future<Either<Failures, RegisterResponseDm>> register(
      String name,
      String email,
      String password,
      String confirmPassword,
      String phone,
      int avaterId) async {
    try {
      final List<ConnectivityResult> connectivityResult =
      await Connectivity().checkConnectivity();

      if (connectivityResult.contains(ConnectivityResult.wifi) ||
          connectivityResult.contains(ConnectivityResult.mobile)) {
        var response = await apiManger.postData(
          endPoint: EndPoint.register,
          body: {
            "name": name,
            "email": email,
            "password": password,
            "phone": phone,
            "avaterId": avaterId
          },
        );

        var registerResponse = RegisterResponseDm.fromJson(response);

        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          return Right(registerResponse);
        } else {
          return Left(ServerError(errorMessage: registerResponse.message ?? "Unknown error"));
        }
      } else {
        return Left(NetworkError(
          errorMessage: "No Internet Connection, Please Check Internet Connection.",
        ));
      }
    } catch (e) {
      return Left(ServerError(errorMessage: e.toString()));
    }
  }
}
