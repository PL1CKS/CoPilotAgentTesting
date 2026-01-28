# GitHub Actions Workflows

## Deploy Flutter Web App

### Overview
This workflow automatically builds and deploys the Flutter web application to GitHub Pages for testing purposes.

### Workflow File
- **File**: `deploy-web.yml`
- **Name**: Deploy Flutter Web App

### Triggers
The workflow runs automatically on:
- **Push to main branch**: Builds, tests, and deploys to GitHub Pages
- **Pull requests to main**: Builds and tests only (no deployment)
- **Manual trigger**: Can be triggered manually via GitHub Actions UI

### Workflow Steps

#### Build Job
1. **Checkout repository**: Clones the repository code
2. **Setup Flutter**: Installs Flutter SDK version 3.24.0 (stable channel)
3. **Verify Flutter**: Confirms Flutter installation
4. **Get dependencies**: Runs `flutter pub get`
5. **Run analyzer**: Checks code quality with `flutter analyze`
6. **Run tests**: Executes all tests with `flutter test`
7. **Build web app**: Creates optimized release build with correct base-href
8. **Upload artifact**: Saves build output for deployment

#### Deploy Job
- **Condition**: Only runs on push to main branch
- **Action**: Deploys the built web app to GitHub Pages
- **Output**: Provides deployment URL

### Configuration

#### Base Href
The workflow builds with `--base-href "/CoPilotAgentTesting/"` to match the GitHub repository name. If deploying to a custom domain, this can be changed to `/`.

#### Flutter Version
Currently set to Flutter 3.24.0 stable. Update in the workflow file if needed:
```yaml
flutter-version: '3.24.0'
channel: 'stable'
```

### Permissions
The workflow requires:
- `contents: read` - To read repository contents
- `pages: write` - To deploy to GitHub Pages
- `id-token: write` - For GitHub Pages authentication

### Setup Requirements

#### Enable GitHub Pages
1. Go to repository **Settings** → **Pages**
2. Under "Build and deployment":
   - Source: **GitHub Actions**
3. Save changes

The workflow will automatically deploy to GitHub Pages once enabled.

### Accessing the Deployed App
After a successful deployment to main branch, the app will be available at:
```
https://<username>.github.io/CoPilotAgentTesting/
```

Replace `<username>` with the GitHub username or organization name.

### Monitoring
- View workflow runs in the **Actions** tab
- Check build logs for any errors
- View deployment status in **Settings** → **Pages**

### Troubleshooting

#### Deployment Fails
- Ensure GitHub Pages is enabled in repository settings
- Verify the Source is set to "GitHub Actions"
- Check workflow permissions are correctly set

#### Tests Fail
- The workflow will not deploy if tests fail
- Check the test logs in the Actions tab
- Fix failing tests before deployment

#### Build Errors
- Review the "Build web app" step logs
- Ensure all dependencies are properly declared in `pubspec.yaml`
- Check Flutter analyzer warnings

### Customization

#### Change Deployment Branch
To deploy from a different branch, update:
```yaml
on:
  push:
    branches:
      - your-branch-name
```

#### Skip Tests
To skip tests during deployment (not recommended), remove:
```yaml
- name: Run tests
  run: flutter test
```

#### Custom Build Options
Modify the build command to add more options:
```yaml
run: flutter build web --release --base-href "/CoPilotAgentTesting/" --web-renderer canvaskit
```

### Best Practices
- ✅ Keep tests passing before merging to main
- ✅ Review build logs for warnings
- ✅ Test locally with `flutter build web` before pushing
- ✅ Use pull requests to validate changes before deployment
- ✅ Monitor deployment status after pushing to main
