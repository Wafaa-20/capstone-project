import 'package:taleq/features/payment/data/models/payment_model.dart';

abstract class PaymentDatasource {
  Future<PaymentModel> getPayment();
}

class PaymentDatasourceImpl implements PaymentDatasource {
  @override
  Future<PaymentModel> getPayment() async {
    // TODO: implement actual data source logic
    // This is just a placeholder implementation
    return PaymentModel(
      id: '1',
      name: 'Payment Name',
    );
  }
}
