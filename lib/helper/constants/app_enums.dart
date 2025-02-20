enum ApiStatus { success, failure, notFound, unauthorise }

extension ApiStatusExtension on ApiStatus {
  get value {
    switch (this) {
      case ApiStatus.success:
        return true;
      case ApiStatus.failure:
        return 0;
      case ApiStatus.notFound:
        return 404;
      case ApiStatus.unauthorise:
        return 401;
      default:
        return null;
    }
  }
}

enum ApiStatusParams { status, message, success, error, data }

extension ApiStatusParamsExtension on ApiStatusParams {
  String? get value {
    switch (this) {
      case ApiStatusParams.success:
        return "Success";
      case ApiStatusParams.status:
        return "status_code";
      case ApiStatusParams.message:
        return "message";
      case ApiStatusParams.data:
        return "data";
      default:
        return null;
    }
  }
}

enum MaxLength { otp, phone, otpErrorLength, minPhoneLength }

extension MaxLengthExtension on MaxLength {
  int? get value {
    switch (this) {
      case MaxLength.otp:
        return 4;
      case MaxLength.phone:
        return 14;
      case MaxLength.otpErrorLength:
        return 3;
      case MaxLength.minPhoneLength:
        return 10;

      default:
        return null;
    }
  }
}

enum MinLength { username }

extension MinLengthExtension on MinLength {
  int? get value {
    switch (this) {
      case MinLength.username:
        return 3;
      default:
        return null;
    }
  }
}

enum StorageUtilsEnum { userData, appSettings, fcmToken, internetAlert }

extension StorageUtilsEnumExtension on StorageUtilsEnum {
  String get value {
    switch (this) {
      case StorageUtilsEnum.userData:
        return "user_data";
      case StorageUtilsEnum.appSettings:
        return "app_settings";
      case StorageUtilsEnum.fcmToken:
        return "fcm_token";
      case StorageUtilsEnum.internetAlert:
        return "internet_alert";
    }
  }
}
