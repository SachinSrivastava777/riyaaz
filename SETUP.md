# Riyaaz 2.0

Responsive browser-native vocal practice app. Recording and pitch analysis happen in the web app. No external voice recorder or audio file upload is needed for vocal takes.

## Features
- Live microphone capture via `getUserMedia()` and waveform display.
- In-app `MediaRecorder` recording with timer and stop control.
- Autocorrelation pitch estimate, swar mapping and cents deviation.
- Post-take pitch contour, in-tune time, average deviation and stability estimate.
- Free practice, Sargam, Sustained Sa, Interval jumps and Yaman phrase modes.
- Local session history plus optional Supabase cross-device sync.
- Audio is not uploaded; only metrics and a compact pitch trace are stored.

## Local run
Run `python -m http.server 3000` in this folder, then open `http://localhost:3000`. Microphone access requires HTTPS or localhost.

## Supabase
1. Supabase SQL Editor -> New query -> paste `supabase-schema.sql` -> Run.
2. Project Settings -> API Keys: copy Project URL and Publishable key (`sb_publishable_...`).
3. In `index.html`, replace `YOUR_SUPABASE_PROJECT_URL` and `YOUR_SUPABASE_ANON_KEY`. Do not put a secret/service-role key in browser code.
4. Authentication -> URL Configuration: set Site URL to your Vercel URL and add both `https://YOUR-DOMAIN/**` and `http://localhost:3000/**` to Redirect URLs.
5. Same email on laptop and phone means the same cloud history.

## Vercel
Upload all files in this folder to the GitHub repository root, import it in Vercel, choose Other, leave build command blank, and deploy as a static site.

## Scope and limitations
This is a focused recorder-first rebuild. The earlier Song Studio and Voice Mixer modules are not included in this version; they can be added as separate modules after validating the core recorder. Pitch estimates can be affected by room noise, harmonics, accompaniment and device microphone processing. This is a practice aid, not studio-grade analysis. The JSON-row sync is suitable for a personal MVP; a larger product should move to normalized session rows and conflict-aware sync.
