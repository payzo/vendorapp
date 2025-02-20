class SignupModal {
  bool? success;
  String? message;
  VendorUser? vendorUser;

  SignupModal({this.success, this.message, this.vendorUser});

  SignupModal.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    vendorUser = json['vendorUser'] != null
        ? new VendorUser.fromJson(json['vendorUser'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    if (this.vendorUser != null) {
      data['vendorUser'] = this.vendorUser!.toJson();
    }
    return data;
  }
}

class VendorUser {
  int? id;
  String? fullName;
  String? phoneNumber;

  VendorUser({this.id, this.fullName, this.phoneNumber});

  VendorUser.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fullName = json['full_name'];
    phoneNumber = json['phone_number'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['full_name'] = this.fullName;
    data['phone_number'] = this.phoneNumber;
    return data;
  }
}


//signupBody
class SignupBody {
  String? fullName;
  String? phoneNumber;
  String? password;
  String? confirmPassword;

  SignupBody(
      {this.fullName, this.phoneNumber, this.password, this.confirmPassword});

  SignupBody.fromJson(Map<String, dynamic> json) {
    fullName = json['full_name'];
    phoneNumber = json['phone_number'];
    password = json['password'];
    confirmPassword = json['confirm_password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['full_name'] = this.fullName;
    data['phone_number'] = this.phoneNumber;
    data['password'] = this.password;
    data['confirm_password'] = this.confirmPassword;
    return data;
  }
}

class SendOTPModal {
  bool? success;
  String? message;

  SendOTPModal({this.success, this.message});

  SendOTPModal.fromJson(Map<String, dynamic> json) {
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

class SendOTPBody {
  String? phoneNumber;

  SendOTPBody({this.phoneNumber});

  SendOTPBody.fromJson(Map<String, dynamic> json) {
    phoneNumber = json['phone_number'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['phone_number'] = this.phoneNumber;
    return data;
  }
}


class VerifyOTPModal {
  bool? success;
  String? message;

  VerifyOTPModal({this.success, this.message});

  VerifyOTPModal.fromJson(Map<String, dynamic> json) {
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

class VerifyOTPBody {
  String? phoneNumber;
  String? otp;

  VerifyOTPBody({this.phoneNumber, this.otp});

  VerifyOTPBody.fromJson(Map<String, dynamic> json) {
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


