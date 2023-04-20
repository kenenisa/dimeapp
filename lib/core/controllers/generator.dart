import 'package:fast_rsa/fast_rsa.dart';

String uniqueTransactionToken() {
  return DateTime.now().millisecondsSinceEpoch.toString();
}

Future<String> generateSignature(
    {required String publicAddress,
    required String receiverAddress,
    required double amount,
    required String privateKey}) async {
  final sigData = {
    'publicAddress': publicAddress,
    'receiverAddress': receiverAddress,
    'amount': amount,
    'date': DateTime.now().toIso8601String(),
    'uniqueTransactionToken': uniqueTransactionToken(),
  };

  final sigHashed = await RSA.hash(sigData.toString(), Hash.SHA256);

  final sigEncrypted = await RSA.encryptPKCS1v15(
    sigHashed,
    privateKey,
  );

  final signature = RSA.base64(sigEncrypted);
  return signature;
}
