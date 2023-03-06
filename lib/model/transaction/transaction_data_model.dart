// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class TransactionDetails {
  final int userId;
  final int shippingId;
  final int deliveryFee;
  final String paymentMethod;
  final List<Transaction> transactions;

  TransactionDetails(this.userId, this.shippingId, this.deliveryFee,
      this.paymentMethod, this.transactions);

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'user_id': userId,
      'shipping_id': shippingId,
      'delivery_fee': deliveryFee,
      'payment_method': paymentMethod,
      'transactions': transactions.map((x) => x.toMap()).toList(),
    };
  }

  factory TransactionDetails.fromMap(Map<String, dynamic> map) {
    return TransactionDetails(
      map['user_id'] as int,
      map['shipping_id'] as int,
      map['delivery_fee'] as int,
      map['payment_method'] as String,
      List<Transaction>.from(
        (map['transactions'] as List<int>).map<Transaction>(
          (x) => Transaction.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory TransactionDetails.fromJson(String source) =>
      TransactionDetails.fromMap(json.decode(source) as Map<String, dynamic>);
}

class Transaction {
  final int? lensId;
  final int? frameId;
  final int? qty;
  final String? eye;
  final String? rsphere;
  final String? rcylinder;
  final String? raxis;
  final String? radd;
  final String? rprism;
  final String? rbase;
  final String? lsphere;
  final String? lcylinder;
  final String? laxis;
  final String? ladd;
  final String? lprism;
  final String? lbase;

  Transaction(
      this.lensId,
      this.frameId,
      this.qty,
      this.eye,
      this.rsphere,
      this.rcylinder,
      this.raxis,
      this.radd,
      this.rprism,
      this.rbase,
      this.lsphere,
      this.lcylinder,
      this.laxis,
      this.ladd,
      this.lprism,
      this.lbase);

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'lensId': lensId,
      'frameId': frameId,
      'qty': qty,
      'eye': eye,
      'rsphere': rsphere,
      'rcylinder': rcylinder,
      'raxis': raxis,
      'radd': radd,
      'rprism': rprism,
      'rbase': rbase,
      'lsphere': lsphere,
      'lcylinder': lcylinder,
      'laxis': laxis,
      'ladd': ladd,
      'lprism': lprism,
      'lbase': lbase,
    };
  }

  factory Transaction.fromMap(Map<String, dynamic> map) {
    return Transaction(
      map['lensId'] != null ? map['lensId'] as int : null,
      map['frameId'] != null ? map['frameId'] as int : null,
      map['qty'] != null ? map['qty'] as int : null,
      map['eye'] != null ? map['eye'] as String : null,
      map['rsphere'] != null ? map['rsphere'] as String : null,
      map['rcylinder'] != null ? map['rcylinder'] as String : null,
      map['raxis'] != null ? map['raxis'] as String : null,
      map['radd'] != null ? map['radd'] as String : null,
      map['rprism'] != null ? map['rprism'] as String : null,
      map['rbase'] != null ? map['rbase'] as String : null,
      map['lsphere'] != null ? map['lsphere'] as String : null,
      map['lcylinder'] != null ? map['lcylinder'] as String : null,
      map['laxis'] != null ? map['laxis'] as String : null,
      map['ladd'] != null ? map['ladd'] as String : null,
      map['lprism'] != null ? map['lprism'] as String : null,
      map['lbase'] != null ? map['lbase'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Transaction.fromJson(String source) =>
      Transaction.fromMap(json.decode(source) as Map<String, dynamic>);
}
