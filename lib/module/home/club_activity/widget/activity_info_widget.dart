import 'package:flutter/material.dart';

class ActivityInfoWidget extends StatelessWidget {
  const ActivityInfoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _buildBg(children: []);
  }

  Widget _buildBg({required List<Widget> children}) {
    return Container(
      color: Colors.white,
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          ...children,
        ],
      ),
    );
  }
}
