import 'package:flutter/material.dart';

SnackBar buildErrorSnackbar(String message) {
  return SnackBar(
    backgroundColor: Colors.red,
    content: Row(
      children: [
        const Icon(Icons.error_outline, color: Colors.white, size: 28),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Error Occurred',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
              Text(
                message,
                style: const TextStyle(fontSize: 14, color: Colors.white70),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
