class AuthModel {
  String? token;
  EmployeeData? employeeData;

  AuthModel({this.token, this.employeeData});

  AuthModel.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    employeeData = json['employeeData'] != null
        ? new EmployeeData.fromJson(json['employeeData'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token'] = this.token;
    if (this.employeeData != null) {
      data['employeeData'] = this.employeeData!.toJson();
    }
    return data;
  }
}

class EmployeeData {
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

  EmployeeData(
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
        this.iV});

  EmployeeData.fromJson(Map<String, dynamic> json) {
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
    return data;
  }
}
