class WholesalerDashboardModel {
  bool? success;
  Cards? cards;
  Analytics? analytics;
  List<RecentActivity>? recentActivity;

  WholesalerDashboardModel(
      {this.success, this.cards, this.analytics, this.recentActivity});

  WholesalerDashboardModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    cards = json['cards'] != null ? new Cards.fromJson(json['cards']) : null;
    analytics = json['analytics'] != null
        ? new Analytics.fromJson(json['analytics'])
        : null;
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
    if (this.cards != null) {
      data['cards'] = this.cards!.toJson();
    }
    if (this.analytics != null) {
      data['analytics'] = this.analytics!.toJson();
    }
    if (this.recentActivity != null) {
      data['recentActivity'] =
          this.recentActivity!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Cards {
  int? todaysOrders;
  var pendingAmount;
  int? totalRetailers;

  Cards({this.todaysOrders, this.pendingAmount, this.totalRetailers});

  Cards.fromJson(Map<String, dynamic> json) {
    todaysOrders = json['todaysOrders'];
    pendingAmount = json['pendingAmount'];
    totalRetailers = json['totalRetailers'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['todaysOrders'] = this.todaysOrders;
    data['pendingAmount'] = this.pendingAmount;
    data['totalRetailers'] = this.totalRetailers;
    return data;
  }
}

class Analytics {
  List<Last7DaysRetailerOrders>? last7DaysRetailerOrders;
  List<Null>? topSellingBreads;

  Analytics({this.last7DaysRetailerOrders, this.topSellingBreads});

  Analytics.fromJson(Map<String, dynamic> json) {
    if (json['last7DaysRetailerOrders'] != null) {
      last7DaysRetailerOrders = <Last7DaysRetailerOrders>[];
      json['last7DaysRetailerOrders'].forEach((v) {
        last7DaysRetailerOrders!.add(new Last7DaysRetailerOrders.fromJson(v));
      });
    }
    // if (json['topSellingBreads'] != null) {
    //   topSellingBreads = <Null>[];
    //   // json['topSellingBreads'].forEach((v) {
    //   //   topSellingBreads!.add(new Null.fromJson(v));
    //   // });
    // }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.last7DaysRetailerOrders != null) {
      data['last7DaysRetailerOrders'] =
          this.last7DaysRetailerOrders!.map((v) => v.toJson()).toList();
    }
    // if (this.topSellingBreads != null) {
    //   data['topSellingBreads'] =
    //       this.topSellingBreads!.map((v) => v.toJson()).toList();
    // }
    return data;
  }
}

class Last7DaysRetailerOrders {
  String? date;
  int? orders;

  Last7DaysRetailerOrders({this.date, this.orders});

  Last7DaysRetailerOrders.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    orders = json['orders'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['date'] = this.date;
    data['orders'] = this.orders;
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
