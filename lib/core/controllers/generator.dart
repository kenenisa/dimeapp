import 'package:fast_rsa/fast_rsa.dart';
import 'package:nuvio/blocs/keys_bloc.dart';
import 'package:provider/provider.dart';

String uniqueTransactionToken() {
  return DateTime.now().millisecondsSinceEpoch.toString();
}

Future<String> generateSignature(
    {required String publicAddress,
    required String receiverAddress,
    required double amount}) async {
  final sig_data = {
    'publicAddress': publicAddress,
    'receiverAddress': receiverAddress,
    'amount': amount,
    'date': DateTime.now().toIso8601String(),
    'uniqueTransactionToken': uniqueTransactionToken(),
  };

  final sig_hashed = await RSA.hash(sig_data.toString(), Hash.SHA256);

  var privateKey = Provider.of<KeyBloc>(context, listen: false);

  final sig_encrypted = await RSA.encryptPKCS1v15(
    sig_hashed,
    privateKey,
  );

  final signature = RSA.base64(sig_encrypted);
  return signature;
}
