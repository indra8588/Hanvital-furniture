# wordpres dengan depedecy composer
### Deskripsi Singkat
Proyek ini adalah aplikasi WordPress yang dikembangkan menggunakan Docker Compose dan Composer untuk manajemen plugin.

---
### Prasyarat
Pastikan Anda sudah menginstal alat-alat berikut di komputer Anda:
- Docker Desktop
- Git
- Visual Studio Code (atau editor teks lainnya)

---
### Panduan Penggunaan
#### Cara Memulai Proyek
1.  **Clone repositori:**
    ```bash
    git clone [https://github.com/nama-pengguna/nama-repositori.git](https://github.com/nama-pengguna/nama-repositori.git)
    cd nama-repositori
    ```

2.  **Jalankan Docker Compose:**
    Pastikan Docker Desktop sudah berjalan. Dari direktori utama proyek, jalankan perintah berikut:
    ```bash
    docker-compose up --build -d
    ```
    Perintah ini akan membangun _image_ dan menjalankan kontainer untuk WordPress, MySQL, dan phpMyAdmin.

3.  **Akses Aplikasi:**
    * Buka browser Anda dan kunjungi **`http://localhost:8000`** untuk memulai instalasi WordPress.
    * Untuk mengakses database, buka **`http://localhost:8080`** (phpMyAdmin).

---
### Konfigurasi
Anda dapat mengubah variabel lingkungan (seperti _port_ dan kata sandi) dengan mengedit file `.env`.
