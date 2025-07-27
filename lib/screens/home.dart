import 'package:flutter/cupertino.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(middle: Text('Trang chủ')),
      child: Center(
        child: Text('Đây là trang chủ', style: TextStyle(fontSize: 20)),
      ),
    );
  }
}
