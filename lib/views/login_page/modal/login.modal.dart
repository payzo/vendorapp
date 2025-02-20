class LoginModal {
  bool success;
  String? message;
  List<User>? user;

  LoginModal({this.success = false, this.message, this.user});

  LoginModal.fromJson(Map<String, dynamic> json)
      : success = json['success'] ?? false,  // Default to false if 'success' is null
        message = json['message'],
        user = (json['User'] != null && json['User'] is List)
            ? List<User>.from(json['User'].map((v) => User.fromJson(v)))
            : [];  // Ensure user list is initialized

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = this.success;
    data['message'] = this.message;
    if (this.user != null) {
      data['User'] = this.user!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class User {
  int vendorId;
  String fullName;
  String phoneNumber;
  String password;
  String confirmPassword;
  String createdAt;
  String updatedAt;

  User({
    required this.vendorId,
    required this.fullName,
    required this.phoneNumber,
    required this.password,
    required this.confirmPassword,
    required this.createdAt,
    required this.updatedAt,
  });

  User.fromJson(Map<String, dynamic> json)
      : vendorId = json['vendor_id'] ?? 0,  
        fullName = json['full_name'] ?? '',
        phoneNumber = json['phone_number'] ?? '',
        password = json['password'] ?? '',
        confirmPassword = json['confirm_password'] ?? '',
        createdAt = json['created_at'] ?? '',
        updatedAt = json['updated_at'] ?? '';

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
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




class LoginBody {
  String? phoneNumber;
  String? confirmPassword;

  LoginBody({this.phoneNumber, this.confirmPassword});

  LoginBody.fromJson(Map<String, dynamic> json) {
    phoneNumber = json['phone_number'];
    confirmPassword = json['confirm_password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['phone_number'] = this.phoneNumber;
    data['confirm_password'] = this.confirmPassword;
    return data;
  }
}
