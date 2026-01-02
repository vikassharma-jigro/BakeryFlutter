class WholesalerAccountsModel {
  final bool? success;
  final RetailerSummary? retailerSummary;
  final AmountFlow? amountFlow;
  final List<RecentTransaction>? recentTransactions;
  final List<RetailerOrder>? retailerOrders;
  final Assets? assets;
  final Liabilities? liabilities;

  WholesalerAccountsModel({
    this.success,
    this.retailerSummary,
    this.amountFlow,
    this.recentTransactions,
    this.retailerOrders,
    this.assets,
    this.liabilities,
  });

  factory WholesalerAccountsModel.fromJson(Map<String, dynamic> json) {
    return WholesalerAccountsModel(
      success: json['success'],
      retailerSummary: json['retailerSummary'] != null
          ? RetailerSummary.fromJson(json['retailerSummary'])
          : null,
      amountFlow: json['amountFlow'] != null
          ? AmountFlow.fromJson(json['amountFlow'])
          : null,
      recentTransactions: (json['recentTransactions'] as List?)
          ?.map((e) => RecentTransaction.fromJson(e))
          .toList(),
      retailerOrders: (json['retailerOrders'] as List?)
          ?.map((e) => RetailerOrder.fromJson(e))
          .toList(),
      assets:
      json['assets'] != null ? Assets.fromJson(json['assets']) : null,
      liabilities: json['liabilities'] != null
          ? Liabilities.fromJson(json['liabilities'])
          : null,
    );
  }
}
class RetailerSummary {
  final double? pendingAmount;
  final double? paidAmount;
  final double? totalAmount;
   var lastPaymentDate;

  RetailerSummary({
    this.pendingAmount,
    this.paidAmount,
    this.totalAmount,
    this.lastPaymentDate,
  });

  factory RetailerSummary.fromJson(Map<String, dynamic> json) {
    return RetailerSummary(
      pendingAmount: (json['pendingAmount'] as num?)?.toDouble(),
      paidAmount: (json['paidAmount'] as num?)?.toDouble(),
      totalAmount: (json['totalAmount'] as num?)?.toDouble(),
      lastPaymentDate: json['lastPaymentDate'],
    );
  }
}
class AmountFlow {
  final double? receivedFromRetailers;
  final double? toPayManagers;
  final double? paidToManagers;

  AmountFlow({
    this.receivedFromRetailers,
    this.toPayManagers,
    this.paidToManagers,
  });

  factory AmountFlow.fromJson(Map<String, dynamic> json) {
    return AmountFlow(
      receivedFromRetailers:
      (json['receivedFromRetailers'] as num?)?.toDouble(),
      toPayManagers: (json['toPayManagers'] as num?)?.toDouble(),
      paidToManagers: (json['paidToManagers'] as num?)?.toDouble(),
    );
  }
}
class RecentTransaction {
  final String? id;
  final UserInfo? orderFrom;
  final UserInfo? orderTo;
  final String? paymentMode;
  final double? totalAmount;
  final String? orderType;
  final String? createdAt;

  RecentTransaction({
    this.id,
    this.orderFrom,
    this.orderTo,
    this.paymentMode,
    this.totalAmount,
    this.orderType,
    this.createdAt,
  });

  factory RecentTransaction.fromJson(Map<String, dynamic> json) {
    return RecentTransaction(
      id: json['_id'],
      orderFrom:
      json['orderFrom'] != null ? UserInfo.fromJson(json['orderFrom']) : null,
      orderTo:
      json['orderTo'] != null ? UserInfo.fromJson(json['orderTo']) : null,
      paymentMode: json['paymentMode'],
      totalAmount: (json['totalAmount'] as num?)?.toDouble(),
      orderType: json['orderType'],
      createdAt: json['createdAt'],
    );
  }
}

class UserInfo {
  final String? id;
  final String? name;
  final String? role;

  UserInfo({this.id, this.name, this.role});

  factory UserInfo.fromJson(Map<String, dynamic> json) {
    return UserInfo(
      id: json['_id'],
      name: json['name'],
      role: json['role'],
    );
  }
}
class RetailerOrder {
  final String? id;
  final String? paymentMode;
  final String? paymentStatus;
  final double? totalAmount;
  final String? createdAt;

  RetailerOrder({
    this.id,
    this.paymentMode,
    this.paymentStatus,
    this.totalAmount,
    this.createdAt,
  });

  factory RetailerOrder.fromJson(Map<String, dynamic> json) {
    return RetailerOrder(
      id: json['_id'],
      paymentMode: json['paymentMode'],
      paymentStatus: json['paymentStatus'],
      totalAmount: (json['totalAmount'] as num?)?.toDouble(),
      createdAt: json['createdAt'],
    );
  }
}
class Assets {
  final int? totalRetailersPendingCount;
  final double? totalRetailerPendingAmount;
  final List<AssetItem>? list;

  Assets({
    this.totalRetailersPendingCount,
    this.totalRetailerPendingAmount,
    this.list,
  });

  factory Assets.fromJson(Map<String, dynamic> json) {
    return Assets(
      totalRetailersPendingCount: json['totalRetailersPendingCount'],
      totalRetailerPendingAmount:
      (json['totalRetailerPendingAmount'] as num?)?.toDouble(),
      list: (json['list'] as List?)
          ?.map((e) => AssetItem.fromJson(e))
          .toList(),
    );
  }
}

class AssetItem {
  final String? id;
  final double? totalPending;
  final String? lastPaidDate;
  final String? lastPaidMode;
  final String? shopName;
  final String? retailerName;

  AssetItem({
    this.id,
    this.totalPending,
    this.lastPaidDate,
    this.lastPaidMode,
    this.shopName,
    this.retailerName,
  });

  factory AssetItem.fromJson(Map<String, dynamic> json) {
    return AssetItem(
      id: json['_id'],
      totalPending: (json['totalPending'] as num?)?.toDouble(),
      lastPaidDate: json['lastPaidDate'],
      lastPaidMode: json['lastPaidMode'],
      shopName: json['shopName'],
      retailerName: json['retailerName'],
    );
  }
}
class Liabilities {
  final double? totalLiabilities;
  final List<LiabilityItem>? list;

  Liabilities({this.totalLiabilities, this.list});

  factory Liabilities.fromJson(Map<String, dynamic> json) {
    return Liabilities(
      totalLiabilities: (json['totalLiabilities'] as num?)?.toDouble(),
      list: (json['list'] as List?)
          ?.map((e) => LiabilityItem.fromJson(e))
          .toList(),
    );
  }
}

class LiabilityItem {
  final String? id;
  final String? managerId;
  final String? managerName;
  final double? totalAmount;
  final String? paymentStatus;
  final String? paymentMode;
  final String? createdAt;
  final List<String>? products;

  LiabilityItem({
    this.id,
    this.managerId,
    this.managerName,
    this.totalAmount,
    this.paymentStatus,
    this.paymentMode,
    this.createdAt,
    this.products,
  });

  factory LiabilityItem.fromJson(Map<String, dynamic> json) {
    return LiabilityItem(
      id: json['_id'],
      managerId: json['managerId'],
      managerName: json['managerName'],
      totalAmount: (json['totalAmount'] as num?)?.toDouble(),
      paymentStatus: json['paymentStatus'],
      paymentMode: json['paymentMode'],
      createdAt: json['createdAt'],
      products: (json['products'] as List?)?.cast<String>(),
    );
  }
}
