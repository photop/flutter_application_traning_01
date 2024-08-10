import 'package:flutter/material.dart';
import 'package:flutter_application_traning_01/screens/home/home_screen.dart';
import 'package:flutter_application_traning_01/screens/home/setting_screen.dart';
import 'package:flutter_application_traning_01/screens/home/profile_screen.dart';

//สร้าง Class BottomMenu เพื่อเรียกใช้งาน
class BottomMenu {
  final String title;
  final IconData icon;
  final Widget screen;

  const BottomMenu(
      {required this.title, required this.icon, required this.screen});
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _SelectedIndex = 0;

  List<BottomMenu> bottomMenuList = [
// สร้าง List BottomMenu และส่งค่ากลับไปยังหน้าที่ต้องการ
    BottomMenu(
      title: 'หน้าหลัก',
      icon: Icons.home,
      screen: HomeScreen(),
    ),

    BottomMenu(
      title: 'หน้ารายการ',
      icon: Icons.list,
      screen: SettingScreen(),
    ),

    BottomMenu(
      title: 'หน้าข้อมูล',
      icon: Icons.info,
      screen: ProfileScreen(),
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(bottomMenuList[_SelectedIndex].title),
      ),
      body: bottomMenuList[_SelectedIndex].screen,
      bottomNavigationBar: BottomNavigationBar(
          items: bottomMenuList

              // map คือการทํางานทีละตัว
              .map((menu) => BottomNavigationBarItem(
                    icon: Icon(menu.icon),
                    label: menu.title,
                  ))
              .toList(),
          onTap: (index) {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => bottomMenuList[index].screen),
            );
          }),
    );
  }
}
