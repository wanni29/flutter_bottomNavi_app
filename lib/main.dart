import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: [
          Center(child: Text("IndexedStack 1")), // -> 0 번지 부터 시작
          Center(child: Text("IndexedStack 2")),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex, // 현재 index 알려주기
        showSelectedLabels: false, // 아이콘 밑에 레이블을 표시할래?
        showUnselectedLabels: false,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black54,
        onTap: (value) {
          print("선택된 바텀 메뉴 $value"); // 뭐가 클릭되었는지 보는거야.

          setState(() {
            // 값을 바꾸면서 리빌드 한다.
            _selectedIndex = value;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.account_balance),
            label: "", // icon 과 label 값은 시그니처기때문에 무조건 넣어야 에러가 안뜬다.
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "",
          )
        ],
      ),
    );
  }
}
