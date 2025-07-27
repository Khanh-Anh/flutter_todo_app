import 'package:flutter/cupertino.dart';
import 'package:to_do_app/screens/home.dart';
import 'package:to_do_app/screens/login.dart';

class AppLayout extends StatelessWidget {
  const AppLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        activeColor: Color.fromARGB(255, 25, 96, 87),
        items: const [
          BottomNavigationBarItem(icon: Icon(CupertinoIcons.home)),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.check_mark_circled),
          ),
          BottomNavigationBarItem(icon: Icon(CupertinoIcons.calendar)),
          BottomNavigationBarItem(icon: Icon(CupertinoIcons.square_grid_2x2)),
          BottomNavigationBarItem(icon: Icon(CupertinoIcons.add_circled)),
        ],
      ),
      tabBuilder: (context, index) {
        final pages = [const HomePage(), const LoginPage()];
        return CupertinoTabView(builder: (context) => pages[index]);
      },
    );
  }
}
