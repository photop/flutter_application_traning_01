import 'package:flutter/material.dart';
import 'package:flutter_application_traning_01/screens/sc_main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
// ประกาศตัวแปร สำหรับใช้งาน form
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  // ประกาศตัวแปรสำหรับเก็บข้อมูล รอข้อมูลจากผู้ใช้

  void _login() async {
    final prefs = await SharedPreferences.getInstance();
    if (_formKey.currentState!.validate()) {
      prefs.setBool('isLogin', true);
      // TODO: Implement login logic
      // Navigator.pushNamed(context, '/home');
      // เมื่อมีการใช้งาน่แล้วให้กลับไปหน้าหลักและลบข้อมูลก่อนหน้า
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => MainScreen(),
          ),
          (route) => false);
    }
  }

  void _checkLogin() async {
    final prefs = await SharedPreferences.getInstance();
    // ตรวจสอบว่ามีการเข้าสู่ระบบหรือไม่
    if (prefs.getBool('isLogin') == true) {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => MainScreen(),
          ),
          (route) => false);
    }
  }

// ประกาศค่าเมื่อมีการเรียกใช้งาน
  void initState() {
    // TODO: implement initState
    _checkLogin();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          //ระบุ key ของ form
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  if (!value.contains('@')) {
                    return 'Please enter a valid email (must contain @)';
                  }
                  RegExp emailRegex =
                      RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
                  if (!emailRegex.hasMatch(value)) {
                    return 'Please enter a valid email';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  }
                  if (value.length < 6) {
                    return 'Password must be at least 6 characters';
                  }
                  return null;
                },
              ),
              ElevatedButton(
                onPressed: _login,
                child: Text('Login'),
              ),
              TextButton(
                onPressed: () {
                  // สำหรับสมัครสมาชิก
                },
                child: Text('Register'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
