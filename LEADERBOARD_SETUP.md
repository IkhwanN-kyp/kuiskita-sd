# Papan peringkat KuisKita

## Setup leaderboard bersama (Supabase)
1. Buat project Supabase.
2. Jalankan isi `supabase/leaderboard.sql` di SQL Editor.
3. Di Vercel → Project → Settings → Environment Variables, isi:
   - `VITE_SUPABASE_URL` = Project URL
   - `VITE_SUPABASE_ANON_KEY` = publishable/anon key (JANGAN service_role)
4. Redeploy project.

Tanpa konfigurasi Supabase, profil dan nilai disimpan di localStorage browser masing-masing, sehingga **tidak dapat dilihat oleh pengguna lain**.

## Privasi dan integritas
- Profil menggunakan nama panggilan, kelas, avatar, dan sekolah opsional.
- Nama sekolah hanya tersimpan di browser; **tidak dikirim ke leaderboard**.
- Jangan minta nama lengkap, foto wajah, nomor telepon, atau alamat siswa.
- Leaderboard publik hanya contoh kompetisi santai. API anonymous insert bisa dimanipulasi, jadi **belum anti-cheat**. Untuk kompetisi resmi gunakan login, verifikasi skor server, moderasi nama, dan pembatasan request.
- Penghapusan data publik dan kebijakan privasi perlu disiapkan sebelum digunakan secara luas.
