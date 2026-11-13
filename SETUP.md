# Riyaaz — phone-ready practice app

A static HTML app with local-first practice history and optional cloud sync between devices.

## What is included
- Redesigned responsive interface for desktop and phone.
- Existing vocal practice modules, pitch analysis, Song Studio and Voice Mixer.
- Local progress saved automatically in the browser.
- Optional Supabase email-link sign-in to sync sessions, streak and Sa setting across devices.
- No audio recordings are uploaded. Only the app's practice-state JSON is synced.

## Deploy on Vercel

1. Create a GitHub repository, for example `riyaaz`.
2. Upload `index.html`, `supabase-schema.sql`, and `SETUP.md` to the repository root.
3. Open https://vercel.com, sign in with GitHub, choose **Add New → Project**, and import the repository.
4. Framework preset: **Other**. Build command: leave empty. Output directory: `.`. Install command: leave empty.
5. Deploy. Vercel will give you a public HTTPS URL that opens on your phone too.

## Enable cross-device cloud sync (recommended)

You need a free Supabase project. Without this step, practice is saved only in the current browser/device.

1. Create a project at https://supabase.com/dashboard.
2. In the Supabase project, open **SQL Editor → New query**.
3. Paste all contents of `supabase-schema.sql` and click **Run**.
4. Open **Project Settings → API** (or **Data API**) and copy:
   - Project URL
   - `anon` / publishable public key (never use the `service_role` secret key in a browser app).
5. Open `index.html` in a text editor. Near the bottom, find:
   `const SUPABASE_URL = "YOUR_SUPABASE_PROJECT_URL";`
   `const SUPABASE_ANON_KEY = "YOUR_SUPABASE_ANON_KEY";`
6. Replace those two placeholder values with your Supabase Project URL and anon/publishable key. Keep the quotes.
7. In Supabase **Authentication → URL Configuration**, set:
   - Site URL = your Vercel URL, e.g. `https://riyaaz.vercel.app`
   - Add the same Vercel URL to **Redirect URLs**.
8. Commit and push the updated `index.html` to GitHub. Vercel automatically redeploys.

## Use it on your phone

1. Open the Vercel URL in Chrome or Safari.
2. Tap **Connect account** and enter your email.
3. Open the email sign-in link on the phone.
4. On your laptop, open the same Vercel URL and sign in with the same email.
5. Your practice sessions, streak and Sa setting will be restored/synced between devices.

For an app-like shortcut:
- Android Chrome: menu (⋮) → **Add to Home screen**.
- iPhone Safari: Share → **Add to Home Screen**.

## Important notes

- If Supabase is not configured, the app still works and saves locally, but that local data does not move to another device.
- To transfer existing local progress into your cloud account, sign in on the device that currently has your progress first. If the cloud account has no saved row yet, the app uploads that device's current local progress.
- If a cloud account already has progress, signing in on a new device restores the cloud copy to that browser. It does not merge two different histories automatically.
- Audio clips are processed in the browser and are not uploaded.
- Use HTTPS (Vercel provides it). Browser audio APIs and sign-in redirects work best on the deployed HTTPS URL.
- Keep your Supabase `service_role` key private. Only the public anon/publishable key belongs in this frontend; row-level security protects each user's row.
