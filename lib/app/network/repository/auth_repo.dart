import 'dart:convert';

import 'package:southwaltoncarts_customer/app/network/api_end_points.dart';
import 'package:southwaltoncarts_customer/app/network/response/CommonResponse.dart';

import '../networkUtils/network_result.dart';
import '../response/LoginResponse.dart';
import 'base_repo.dart';

class AuthRepo extends BaseRepository {

  Future<NetworkResult<LoginResponse>> login(
      String email, String password) async {
    return post<LoginResponse>(ApiEndpoints.login,
        body: {"email": email, "password": password},
        fromJson: LoginResponse.fromJson);
  }

  Future<NetworkResult<CommonResponse>> sendEmail(
      String email) async {
    return post<CommonResponse>(ApiEndpoints.sendEmail,
        body: {"email": email},
        fromJson: CommonResponse.fromJson);
  }

  Future<NetworkResult<CommonResponse>> otpVerify(
      String email,
      String otp) async {
    return post<CommonResponse>(ApiEndpoints.verifyOtp,
        body: {"email": email, "otp":otp},
        fromJson: CommonResponse.fromJson);
  }

  Future<NetworkResult<CommonResponse>> resetPassword(
      String email,
      String password) async {
    return post<CommonResponse>(ApiEndpoints.resetPassword,
        body: {"email": email, "password":password},
        fromJson: CommonResponse.fromJson);
  }

}
