# Tentukan image dasar (base image)
# Kita mulai dari image wordpress:latest yang sudah berisi PHP dan server web
FROM wordpress:latest

# Instal alat-alat yang diperlukan
# `subversion` diperlukan untuk mengunduh plugin dari SVN
# `unzip` diperlukan untuk mengunduh dan mengekstrak file zip
# `git` juga berguna untuk repository Git
# `composer` diunduh langsung dari situs resminya
RUN apt-get update && \
    apt-get install -y subversion unzip git && \
    rm -rf /var/lib/apt/lists/*

# Unduh dan instal Composer secara global
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Tentukan direktori kerja di dalam kontainer.
# Ini adalah tempat di mana perintah seperti 'composer install' akan dijalankan.
WORKDIR /var/www/html

# Salin file composer.json dan composer.lock dari host ke kontainer
# Ini dilakukan agar Docker dapat memanfaatkan cache layer.
COPY composer.json composer.lock ./

# Jalankan Composer untuk menginstal semua dependensi
# `--no-dev`: Lewati paket yang hanya diperlukan untuk pengembangan
# `--prefer-dist`: Mengunduh file zip (dist), lebih cepat dari source
# `--ignore-platform-reqs`: Mengabaikan persyaratan versi PHP, dll., dari paket
RUN composer install --no-dev --prefer-dist --ignore-platform-reqs

# Salin seluruh file proyek Anda (kecuali yang ada di .dockerignore)
# ke dalam direktori kerja kontainer.
COPY . .
