# iramakain

## Anggota
  - Carissa Almira Yudiva (2106751676)
  - Steven Yosua Saputra (2106750780)
  - Muhammad Nafriel Ramadhan (2106635663)
  - Inaya Rahmanisa (2106708330)
  - Hikam Fajduani (2106634250)

## Deskripsi Aplikasi 
### Nama
Irama Kain

### Fungsi
Irama Kain menerapkan tema isu G20 sustainability. Irama Kain mengimplementasikan isu tersebut dengan menjalankan peran sebagai platform clothing donation dan rework. Irama Kain mendaur ulang fashion waste menjadi pakaian baru yang layak pakai dan akan dijual kembali, yang nantinya, hasil dari penjualan tersebut akan kami donasikan juga kepada masyarakat. 

### Peran/Aktor Pengguna
#### Logged In User
Logged in user memiliki akses untuk melakukan donasi baju dan membeli baju reworked dari katalog Marketplace. Halaman yang bisa diakses diantaranya:
- Authentication (Login, Logout)
- Homepage 
- FAQ (Menambahkan Pertanyaan)
- Donation Form and Details (Melakukan donasi  mendapatkan poin)
- Marketplace (Melakukan pembelian)
- Contact (Partnership/Customer Service)

#### Admin
- Authentication (Login, Logout)
- Homepage 
- FAQ (Menjawab Pertanyaan)
- Marketplace
- Contact (Partnership/Customer Service) -> mengubah status
  
## Daftar Modul
1. Homepage (Carissa, Hikam)
2. Authentication Login (Sign In, Login, Logout): (Steven)
    - Login:
      - Email
      - Password
    - Sign Up:
      - Nama
      - Jenis Kelamin
      - Email
      - Password
      - Kontak Yang Dapat Dihubungi
      - Alamat
3. Profile Page: (Inaya, Steven)
   - Lihat Profil
   - Edit Profil
4. FAQ: (Carissa)
   - Form Pernyataan
   - Daftar FAQ
5. Buat Donasi: (Inaya)
   - Form Data Donasi
   - History/Status Donasi
6. Marketplace: (Nafriel)
   - Catalog
   - Cart
7. Partnership/Customer Service Contact: (Hikam)
   - Form Partnership 
   - Tampilan Status
   
## Alur Pengintegrasian dengan Web Service 
  Kami mengintegrasikan aplikasi Irama Kain dengan aplikasi web yang telah dibuat pada proyek tengah semester melalui request GET dan POST ke URL Heroku. Data yang didapatkan melalui request tersebut akan berbentuk string json yang telah di-decode menjadi dynamic object. Dynamic object yang telah didapatkan kami ubah ke dalam model-model yang telah dibuat. Selanjutnya, kami menggunakan widget FutureBuilder yang atribut future-nya merupakan objek-objek dari model yang telah dihasilkan. Atribut snapshot yang terbentuk melalui widget FutureBuilder akan kami gunakan untuk melanjutkan proses pembentukan aplikasi.
   
