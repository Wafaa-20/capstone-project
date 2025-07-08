import 'package:easy_localization/easy_localization.dart';
import 'package:taleq/features/payment/data/models/payment_model.dart';

abstract class PaymentDatasource {
  Future<PaymentModel> getPayment();
}

class PaymentDatasourceImpl implements PaymentDatasource {
  @override
  Future<PaymentModel> getPayment() async {
    
    // This is just a placeholder implementation
    return PaymentModel(
      id: '1'.tr(),
      name: 'Payment Name'.tr(),
    );
  }
}
