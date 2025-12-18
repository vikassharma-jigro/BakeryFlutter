class ProfileModel {
  ProfileData? data;

  ProfileModel({this.data});

  ProfileModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new ProfileData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class ProfileData {
  String? sId;
  String? name;
  String? email;
  String? role;
  String? department;
  String? status;
  int? phone;
  String? address;
  String? createdBy;
  String? joiningDate;
  String? createdAt;
  String? updatedAt;
  int? iV;
  RetailerDetails? retailerDetails;

  ProfileData(
      {this.sId,
        this.name,
        this.email,
        this.role,
        this.department,
        this.status,
        this.phone,
        this.address,
        this.createdBy,
        this.joiningDate,
        this.createdAt,
        this.updatedAt,
        this.iV,
        this.retailerDetails});

  ProfileData.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    email = json['email'];
    role = json['role'];
    department = json['department'];
    status = json['status'];
    phone = json['phone'];
    address = json['address'];
    createdBy = json['createdBy'];
    joiningDate = json['joiningDate'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
    retailerDetails = json['retailerDetails'] != null
        ? new RetailerDetails.fromJson(json['retailerDetails'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['email'] = this.email;
    data['role'] = this.role;
    data['department'] = this.department;
    data['status'] = this.status;
    data['phone'] = this.phone;
    data['address'] = this.address;
    data['createdBy'] = this.createdBy;
    data['joiningDate'] = this.joiningDate;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    if (this.retailerDetails != null) {
      data['retailerDetails'] = this.retailerDetails!.toJson();
    }
    return data;
  }
}

class RetailerDetails {
  String? sId;
  String? employeeId;
  String? shopName;
  String? city;
  String? state;
  String? pincode;
  int? alternatePhone;
  String? landmark;
  String? gstNumber;
  String? shopTiming;
  String? createdAt;
  String? updatedAt;
  int? iV;

  RetailerDetails(
      {this.sId,
        this.employeeId,
        this.shopName,
        this.city,
        this.state,
        this.pincode,
        this.alternatePhone,
        this.landmark,
        this.gstNumber,
        this.shopTiming,
        this.createdAt,
        this.updatedAt,
        this.iV});

  RetailerDetails.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    employeeId = json['employeeId'];
    shopName = json['shopName'];
    city = json['city'];
    state = json['state'];
    pincode = json['pincode'];
    alternatePhone = json['alternatePhone'];
    landmark = json['landmark'];
    gstNumber = json['gstNumber'];
    shopTiming = json['shopTiming'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['employeeId'] = this.employeeId;
    data['shopName'] = this.shopName;
    data['city'] = this.city;
    data['state'] = this.state;
    data['pincode'] = this.pincode;
    data['alternatePhone'] = this.alternatePhone;
    data['landmark'] = this.landmark;
    data['gstNumber'] = this.gstNumber;
    data['shopTiming'] = this.shopTiming;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}
