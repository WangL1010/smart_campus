import 'package:flutter/material.dart';

class NewsDetailCard extends StatelessWidget {
  const NewsDetailCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _buildBg(children: []);
  }

  Widget _buildBg({required List<Widget> children}) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ...children,
        ],
      ),
    );
  }
}
