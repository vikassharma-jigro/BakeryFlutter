class RetailerListModel {
  List<RetailerData>? data;
  Pagination? pagination;

  RetailerListModel({this.data, this.pagination});

  RetailerListModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <RetailerData>[];
      json['data'].forEach((v) {
        data!.add(new RetailerData.fromJson(v));
      });
    }
    pagination = json['pagination'] != null
        ? new Pagination.fromJson(json['pagination'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    if (this.pagination != null) {
      data['pagination'] = this.pagination!.toJson();
    }
    return data;
  }
}

class RetailerData {
  String? sId;
  String? empId;
  String? name;
  String? email;
  String? role;
  String? department;
  String? status;
  int? phone;
  String? createdBy;
  String? joiningDate;
  String? createdAt;
  String? updatedAt;
  List<EmployeeDetails>? employeeDetails;
  List<Addresses>? addresses;

  RetailerData(
      {this.sId,
        this.empId,
        this.name,
        this.email,
        this.role,
        this.department,
        this.status,
        this.phone,
        this.createdBy,
        this.joiningDate,
        this.createdAt,
        this.updatedAt,
        this.employeeDetails,
        this.addresses});

  RetailerData.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    empId = json['empId'];
    name = json['name'];
    email = json['email'];
    role = json['role'];
    department = json['department'];
    status = json['status'];
    phone = json['phone'];
    createdBy = json['createdBy'];
    joiningDate = json['joiningDate'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    if (json['employeeDetails'] != null) {
      employeeDetails = <EmployeeDetails>[];
      json['employeeDetails'].forEach((v) {
        employeeDetails!.add(new EmployeeDetails.fromJson(v));
      });
    }
    if (json['addresses'] != null) {
      addresses = <Addresses>[];
      json['addresses'].forEach((v) {
        addresses!.add(new Addresses.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['empId'] = this.empId;
    data['name'] = this.name;
    data['email'] = this.email;
    data['role'] = this.role;
    data['department'] = this.department;
    data['status'] = this.status;
    data['phone'] = this.phone;
    data['createdBy'] = this.createdBy;
    data['joiningDate'] = this.joiningDate;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    if (this.employeeDetails != null) {
      data['employeeDetails'] =
          this.employeeDetails!.map((v) => v.toJson()).toList();
    }
    if (this.addresses != null) {
      data['addresses'] = this.addresses!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class EmployeeDetails {
  String? shopName;
  String? alternatePhone;
  String? shopTiming;
  String? shopImage;
  String? textCode;
  String? identityCardPhoto;
  String? textCodePhoto;

  EmployeeDetails(
      {this.shopName,
        this.alternatePhone,
        this.shopTiming,
        this.shopImage,
        this.textCode,
        this.identityCardPhoto,
        this.textCodePhoto});

  EmployeeDetails.fromJson(Map<String, dynamic> json) {
    shopName = json['shopName'];
    alternatePhone = json['alternatePhone'];
    shopTiming = json['shopTiming'];
    shopImage = json['shopImage'];
    textCode = json['textCode'];
    identityCardPhoto = json['identityCardPhoto'];
    textCodePhoto = json['textCodePhoto'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['shopName'] = this.shopName;
    data['alternatePhone'] = this.alternatePhone;
    data['shopTiming'] = this.shopTiming;
    data['shopImage'] = this.shopImage;
    data['textCode'] = this.textCode;
    data['identityCardPhoto'] = this.identityCardPhoto;
    data['textCodePhoto'] = this.textCodePhoto;
    return data;
  }
}

class Addresses {
  String? landmark;
  String? addressLine;
  String? city;
  String? state;
  String? pincode;
  bool? isDefault;

  Addresses(
      {this.landmark,
        this.addressLine,
        this.city,
        this.state,
        this.pincode,
        this.isDefault});

  Addresses.fromJson(Map<String, dynamic> json) {
    landmark = json['landmark'];
    addressLine = json['addressLine'];
    city = json['city'];
    state = json['state'];
    pincode = json['pincode'];
    isDefault = json['isDefault'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['landmark'] = this.landmark;
    data['addressLine'] = this.addressLine;
    data['city'] = this.city;
    data['state'] = this.state;
    data['pincode'] = this.pincode;
    data['isDefault'] = this.isDefault;
    return data;
  }
}

class Pagination {
  int? total;
  int? page;
  int? limit;
  int? pages;

  Pagination({this.total, this.page, this.limit, this.pages});

  Pagination.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    page = json['page'];
    limit = json['limit'];
    pages = json['pages'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total'] = this.total;
    data['page'] = this.page;
    data['limit'] = this.limit;
    data['pages'] = this.pages;
    return data;
  }
}
