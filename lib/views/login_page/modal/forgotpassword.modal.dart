class ForgotPasswordModal {
  bool? success;
  String? message;

  ForgotPasswordModal({this.success, this.message});

  ForgotPasswordModal.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    return data;
  }
}
class ForgotPasswordBody {
  String? vendorId;
  String? nPassword;
  String? cPassword;

  ForgotPasswordBody({this.vendorId, this.nPassword, this.cPassword});

  ForgotPasswordBody.fromJson(Map<String, dynamic> json) {
    vendorId = json['vendor_id'];
    nPassword = json['nPassword'];
    cPassword = json['cPassword'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['vendor_id'] = this.vendorId;
    data['nPassword'] = this.nPassword;
    data['cPassword'] = this.cPassword;
    return data;
  }
}

class ForgotPasswordSendOTPModal {
  bool? success;
  String? message;
  UserInformation? userInformation;

  ForgotPasswordSendOTPModal(
      {this.success, this.message, this.userInformation});

  ForgotPasswordSendOTPModal.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    userInformation = json['userInformation'] != null
        ? new UserInformation.fromJson(json['userInformation'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    if (this.userInformation != null) {
      data['userInformation'] = this.userInformation?.toJson();
    }
    return data;
  }
}

class UserInformation {
  int? vendorId;
  String? fullName;
  String? phoneNumber;
  String? password;
  String? confirmPassword;
  String? createdAt;
  String? updatedAt;

  UserInformation(
      {this.vendorId,
      this.fullName,
      this.phoneNumber,
      this.password,
      this.confirmPassword,
      this.createdAt,
      this.updatedAt});

  UserInformation.fromJson(Map<String, dynamic> json) {
    vendorId = json['vendor_id'];
    fullName = json['full_name'];
    phoneNumber = json['phone_number'];
    password = json['password'];
    confirmPassword = json['confirm_password'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['vendor_id'] = this.vendorId;
    data['full_name'] = this.fullName;
    data['phone_number'] = this.phoneNumber;
    data['password'] = this.password;
    data['confirm_password'] = this.confirmPassword;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class ForgotPasswordSendOTPBody {
  String? phoneNumber;

  ForgotPasswordSendOTPBody({this.phoneNumber});

  ForgotPasswordSendOTPBody.fromJson(Map<String, dynamic> json) {
    phoneNumber = json['phone_number'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['phone_number'] = this.phoneNumber;
    return data;
  }
}

class ForgoPasswordVerfiyOTPModal {
  bool? success;
  String? message;

  ForgoPasswordVerfiyOTPModal({this.success, this.message});

  ForgoPasswordVerfiyOTPModal.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    return data;
  }
}

class ForgotPasswordVerfiyOTPBody {
  String? phoneNumber;
  String? otp;

  ForgotPasswordVerfiyOTPBody({this.phoneNumber, this.otp});

  ForgotPasswordVerfiyOTPBody.fromJson(Map<String, dynamic> json) {
    phoneNumber = json['phone_number'];
    otp = json['otp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['phone_number'] = this.phoneNumber;
    data['otp'] = this.otp;
    return data;
  }
}

