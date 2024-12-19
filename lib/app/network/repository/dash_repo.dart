import 'package:dio/dio.dart';
import 'package:southwaltoncarts_customer/app/network/response/CommonResponse.dart';
import 'package:southwaltoncarts_customer/app/network/response/HistoryResponse.dart';
import 'package:southwaltoncarts_customer/app/network/response/LatestReservationResponse.dart';
import 'package:southwaltoncarts_customer/app/network/response/UserProfileResponse.dart';
import 'package:southwaltoncarts_customer/app/utils/logger_utils.dart';
import 'package:southwaltoncarts_customer/app/utils/shared_prefs.dart';

import '../api_end_points.dart';
import '../networkUtils/network_result.dart';
import '../response/AgreementPdfResponse.dart';
import 'base_repo.dart';

class DashRepo extends BaseRepository {
  Future<NetworkResult<UserProfileResponse>> getUserProfile() async {
    return get<UserProfileResponse>(
        "${ApiEndpoints.getUserProfile}/${SharedPrefs().userId()}",
        fromJson: UserProfileResponse.fromJson);
  }

  Future<NetworkResult<UserProfileResponse>> updateUserDetail({
    required String fullName,
    required String phoneNumber,
    required String address,
    MultipartFile? img,
  }) async {
    FormData mData = FormData.fromMap({
      'fullName': fullName,
      'phoneNumber': phoneNumber,
      'state': address,
      if (img != null) 'image': img,
    });


    return put<UserProfileResponse>(
      "${ApiEndpoints.getUserProfile}/${SharedPrefs().userId()}",
      body: mData,
      fromJson: UserProfileResponse.fromJson,
    );
  }

  Future<NetworkResult<HistoryResponse>> getHistory(
  {int limit = 15, int page = 1, String search = ""}
      ) async {
    return get<HistoryResponse>(
        "${ApiEndpoints.getHistory}/${SharedPrefs().userId()}?page=$page&limit=$limit&search=$search",
        fromJson: HistoryResponse.fromJson);
  }

  Future<NetworkResult<LatestReservationResponse>>
      getLatestReservation() async {
    return get<LatestReservationResponse>(
        "${ApiEndpoints.getLatestReservation}/${SharedPrefs().userId()}",
        fromJson: LatestReservationResponse.fromJson);
  }

  Future<NetworkResult<CommonResponse>> contactUs({
    required String fullName,
    required String email,
    required String msg,
  }) async {
    return post<CommonResponse>(
      ApiEndpoints.contactUs,
      body: {"name": fullName, "email": email, "comments": msg},
      fromJson: CommonResponse.fromJson,
    );
  }

  Future<NetworkResult<AgreementPdfResponse>> getAgreement() async {
    return get("${ApiEndpoints.agreement}/${SharedPrefs().userId()}",
        fromJson: AgreementPdfResponse.fromJson);
  }

  Future<NetworkResult<CommonResponse>> updateReservation({
    required String reservationId,
    required String pickup,
    required String drop,
    required String pickdate,
    required String dropdate,
  }) async {
    return put<CommonResponse>(
      "${ApiEndpoints.updateReservation}/$reservationId",
      body: {
        "pickup": pickup,
        "drop": drop,
        "pickdate": pickdate,
        "dropdate": dropdate
      },
      fromJson: CommonResponse.fromJson,
    );
  }

  Future<NetworkResult<CommonResponse>> feedbackReq({
    required String email,
    required String name,
    required String startDate,
    required String endDate,
    required String comment,
  }) async {
    return post<CommonResponse>(
      ApiEndpoints.feedbackReq,
      body: {
        "email": email,
        "name": name,
        "startDate": startDate,
        "endDate": endDate,
        "comment": comment
      },
      fromJson: CommonResponse.fromJson,
    );
  }

  Future<NetworkResult<CommonResponse>> createDamageReport({
   required FormData mData
  }) async {
    return post<CommonResponse>(
      ApiEndpoints.createDamageReport,
      body: mData,
      fromJson: CommonResponse.fromJson,
    );
  }
}
