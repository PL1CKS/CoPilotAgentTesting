# Contributing to Flutter Web App

Thank you for considering contributing to this project! Here are some guidelines to help you get started.

## Code of Conduct

Please be respectful and considerate of others. We aim to create a welcoming and inclusive environment.

## How to Contribute

### Reporting Bugs

If you find a bug, please create an issue with:
- A clear title and description
- Steps to reproduce the issue
- Expected behavior
- Actual behavior
- Screenshots if applicable
- Your environment (browser, OS, Flutter version)

### Suggesting Features

Feature suggestions are welcome! Please create an issue with:
- A clear title and description
- The problem your feature would solve
- How you envision the feature working
- Any alternative solutions you've considered

### Pull Requests

1. Fork the repository
2. Create a new branch for your feature (`git checkout -b feature/amazing-feature`)
3. Make your changes following our coding standards
4. Run tests and linting to ensure code quality
5. Commit your changes with clear messages
6. Push to your branch
7. Open a Pull Request with a clear title and description

## Development Setup

1. Install Flutter SDK (3.0.0 or higher)
2. Clone the repository
3. Run `flutter pub get` to install dependencies
4. Run `flutter run -d chrome` to start the development server

## Coding Standards

### Dart Style Guide

Follow the [Effective Dart](https://dart.dev/guides/language/effective-dart) guidelines:

- Use `const` constructors where possible
- Prefer single quotes for strings
- Use trailing commas for better formatting
- Add documentation comments for public APIs
- Keep functions small and focused
- Use meaningful variable and function names

### Code Organization

```
lib/
├── main.dart           # App entry point
├── screens/            # Screen/page widgets
├── widgets/            # Reusable widgets
└── utils/              # Utility functions and constants
```

### Before Submitting

Run these commands to ensure your code meets our standards:

```bash
# Format code
flutter format lib test

# Analyze code
flutter analyze

# Run tests
flutter test
```

All checks must pass before your PR can be merged.

## Testing

- Write widget tests for UI components
- Write unit tests for business logic
- Ensure all tests pass before submitting PR
- Aim for meaningful test coverage

Example test:

```dart
testWidgets('Button shows correct text', (WidgetTester tester) async {
  await tester.pumpWidget(const MyWidget());
  expect(find.text('Click Me'), findsOneWidget);
});
```

## Documentation

- Document all public APIs with `///` comments
- Keep README.md up to date
- Add inline comments for complex logic
- Update CHANGELOG.md for notable changes

## Commit Messages

Write clear, descriptive commit messages:

- Use present tense ("Add feature" not "Added feature")
- Use imperative mood ("Move cursor to..." not "Moves cursor to...")
- Keep first line under 50 characters
- Add detailed description if needed

Good examples:
```
Add dark mode support
Fix navigation bug on home page
Update dependencies to latest versions
```

## Questions?

Feel free to open an issue for any questions about contributing!
