import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

import 'firebase_options.dart';

import 'providers/auth_provider.dart';
import 'providers/cart_provider.dart';

import 'screens/login_screen.dart';
import 'screens/home_screen.dart';
import 'screens/admin_screen.dart';
import 'screens/profile_screen.dart';
import 'screens/adoption_screen.dart';
import 'screens/shop_screen.dart';
import 'screens/cart_screen.dart';
import 'screens/receipt_screen.dart';
import 'screens/camera_screen.dart';
import 'screens/gallery_screen.dart';
import 'screens/paint_screen.dart';
import 'screens/links_screen.dart';
import 'screens/admin_products_screen.dart';
import 'screens/admin_pets_screen.dart';
import 'screens/admin_users_screen.dart';
import 'screens/admin_adoptions_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const PetNestApp());
}

class PetNestApp extends StatelessWidget {
  const PetNestApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => AuthProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => CartProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'PetNest',
        theme: ThemeData(
          fontFamily: 'Poppins',
          scaffoldBackgroundColor:
          const Color(0xFFF8F3EE),
        ),

        initialRoute: '/login',

        routes: {
          '/login': (context) =>
          const LoginScreen(),

          '/home': (context) =>
          const HomeScreen(),

          '/admin': (context) =>
          const AdminScreen(),

          '/profile': (context) =>
          const ProfileScreen(),

          '/adoption': (context) =>
          const AdoptionScreen(),

          '/shop': (context) =>
          const ShopScreen(),

          '/cart': (context) =>
          const CartScreen(),

          '/receipt': (context) =>
          const ReceiptScreen(),

          '/camera': (context) =>
          const CameraScreen(),

          '/gallery': (context) =>
          const GalleryScreen(),

          '/paint': (context) =>
          const PaintScreen(),

          '/links': (context) =>
          const LinksScreen(),

          '/admin-products': (context) =>
          const AdminProductsScreen(),

          '/admin-pets': (context) =>
          const AdminPetsScreen(),

          '/admin-users': (context) =>
          const AdminUsersScreen(),

          '/admin-adoptions': (context) =>
          const AdminAdoptionsScreen(),
        },
      ),
    );
  }
}