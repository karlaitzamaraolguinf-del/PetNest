import 'package:local_auth/local_auth.dart';

class BiometricService {
  final LocalAuthentication auth = LocalAuthentication();

  Future<bool> authenticate() async {
    try {
      final canCheck =
      await auth.canCheckBiometrics;

      if (!canCheck) {
        return false;
      }

      return await auth.authenticate(
        localizedReason:
        'Autenticación de administrador',
        options: const AuthenticationOptions(
          biometricOnly: true,
        ),
      );
    } catch (e) {
      print("Error biométrico: $e");
      return false;
    }
  }
}