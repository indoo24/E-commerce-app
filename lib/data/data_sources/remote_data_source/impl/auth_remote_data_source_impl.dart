import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/widgets/shared_pref_utils.dart';
import 'package:ecommerce_app/data/api_manager.dart';
import 'package:ecommerce_app/data/end_pointes.dart';
import 'package:ecommerce_app/data/model/LoginResponseDto.dart';
import 'package:ecommerce_app/data/model/RegisterResponseDto.dart';
import 'package:ecommerce_app/domain/entities/LoginResponsEntity.dart';
import 'package:ecommerce_app/domain/entities/RegisterResponseEntity.dart';
import 'package:ecommerce_app/domain/failuers.dart';
import 'package:injectable/injectable.dart';

import '../auth_remote_data_source.dart';

@Injectable(as: AuthRemoteDataSource)
class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  ApiManger apiManger;

  AuthRemoteDataSourceImpl({required this.apiManger});

  @override
  Future<Either<Failure, RegisterResponseEntity>> register(String name,
      String email, String password, String rePassword, String phone) async {
    try {
      ConnectivityResult checkResult = ConnectivityResult.wifi;
      if (checkResult == ConnectivityResult.wifi ||
          checkResult == ConnectivityResult.mobile) {
        var response = await apiManger.postData(EndPoints.register, body: {
          "name": name,
          "email": email,
          "password": password,
          "rePassword": rePassword,
          "phone": phone
        });
        var registerResponse = RegisterResponseDto.fromJson(response.data);
        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          return Right(registerResponse);
        } else {
          return Left(ServerError(errorMessage: response.statusMessage!));
        }
      } else {
        return Left(NetworkError(errorMessage: "No Internet Connection"));
      }
    } catch (e) {
      return Left(Failure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, LoginResponseEntity>> login(
      String email, String password) async {
    try {
      ConnectivityResult checkResult = ConnectivityResult.wifi;
      if (checkResult == ConnectivityResult.wifi ||
          checkResult == ConnectivityResult.mobile) {
        var response = await apiManger.postData(EndPoints.login, body: {
          "email": email,
          "password": password,
        });
        var loginResponse = LoginResponseDto.fromJson(response.data);

        bool isSaved = await SharedPrefUtils.saveDate(
            key: 'token', value: loginResponse.token);
        if (isSaved) {
          print("Token saved successfully");
        } else {
          print("Failed to save token");
        }

        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          return Right(loginResponse);
        } else {
          return Left(ServerError(errorMessage: response.statusMessage!));
        }
      } else {
        return Left(NetworkError(errorMessage: "No Internet Connection"));
      }
    } catch (e) {
      return Left(Failure(errorMessage: e.toString()));
    }
  }
}