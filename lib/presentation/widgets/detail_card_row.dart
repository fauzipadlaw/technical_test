import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class DetailCardRow extends StatelessWidget {
  final String title;
  final String content;
  const DetailCardRow({
    super.key,
    required this.title,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Animate(
      effects: const [FadeEffect(duration: Duration(milliseconds: 1000))],
      child: Card(
        margin: const EdgeInsets.symmetric(vertical: 8.0),
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 120,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        title,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const Text(
                      ':',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                width: 4,
              ),
              Expanded(
                child: Text(
                  content,
                  style: const TextStyle(fontSize: 16),
                ).animate().fadeIn(
                      duration: const Duration(milliseconds: 700),
                    ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
