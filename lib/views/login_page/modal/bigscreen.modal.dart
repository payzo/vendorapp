class Business {
  int? businessId;
  int? vendorId;
  String? promoCode;
  String? profileImage;
  String? businessType;
  String? businessName;
  String? vendorName;
  int? categoryId;
  String? storeTiming;
  String? phoneNumber;
  int? stateId;
  int? cityId;
  String? address;
  String? email;
  String? pincode;
  String? googleMapLink;
  String? websiteLink;
  int? status;
  String? approvalStatus;
  String? kycDocImage;
  String? documentTitle;
  String? documentId;
  String? remark;
  String? createdAt;
  String? updatedAt;
  String? categoryName;
  String? cityName;
  String? stateName;
  List<dynamic> ratings; // Assuming ratings will be a list
  int? totalRating;
  double? averageRating;

  Business({
    this.businessId,
    this.vendorId,
    this.promoCode,
    this.profileImage,
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
    this.status,
    this.approvalStatus,
    this.kycDocImage,
    this.documentTitle,
    this.documentId,
    this.remark,
    this.createdAt,
    this.updatedAt,
    this.categoryName,
    this.cityName,
    this.stateName,
    this.ratings = const [],
    this.totalRating,
    this.averageRating,
  });

  factory Business.fromJson(Map<String, dynamic> json) {
    return Business(
      businessId: json['business_id'],
      vendorId: json['vendor_id'],
      promoCode: json['promo_code'],
      profileImage: json['profile_image'],
      businessType: json['business_type'],
      businessName: json['business_name'],
      vendorName: json['vendor_name'],
      categoryId: json['category_id'],
      storeTiming: json['store_timing'],
      phoneNumber: json['phone_number'],
      stateId: json['state_id'],
      cityId: json['city_id'],
      address: json['address'],
      email: json['email'],
      pincode: json['pincode'],
      googleMapLink: json['google_map_link'],
      websiteLink: json['website_link'],
      status: json['status'],
      approvalStatus: json['approval_status'],
      kycDocImage: json['kyc_doc_image'],
      documentTitle: json['documentTitle'],
      documentId: json['documentId'],
      remark: json['remark'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      categoryName: json['category_name'],
      cityName: json['city_name'],
      stateName: json['state_name'],
      ratings: json['ratings'] ?? [],
      totalRating: json['totalRating'],
      averageRating: json['averageRating']?.toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'business_id': businessId,
      'vendor_id': vendorId,
      'promo_code': promoCode,
      'profile_image': profileImage,
      'business_type': businessType,
      'business_name': businessName,
      'vendor_name': vendorName,
      'category_id': categoryId,
      'store_timing': storeTiming,
      'phone_number': phoneNumber,
      'state_id': stateId,
      'city_id': cityId,
      'address': address,
      'email': email,
      'pincode': pincode,
      'google_map_link': googleMapLink,
      'website_link': websiteLink,
      'status': status,
      'approval_status': approvalStatus,
      'kyc_doc_image': kycDocImage,
      'documentTitle': documentTitle,
      'documentId': documentId,
      'remark': remark,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'category_name': categoryName,
      'city_name': cityName,
      'state_name': stateName,
      'ratings': ratings,
      'totalRating': totalRating,
      'averageRating': averageRating,
    };
  }
}

