class NotificationListModel {
  bool? success;
  int? count;
  List<NotificationData>? data;

  NotificationListModel({this.success, this.count, this.data});

  NotificationListModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    count = json['count'];
    if (json['data'] != null) {
      data = <NotificationData>[];
      json['data'].forEach((v) {
        data!.add(new NotificationData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['count'] = this.count;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class NotificationData {
  String? sId;
  String? type;
  String? title;
  String? message;
  String? orderId;
  List<String>? targetRoles;
  var targetUserId;
  bool? isRead;
  String? createdAt;
  String? updatedAt;
  int? iV;
  String? createdByRole;

  NotificationData(
      {this.sId,
        this.type,
        this.title,
        this.message,
        this.orderId,
        this.targetRoles,
        this.targetUserId,
        this.isRead,
        this.createdAt,
        this.updatedAt,
        this.iV,
        this.createdByRole});

  NotificationData.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    type = json['type'];
    title = json['title'];
    message = json['message'];
    orderId = json['orderId'];
    targetRoles = json['targetRoles'].cast<String>();
    targetUserId = json['targetUserId'];
    isRead = json['isRead'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
    createdByRole = json['createdByRole'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['type'] = this.type;
    data['title'] = this.title;
    data['message'] = this.message;
    data['orderId'] = this.orderId;
    data['targetRoles'] = this.targetRoles;
    data['targetUserId'] = this.targetUserId;
    data['isRead'] = this.isRead;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    data['createdByRole'] = this.createdByRole;
    return data;
  }
}
