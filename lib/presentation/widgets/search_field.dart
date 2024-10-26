import 'package:flutter/material.dart';

class SearchField extends StatelessWidget {
  final Function(String) onChanged;
  final TextEditingController controller;
  const SearchField({
    super.key,
    required this.onChanged,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30.0),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 10.0,
              offset: Offset(0, 5),
            ),
          ],
        ),
        child: TextField(
          controller: controller,
          decoration: InputDecoration(
            hintText: 'Search name',
            hintStyle: TextStyle(color: Colors.grey[400]),
            prefixIcon: Icon(Icons.search, color: Colors.grey[400]),
            suffixIcon: IconButton(
              icon: Icon(Icons.clear, color: Colors.grey[400]),
              onPressed: () {
                if (controller.text.isNotEmpty) {
                  controller.clear();
                  onChanged('');
                }
              },
            ),
            border: InputBorder.none,
            contentPadding: const EdgeInsets.symmetric(vertical: 15.0),
          ),
          onChanged: onChanged,
        ),
      ),
    );
  }
}
