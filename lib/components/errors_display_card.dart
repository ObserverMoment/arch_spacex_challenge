import 'package:flutter/material.dart';

class ErrorsDisplayCard extends StatelessWidget {
  final List<String> errors;
  final VoidCallback? retry;
  const ErrorsDisplayCard({super.key, required this.errors, this.retry});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Center(
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('Oh no, something went wrong...'),
                ),
                ...errors
                    .map((e) => Padding(
                          padding: const EdgeInsets.symmetric(vertical: 4.0),
                          child: Text(
                            e,
                            maxLines: 2,
                          ),
                        ))
                    .toList(),
                if (retry != null)
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: OutlinedButton.icon(
                        onPressed: retry,
                        icon: const Icon(Icons.repeat),
                        label: const Text('Try Again')),
                  )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
