// GetAllBusinessModal.dart
class GetAllBusinessModal {
  GetAllBusinessModal({
    required this.success,
    required this.businesses,
  });

  final bool? success;
  final List<Business> businesses;

  factory GetAllBusinessModal.fromJson(Map<String, dynamic> json) {
    return GetAllBusinessModal(
      success: json["success"],
      businesses: json["businesses"] == null
          ? []
          : List<Business>.from(
              json["businesses"]!.map((x) => Business.fromJson(x))),
    );
  }
}

class Business {
  Business({
    required this.businessId,
    required this.vendorId,
    required this.promoCode,
    required this.profileImage,
    required this.businessType,
    required this.businessName,
    required this.vendorName,
    required this.categoryId,
    required this.storeTiming,
    required this.phoneNumber,
    required this.stateId,
    required this.cityId,
    required this.address,
    required this.email,
    required this.pincode,
    required this.googleMapLink,
    required this.websiteLink,
    required this.status,
    required this.approvalStatus,
    required this.kycDocImage,
    required this.documentTitle,
    required this.documentId,
    required this.remark,
    required this.createdAt,
    required this.updatedAt,
    required this.categoryName,
    required this.cityName,
    required this.stateName,
    required this.ratings,
    required this.totalRating,
    required this.averageRating,
    required this.isFavorite,
  });

  final int? businessId;
  final int? vendorId;
  final String? promoCode;
  final String? profileImage;
  final String? businessType;
  final String? businessName;
  final String? vendorName;
  final int? categoryId;
  final String? storeTiming;
  final String? phoneNumber;
  final int? stateId;
  final int? cityId;
  final String? address;
  final String? email;
  final String? pincode;
  final String? googleMapLink;
  final String? websiteLink;
  final int? status;
  final String? approvalStatus;
  final String? kycDocImage;
  final String? documentTitle;
  final String? documentId;
  final String? remark;
  final DateTime? createdAt;
  final dynamic updatedAt;
  final String? categoryName;
  final String? cityName;
  final String? stateName;
  final List<Rating> ratings;
  final int? totalRating;
  final int? averageRating;
  final bool? isFavorite;

  factory Business.fromJson(Map<String, dynamic> json) {
    return Business(
      businessId: json["business_id"],
      vendorId: json["vendor_id"],
      promoCode: json["promo_code"],
      profileImage: json["profile_image"],
      businessType: json["business_type"],
      businessName: json["business_name"],
      vendorName: json["vendor_name"],
      categoryId: json["category_id"],
      storeTiming: json["store_timing"],
      phoneNumber: json["phone_number"],
      stateId: json["state_id"],
      cityId: json["city_id"],
      address: json["address"],
      email: json["email"],
      pincode: json["pincode"],
      googleMapLink: json["google_map_link"],
      websiteLink: json["website_link"],
      status: json["status"],
      approvalStatus: json["approval_status"],
      kycDocImage: json["kyc_doc_image"],
      documentTitle: json["documentTitle"],
      documentId: json["documentId"],
      remark: json["remark"],
      createdAt: DateTime.tryParse(json["created_at"] ?? ""),
      updatedAt: json["updated_at"],
      categoryName: json["category_name"],
      cityName: json["city_name"],
      stateName: json["state_name"],
      ratings: json["ratings"] == null
          ? []
          : List<Rating>.from(json["ratings"]!.map((x) => Rating.fromJson(x))),
      totalRating: json["totalRating"],
      averageRating: json["averageRating"],
      isFavorite: json["is_favorite"],
    );
  }
}

class Rating {
  Rating({
    required this.id,
    required this.businessId,
    required this.userId,
    required this.rating,
    required this.createdAt,
  });

  final int? id;
  final int? businessId;
  final int? userId;
  final int? rating;
  final DateTime? createdAt;

  factory Rating.fromJson(Map<String, dynamic> json) {
    return Rating(
      id: json["id"],
      businessId: json["business_id"],
      userId: json["user_id"],
      rating: json["rating"],
      createdAt: DateTime.tryParse(json["created_at"] ?? ""),
    );
  }
}
