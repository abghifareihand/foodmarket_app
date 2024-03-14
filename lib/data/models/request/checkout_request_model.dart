import 'dart:convert';

class CheckoutRequestModel {
    final int foodId;
    final int quantity;
    final int total;
    final String status;

    CheckoutRequestModel({
        required this.foodId,
        required this.quantity,
        required this.total,
        this.status = 'PENDING', // Tambahkan default value 'PENDING' di sini
    });

    factory CheckoutRequestModel.fromJson(String str) => CheckoutRequestModel.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory CheckoutRequestModel.fromMap(Map<String, dynamic> json) => CheckoutRequestModel(
        foodId: json["food_id"],
        quantity: json["quantity"],
        total: json["total"],
        status: json["status"],
    );

    Map<String, dynamic> toMap() => {
        "food_id": foodId,
        "quantity": quantity,
        "total": total,
        "status": status,
    };
}
