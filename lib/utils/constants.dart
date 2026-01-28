/// Utility constants used throughout the application
library utils;

/// App-wide spacing constants
class Spacing {
  Spacing._(); // Private constructor to prevent instantiation

  /// Extra small spacing (4px)
  static const double xs = 4.0;

  /// Small spacing (8px)
  static const double sm = 8.0;

  /// Medium spacing (16px)
  static const double md = 16.0;

  /// Large spacing (24px)
  static const double lg = 24.0;

  /// Extra large spacing (32px)
  static const double xl = 32.0;

  /// Extra extra large spacing (48px)
  static const double xxl = 48.0;
}

/// App-wide breakpoints for responsive design
class Breakpoints {
  Breakpoints._(); // Private constructor to prevent instantiation

  /// Mobile breakpoint (< 600px)
  static const double mobile = 600;

  /// Tablet breakpoint (< 900px)
  static const double tablet = 900;

  /// Desktop breakpoint (>= 900px)
  static const double desktop = 900;
}

/// Extension methods for responsive design
extension ResponsiveContext on num {
  /// Returns true if screen width is mobile size
  bool get isMobile => this < Breakpoints.mobile;

  /// Returns true if screen width is tablet size
  bool get isTablet =>
      this >= Breakpoints.mobile && this < Breakpoints.desktop;

  /// Returns true if screen width is desktop size
  bool get isDesktop => this >= Breakpoints.desktop;
}
