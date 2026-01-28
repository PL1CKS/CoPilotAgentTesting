import 'package:flutter/material.dart';

/// A reusable card widget with consistent styling
class CustomCard extends StatelessWidget {
  /// Creates a custom card widget
  const CustomCard({
    required this.child,
    this.padding = const EdgeInsets.all(16.0),
    this.elevation = 2.0,
    super.key,
  });

  /// The widget to display inside the card
  final Widget child;

  /// Padding around the child widget
  final EdgeInsetsGeometry padding;

  /// Card elevation (shadow depth)
  final double elevation;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: elevation,
      child: Padding(
        padding: padding,
        child: child,
      ),
    );
  }
}

/// A loading indicator with optional text
class LoadingIndicator extends StatelessWidget {
  /// Creates a loading indicator
  const LoadingIndicator({
    this.message,
    super.key,
  });

  /// Optional message to display below the spinner
  final String? message;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CircularProgressIndicator(),
          if (message != null) ...[
            const SizedBox(height: 16),
            Text(
              message!,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ],
      ),
    );
  }
}

/// A responsive container that adapts to screen size
class ResponsiveContainer extends StatelessWidget {
  /// Creates a responsive container
  const ResponsiveContainer({
    required this.child,
    this.maxWidth = 1200,
    this.padding = const EdgeInsets.all(16.0),
    super.key,
  });

  /// The widget to display inside the container
  final Widget child;

  /// Maximum width of the container
  final double maxWidth;

  /// Padding around the child widget
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        constraints: BoxConstraints(maxWidth: maxWidth),
        padding: padding,
        child: child,
      ),
    );
  }
}
