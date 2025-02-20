class CreateBusinessModal {
  bool? success;
  String? message;
  Data? data;

  CreateBusinessModal({this.success, this.message, this.data});

  CreateBusinessModal.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['success'] = this.success;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data?.toJson();
    }
    return data;
  }
}

class Data {
  int? fieldCount;
  int? affectedRows;
  int? insertId;
  int? serverStatus;
  int? warningCount;
  String? message;
  bool? protocol41;
  int? changedRows;

  Data(
      {this.fieldCount,
      this.affectedRows,
      this.insertId,
      this.serverStatus,
      this.warningCount,
      this.message,
      this.protocol41,
      this.changedRows});

  Data.fromJson(Map<String, dynamic> json) {
    fieldCount = json['fieldCount'];
    affectedRows = json['affectedRows'];
    insertId = json['insertId'];
    serverStatus = json['serverStatus'];
    warningCount = json['warningCount'];
    message = json['message'];
    protocol41 = json['protocol41'];
    changedRows = json['changedRows'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['fieldCount'] = this.fieldCount;
    data['affectedRows'] = this.affectedRows;
    data['insertId'] = this.insertId;
    data['serverStatus'] = this.serverStatus;
    data['warningCount'] = this.warningCount;
    data['message'] = this.message;
    data['protocol41'] = this.protocol41;
    data['changedRows'] = this.changedRows;
    return data;
  }
}

class CreateBusinessBody {
  dynamic vendorId;
  String? promoCode;
  String? businessType;
  String? businessName;
  String? vendorName;
  String? categoryId;
  String? storeTiming;
  String? phoneNumber;
  String? stateId; 
  String? cityId;   
  String? address;
  String? email;
  String? pincode;
  String? googleMapLink;
  String? websiteLink;
  String? documentTitle;
  String? documentId;
  String? approvalStatus;
  String? remark;
  String? profileImage;
  String? kycDocImage;

  CreateBusinessBody(
      {this.vendorId,
      this.promoCode,
      this.businessType,
      this.businessName,
      this.vendorName,
      this.categoryId,
      this.storeTiming,
      this.phoneNumber,
      this.stateId, 
      this.cityId,   
      this.address,
      this.email,
      this.pincode,
      this.googleMapLink,
      this.websiteLink,
      this.documentTitle,
      this.documentId,
      this.approvalStatus,
      this.remark,
      this.profileImage,
      this.kycDocImage});

  CreateBusinessBody.fromJson(Map<String, dynamic> json) {
    vendorId = json['vendor_id'];
    promoCode = json['promo_code'];
    businessType = json['business_type'];
    businessName = json['business_name'];
    vendorName = json['vendor_name'];
    categoryId = json['category_id'];
    storeTiming = json['store_timing'];
    phoneNumber = json['phone_number'];
    stateId = json['state_id'];
    cityId = json['city_id'];
    address = json['address'];
    email = json['email'];
    pincode = json['pincode'];
    googleMapLink = json['google_map_link'];
    websiteLink = json['website_link'];
    documentTitle = json['documentTitle'];
    documentId = json['documentId'];
    approvalStatus = json['approval_status'];
    remark = json['remark'];
    profileImage = json['profile_image'];
    kycDocImage = json['kyc_doc_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['vendor_id'] = this.vendorId;
    data['promo_code'] = this.promoCode;
    data['business_type'] = this.businessType;
    data['business_name'] = this.businessName;
    data['vendor_name'] = this.vendorName;
    data['category_id'] = this.categoryId;
    data['store_timing'] = this.storeTiming;
    data['phone_number'] = this.phoneNumber;
    data['state_id'] = this.stateId;
    data['city_id'] = this.cityId;
    data['address'] = this.address;
    data['email'] = this.email;
    data['pincode'] = this.pincode;
    data['google_map_link'] = this.googleMapLink;
    data['website_link'] = this.websiteLink;
    data['documentTitle'] = this.documentTitle;
    data['documentId'] = this.documentId;
    data['approval_status'] = this.approvalStatus;
    data['remark'] = this.remark;
    data['profile_image'] = this.profileImage;
    data['kyc_doc_image'] = this.kycDocImage;
    return data;
  }
}

class GetStatesModal {
  bool? success;
  List<StatesData>? data;

  GetStatesModal({this.success, this.data});

  GetStatesModal.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    data = (json['data'] as List<dynamic>?)
        ?.map((v) => StatesData.fromJson(v as Map<String, dynamic>))
        .toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> jsonData = {};
    jsonData['success'] = success;
    jsonData['data'] = data?.map((v) => v.toJson()).toList() ?? [];
    return jsonData;
  }
}

class StatesData {
  int? id;
  String? name;
  int? countryId;

  StatesData({this.id, this.name, this.countryId});

  StatesData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    countryId = json['country_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = this.id;
    data['name'] = this.name;
    data['country_id'] = this.countryId;
    return data;
  }
}

class SelectCitiesModal {
  bool? success;
  List<CitiesData>? data;

  SelectCitiesModal({this.success, this.data});

  SelectCitiesModal.fromJson(Map<String, dynamic> json) {
    success = json['success'] ?? false;
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data!.add(CitiesData.fromJson(v));
      });
    } else {
      data = [];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> map = {};
    map['success'] = success;
    if (data != null) {
      map['data'] = data!.map((v) => v.toJson()).toList();
    } else {
      map['data'] = [];
    }
    return map;
  }
}

class CitiesData {
  int? id;
  String? name;
  int? stateId;

  CitiesData({this.id, this.name, this.stateId});

  CitiesData.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? 0;
    name = json['name'] ?? '';
    stateId = json['state_id'] ?? 0;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> map = {};
    map['id'] = id;
    map['name'] = name;
    map['state_id'] = stateId;
    return map;
  }
}

class SelectCitiesBody {
  String? stateId;

  SelectCitiesBody({this.stateId});

  SelectCitiesBody.fromJson(Map<String, dynamic> json) {
    stateId = json['state_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['state_id'] = this.stateId;
    return data;
  }
}


class CategoriesBody {
  bool? success;
  List<CategoryData>? data;  

  CategoriesBody({this.success, this.data});

  CategoriesBody.fromJson(Map<String, dynamic> json) {
    success = json['success'] ?? false;
    if (json['data'] != null) {
      data = [];
      if (json['data'] is List) {
        json['data'].forEach((v) {
          data!.add(CategoryData.fromJson(v));  
        });
      }
    } else {
      data = [];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['success'] = this.success;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CategoryData {
  int? id;
  String? name;
  String? status;
  String? createdAt;

  CategoryData({this.id, this.name, this.status, this.createdAt});

  CategoryData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    status = json['status'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    return data;
  }
}
