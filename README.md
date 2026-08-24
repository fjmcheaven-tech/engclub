# EngClub V2 — Real Portal Foundation

This is a Next.js + Supabase application foundation.

## What is real in this version
- Next.js application structure
- Supabase authentication integration
- Role-based profiles: admin, teacher, student
- Cloud database schema
- Booking records
- Admin class assignment form
- Role-aware dashboard

## Setup
1. Create a Supabase project.
2. Run `supabase/schema.sql` in Supabase SQL Editor.
3. Copy `.env.local.example` to `.env.local`.
4. Add your Supabase URL and anonymous key.
5. Install Node.js, then run:
   `npm install`
   `npm run dev`
6. Create users in Supabase Auth, then create matching rows in `profiles`.

## Production next steps
- Proper Row Level Security for teacher/student privacy
- Signup and onboarding
- Self-booking with availability
- Timezone handling
- Email notifications
- Video classroom integration
- Deploy to Vercel
