class DeleteBusinessModal {
  final bool success;
  final String message;
  final DeleteBusinessData? data;

  DeleteBusinessModal({
    required this.success,
    required this.message,
    this.data,
  });

  factory DeleteBusinessModal.fromJson(Map<String, dynamic> json) {
    return DeleteBusinessModal(
      success: json["success"] ?? false, // Parse success as a boolean
      message: json["message"] ?? '',   // Parse message
      data: json["data"] == null 
          ? null 
          : DeleteBusinessData.fromJson(json["data"]),  // Parse data object if exists
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'success': success,
      'message': message,
      'data': data?.toJson(),  
    };
  }
}

class DeleteBusinessData {
  final int? fieldCount;
  final int? affectedRows;
  final int? insertId;
  final int? serverStatus;
  final int? warningCount;
  final String? message;
  final bool? protocol41;
  final int? changedRows;

  DeleteBusinessData({
    this.fieldCount,
    this.affectedRows,
    this.insertId,
    this.serverStatus,
    this.warningCount,
    this.message,
    this.protocol41,
    this.changedRows,
  });

  factory DeleteBusinessData.fromJson(Map<String, dynamic> json) {
    return DeleteBusinessData(
      fieldCount: json["fieldCount"],
      affectedRows: json["affectedRows"],
      insertId: json["insertId"],
      serverStatus: json["serverStatus"],
      warningCount: json["warningCount"],
      message: json["message"],
      protocol41: json["protocol41"],
      changedRows: json["changedRows"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'fieldCount': fieldCount,
      'affectedRows': affectedRows,
      'insertId': insertId,
      'serverStatus': serverStatus,
      'warningCount': warningCount,
      'message': message,
      'protocol41': protocol41,
      'changedRows': changedRows,
    };
  }
}

class DeleteBusinessBody {
  final String? businessId;

  DeleteBusinessBody({
    required this.businessId,
  });

  Map<String, dynamic> toJson() {
    return {
      'business_id': businessId,
    };
  }

  factory DeleteBusinessBody.fromJson(Map<String, dynamic> json) {
    return DeleteBusinessBody(
      businessId: json["business_id"],
    );
  }
}
