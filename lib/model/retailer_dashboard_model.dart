class RetailerDashboardModel {
  bool? success;
  List<RecentActivity>? recentActivity;

  RetailerDashboardModel({this.success, this.recentActivity});

  RetailerDashboardModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['recentActivity'] != null) {
      recentActivity = <RecentActivity>[];
      json['recentActivity'].forEach((v) {
        recentActivity!.add(new RecentActivity.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.recentActivity != null) {
      data['recentActivity'] =
          this.recentActivity!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class RecentActivity {
  String? type;
  String? message;
  String? time;

  RecentActivity({this.type, this.message, this.time});

  RecentActivity.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    message = json['message'];
    time = json['time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['message'] = this.message;
    data['time'] = this.time;
    return data;
  }
}
