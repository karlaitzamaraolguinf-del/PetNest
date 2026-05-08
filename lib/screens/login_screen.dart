import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/auth_provider.dart';
import '../services/auth_service.dart';
import '../services/biometric_service.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() =>
      _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;

  final AuthService _authService = AuthService();
  final BiometricService _biometricService =
  BiometricService();

  bool isLoading = false;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    _fadeAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeIn,
      ),
    );

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> userLogin() async {
    setState(() {
      isLoading = true;
    });

    final user =
    await _authService.signInWithGoogle();

    setState(() {
      isLoading = false;
    });

    if (user != null && mounted) {
      Provider.of<AuthProvider>(
        context,
        listen: false,
      ).loginUser(
        name: user.displayName ?? "Usuario",
        userEmail: user.email ?? "",
        userPhoto: user.photoURL ?? "",
      );

      Navigator.pushReplacementNamed(
        context,
        '/home',
      );
    }
  }

  Future<void> adminLogin() async {
    final authenticated =
    await _biometricService.authenticate();

    if (authenticated && mounted) {
      Provider.of<AuthProvider>(
        context,
        listen: false,
      ).loginAdmin();

      Navigator.pushReplacementNamed(
        context,
        '/admin',
      );
    }
  }

  Widget roleButton({
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        margin:
        const EdgeInsets.symmetric(vertical: 12),
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius:
          BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            Icon(
              icon,
              size: 35,
              color: const Color(0xFFC8A27A),
            ),
            const SizedBox(width: 15),
            Expanded(
              child: Column(
                crossAxisAlignment:
                CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight:
                      FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.black54,
                    ),
                  ),
                ],
              ),
            ),
            const Icon(
              Icons.arrow_forward_ios,
              color: Color(0xFFC8A27A),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
      const Color(0xFFF8F3EE),
      body: FadeTransition(
        opacity: _fadeAnimation,
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: Column(
            mainAxisAlignment:
            MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/icons/paw.png',
                width: 120,
              ),
              const SizedBox(height: 25),
              const Text(
                'Bienvenido a PetNest',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight:
                  FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Selecciona tu tipo de acceso',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black54,
                ),
              ),
              const SizedBox(height: 40),
              if (isLoading)
                const CircularProgressIndicator(),
              if (!isLoading)
                roleButton(
                  icon: Icons.person,
                  title:
                  'Entrar como Usuario',
                  subtitle:
                  'Acceso con Google',
                  onTap: userLogin,
                ),
              roleButton(
                icon: Icons.fingerprint,
                title:
                'Entrar como Administrador',
                subtitle:
                'Acceso con huella',
                onTap: adminLogin,
              ),
            ],
          ),
        ),
      ),
    );
  }
}