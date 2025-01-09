# application

- Memuat Halaman Splash Screen [v]
- Memuat Halaman Login sederhana dengan validasi email dan password [v]

Validaasi Password = harus ada 1 special character (!@#$%^&..), 1 Huruf Capital, dan 1 angka
Validasi Email = harus ada tanda (@) di email.

- Memuat Halaman Home untuk menampilkan data dalam bentuk daftar (ListView) [v]
- Memuat Halaman Detail untuk setiap data yang dipilih [v]

Detail berisi Nama,Email, Website (URL) ,dan Nomor Handphone.

- Memuat data dari API menggunakan HTTP request. [v]
  
Data diambil dari https://jsonplaceholder.typicode.com/users 

- Menyediakan fitur pencarian untuk memfilter nama yang ditampilkan. [v]
- Menangani error jika gagal mengambil data dari API. [v] -> Exception Handling

Alur Aplikasi :

1. Setelah di run, akan ada splash screen menunjukkan nama aplikasi dan logonya selama 3 detik dan berpindah ke login page
2. Pada Login page, isi dengan email dan password sesuai validasi diatas.
3. Setelah masuk akan ada beberapa list nama yang diambil dari API, Jika gagal fetch datanya, akan ada message error.
4. Jika Berhasil maka akan ada beberapa list view yang berisi nama atau informasi orang.
5. Untuk melihat detail dari orang tersebut bisa langsung diklik atau dicari dengan search bar diatas.
6. Setelah diklik, maka akan muncul beberapa detail dari orang tersebut.

Note Penting : 
1. Untuk menjalankan Emulator tolong diubah versi gradle sesuai dengan device (Java -> build.gradle, Android Studio -> App/build.gradle).
2. Sementara untuk SDK Manager tolong diubah sesuai dengan SDK version dari Android Studio atau flutter.
