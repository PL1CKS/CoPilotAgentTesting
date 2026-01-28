# Flutter Web App

A Flutter web application built with best practices, targeting web-only deployment.

## Features

- ✨ Material Design 3 (Material You)
- 🌓 Light and Dark theme support with system preference detection
- 📱 Responsive design optimized for web
- 🎨 Clean and modern UI
- ♿ Accessibility focused
- 🔍 Comprehensive linting with strict analysis options
- 🧪 Unit and widget tests included

## Project Structure

```
├── lib/
│   └── main.dart           # Main application entry point
├── test/
│   └── widget_test.dart    # Widget tests
├── web/
│   ├── index.html          # HTML entry point with loading animation
│   ├── manifest.json       # PWA manifest
│   ├── favicon.png         # App favicon
│   └── icons/              # App icons for various sizes
├── pubspec.yaml            # Project dependencies and metadata
├── analysis_options.yaml   # Strict linting rules
└── .gitignore             # Git ignore rules for Flutter

```

## Prerequisites

Before you begin, ensure you have the following installed:
- [Flutter SDK](https://flutter.dev/docs/get-started/install) (3.0.0 or higher)
- A web browser (Chrome, Firefox, Safari, or Edge)

## Getting Started

### 1. Install Dependencies

```bash
flutter pub get
```

### 2. Run the App in Development Mode

```bash
flutter run -d chrome
```

Or use any other browser:

```bash
flutter run -d edge
flutter run -d firefox
```

### 3. Build for Production

```bash
flutter build web
```

The built files will be in the `build/web` directory, ready to be deployed to any web server.

### 4. Build with Specific Options

For optimized production build:

```bash
flutter build web --release --web-renderer canvaskit
```

Options:
- `--web-renderer canvaskit`: Better performance and consistency (larger initial download)
- `--web-renderer html`: Smaller initial download, good for simple apps
- `--base-href /your-path/`: If deploying to a subdirectory

## Testing

### Run All Tests

```bash
flutter test
```

### Run Tests with Coverage

```bash
flutter test --coverage
```

## Code Quality

### Run Linter

```bash
flutter analyze
```

### Format Code

```bash
flutter format lib test
```

## Best Practices Implemented

### 1. **Project Configuration**
   - Comprehensive `analysis_options.yaml` with strict linting rules
   - Proper dependency management in `pubspec.yaml`
   - Web-optimized `.gitignore`

### 2. **Code Quality**
   - Strict type checking and inference
   - Comprehensive linting rules for error prevention
   - Consistent code style enforcement
   - Const constructors where applicable

### 3. **Web Optimization**
   - Progressive Web App (PWA) ready with manifest
   - Custom loading animation
   - Proper meta tags for SEO and mobile
   - Responsive design principles
   - Dark mode support with system preference detection

### 4. **Accessibility**
   - Semantic HTML structure
   - Proper contrast ratios
   - Icon labels and descriptions
   - Keyboard navigation support

### 5. **UI/UX**
   - Material Design 3 implementation
   - Consistent spacing and layout
   - Smooth animations and transitions
   - User feedback for interactions

### 6. **Testing**
   - Widget tests for UI components
   - Smoke tests for critical paths
   - Theme configuration tests

## Deployment

### Deploy to Firebase Hosting

```bash
# Install Firebase CLI
npm install -g firebase-tools

# Login to Firebase
firebase login

# Initialize Firebase in your project
firebase init hosting

# Build and deploy
flutter build web --release
firebase deploy
```

### Deploy to GitHub Pages

```bash
flutter build web --release --base-href "/<repository-name>/"
# Copy build/web contents to your gh-pages branch
```

### Deploy to Netlify/Vercel

Simply drag and drop the `build/web` folder to their web interface, or connect your Git repository for automatic deployments.

## Configuration

### Change App Name

Edit `web/manifest.json` and `web/index.html` to update the app name and description.

### Change Theme Color

Edit `lib/main.dart`:

```dart
colorScheme: ColorScheme.fromSeed(
  seedColor: Colors.blue, // Change this color
  brightness: Brightness.light,
),
```

### Add New Dependencies

```bash
flutter pub add package_name
```

## Troubleshooting

### "Waiting for connection from debug service on Chrome"

Try these steps:
1. Close all Chrome instances
2. Run `flutter run -d chrome --web-hostname localhost --web-port 8080`

### Build errors

```bash
flutter clean
flutter pub get
flutter build web
```

## Contributing

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add some amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## License

This project is open source and available under the [MIT License](LICENSE).

## Resources

- [Flutter Web Documentation](https://flutter.dev/web)
- [Material Design 3](https://m3.material.io/)
- [Flutter Best Practices](https://flutter.dev/docs/development/best-practices)
- [Dart Style Guide](https://dart.dev/guides/language/effective-dart/style)
