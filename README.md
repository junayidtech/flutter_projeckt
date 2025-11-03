# Earning App Monorepo

- `mobile/` — Flutter 3.x mobile app (Android/iOS/Web)
- `admin/` — Flutter Web Admin Panel
- `functions/` — Firebase Cloud Functions (TypeScript)

## Quick Start

```bash
# Mobile
cd mobile
flutter pub get
flutterfire configure
flutter run

# Admin (separate Flutter project)
cd ../admin
flutter pub get
flutterfire configure
flutter run -d chrome

# Backend
cd ../functions
npm i
npm run build
firebase deploy --only functions

# Deploy Admin to Hosting (example)
firebase deploy --only hosting:admin
```

See `firestore.rules` and `storage.rules` for security; CI in `.github/workflows/ci.yml`.
