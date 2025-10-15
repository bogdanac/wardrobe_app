# Firebase Security Rules

## Overview
These security rules protect your wardrobe data in Firebase. Each user can only access their own data.

---

## Firestore Security Rules

**Where to add these:**
1. Go to Firebase Console → Firestore Database → Rules tab
2. Replace existing rules with the code below
3. Click "Publish"

```javascript
rules_version = '2';
service cloud.firestore {
  match /databases/{database}/documents {

    // Helper function to check if user is authenticated
    function isAuthenticated() {
      return request.auth != null;
    }

    // Helper function to check if user owns the resource
    function isOwner(userId) {
      return isAuthenticated() && request.auth.uid == userId;
    }

    // User-specific clothing items
    match /users/{userId}/clothing_items/{itemId} {
      allow read, write: if isOwner(userId);
    }

    // User-specific outfits
    match /users/{userId}/outfits/{outfitId} {
      allow read, write: if isOwner(userId);
    }

    // User profile data (optional, for future use)
    match /users/{userId} {
      allow read, write: if isOwner(userId);
    }

    // Public collections (if using shared data)
    // Currently not used, but here for future expansion
    match /public/{document=**} {
      allow read: if true;
      allow write: if isAuthenticated();
    }
  }
}
```

### What These Rules Do:
- ✅ Only authenticated users can access data
- ✅ Each user can only read/write their own data
- ✅ User data is isolated: `/users/{userId}/clothing_items/`
- ✅ No one else can see your wardrobe
- ✅ Production-ready security

---

## Firebase Storage Rules

**Where to add these:**
1. Go to Firebase Console → Storage → Rules tab
2. Replace existing rules with the code below
3. Click "Publish"

```javascript
rules_version = '2';
service firebase.storage {
  match /b/{bucket}/o {

    // Helper function to check if user is authenticated
    function isAuthenticated() {
      return request.auth != null;
    }

    // Helper function to check if user owns the resource
    function isOwner(userId) {
      return isAuthenticated() && request.auth.uid == userId;
    }

    // User-specific image storage
    match /users/{userId}/{allPaths=**} {
      allow read: if isOwner(userId);
      allow write: if isOwner(userId)
                   && request.resource.size < 10 * 1024 * 1024  // Max 10MB per file
                   && request.resource.contentType.matches('image/.*');  // Only images
    }

    // Clothing item images (user-specific)
    match /clothing_items/{itemId}/{allPaths=**} {
      allow read: if isAuthenticated();
      allow write: if isAuthenticated()
                   && request.resource.size < 10 * 1024 * 1024
                   && request.resource.contentType.matches('image/.*');
    }

    // Outfit images (user-specific)
    match /outfits/{outfitId}/{allPaths=**} {
      allow read: if isAuthenticated();
      allow write: if isAuthenticated()
                   && request.resource.size < 10 * 1024 * 1024
                   && request.resource.contentType.matches('image/.*');
    }
  }
}
```

### What These Rules Do:
- ✅ Only authenticated users can upload images
- ✅ Max file size: 10MB per image
- ✅ Only image files allowed (jpg, png, etc.)
- ✅ Users can only access their own images
- ✅ Prevents abuse and unauthorized uploads

---

## Testing Your Rules

After setting up the rules, test them:

1. **Test with no authentication** (should fail):
   - Try to access data without signing in
   - Should get "permission denied" error

2. **Test with authentication** (should work):
   - Sign in with Google
   - Create a clothing item
   - Upload an image
   - Verify data appears in Firestore

3. **Test cross-user access** (should fail):
   - Can't read another user's data
   - Each user's data is isolated

---

## Why Production Mode?

You asked about Test Mode vs Production Mode:

### ❌ Test Mode (Not Recommended)
```javascript
// Test mode allows ALL access for 30 days
allow read, write: if true;
```
- Anyone can read/write your data
- No security
- Temporary (expires after 30 days)
- Good only for initial testing

### ✅ Production Mode (Recommended)
- Proper authentication required
- User data is private
- No expiration
- Production-ready
- Secure from day one

**Recommendation:** Use Production Mode with these security rules from the start.

---

## Current Status

- ✅ Firestore: Using production mode (will add rules)
- ✅ Storage: Using production mode (will add rules)
- 🔜 Google Sign-In: Implementing now
- 🔜 Security Rules: Will add after authentication

---

## Need Help?

If you see permission errors after adding rules:
1. Make sure you're signed in with Google
2. Check that Firebase Auth is enabled
3. Verify rules are published (not just saved)
4. Clear app data and sign in again
