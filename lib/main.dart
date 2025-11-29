import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

void main() {
  runApp(const FlutterLoginApp());
}

class FlutterLoginApp extends StatelessWidget {
  const FlutterLoginApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const FlutterCleanLogin(),
    );
  }
}

class FlutterCleanLogin extends StatefulWidget {
  const FlutterCleanLogin({super.key});

  @override
  State<FlutterCleanLogin> createState() => _FlutterCleanLoginState();
}

class _FlutterCleanLoginState extends State<FlutterCleanLogin> {
  final email = TextEditingController();
  final pass = TextEditingController();
  bool obscure = true;

  @override
  Widget build(BuildContext context) {
    const flutterBlue = Color(0xFF02569B);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              FlutterLogo(size: 100),

              const SizedBox(height: 20),

              /// TITLE
              Text(
                "Welcome!",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: flutterBlue,
                ),
              ),

              const SizedBox(height: 30),

              /// EMAIL FIELD
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(14),
                ),
                child: TextField(
                  controller: email,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.person_outline),
                    border: InputBorder.none,
                    hintText: "Username or Email",
                    contentPadding: const EdgeInsets.symmetric(
                      vertical: 18,
                      horizontal: 16,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 18),

              /// PASSWORD FIELD
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(14),
                ),
                child: TextField(
                  controller: pass,
                  obscureText: obscure,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.lock_outline),
                    suffixIcon: IconButton(
                      icon: Icon(
                        obscure
                            ? Icons.visibility_outlined
                            : Icons.visibility_off_outlined,
                      ),
                      onPressed: () {
                        setState(() => obscure = !obscure);
                      },
                    ),
                    border: InputBorder.none,
                    hintText: "Password",
                    contentPadding: const EdgeInsets.symmetric(
                      vertical: 18,
                      horizontal: 16,
                    ),
                  ),
                ),
              ),

              /// FORGOT PASSWORD
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    "Forgot Password?",
                    style: TextStyle(
                      color: flutterBlue,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 10),

              /// LOGIN BUTTON
              SizedBox(
                width: double.infinity,
                height: 52,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: flutterBlue,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                  child: const Text(
                    "Login",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
              ),

              const SizedBox(height: 25),

              /// DIVIDER
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  socialCircle(button: Buttons.Google, onPressed: () {}),
                  const SizedBox(width: 16),
                  socialCircle(button: Buttons.Apple, onPressed: () {}),
                  const SizedBox(width: 16),
                  socialCircle(button: Buttons.Facebook, onPressed: () {}),
                ],
              ),

              const SizedBox(height: 25),

              /// SIGN UP
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Create an account "),
                  GestureDetector(
                    onTap: () {},
                    child: Text(
                      "Sign Up",
                      style: TextStyle(
                        color: flutterBlue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }

  Widget socialCircle({
    required Buttons button,
    required VoidCallback onPressed,
  }) {
    Color backgroundColor;
    Widget child;

    switch (button) {
      case Buttons.Google:
  backgroundColor = Colors.white;
  child = Image.network(
    'https://www.freepnglogos.com/uploads/google-logo-png/google-logo-png-suite-everything-you-need-know-about-google-newest-0.png',
    width: 28,
    height: 28,
  );
  break;


      case Buttons.Apple:
        backgroundColor = Colors.black;
        child = const Icon(Icons.apple, color: Colors.white, size: 28);
        break;

      case Buttons.Facebook:
        backgroundColor = const Color(0xFF1877F2);
        child = const Icon(Icons.facebook, color: Colors.white, size: 30);
        break;

      default:
        backgroundColor = Colors.grey;
        child = const Icon(Icons.help_outline, color: Colors.white, size: 28);
    }

    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        shape: const CircleBorder(),
        padding: const EdgeInsets.all(12),
        elevation: 3,
      ),
      child: child,
    );
  }
}
