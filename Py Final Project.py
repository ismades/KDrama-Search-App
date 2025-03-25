import mysql.connector
import tkinter as tk
def hub():
    global conn
    conn = mysql.connector.connect(
        host = "localhost",
        user = "root", 
        password= "",
        database = "drama_korea")
    if conn.is_connected():
        print("Data Terkoneksi!")
    else:
        print("Data Tidak Terkoneksi")
hub()       
def reg():
    username = reg_us.get()
    password = reg_pas.get()

    if username == "" or password == "":
        label_hasil.config(text="Error! Username dan Password Harus diisi!")
        print("Error")
        return

    cursor = conn.cursor()
    query = "SELECT id_user FROM users ORDER BY id_user DESC LIMIT 1"
    cursor.execute(query)
    last_id = cursor.fetchone()

    if last_id:
        last_number = int(last_id[0][1:])  
        new_number = str(last_number + 1).zfill(2) 
        new_id = "A" + new_number  
    else:
        new_id = "A01"  

    
    query = "INSERT INTO users (id_user, username, password) VALUES ('" + new_id + "', '" + username + "', '" + password + "')"
    cursor.execute(query)
    conn.commit()

    label_hasil.config(text=f"Registrasi Berhasil! ID Anda: {new_id}")

    tampilkan_menu_utama()


   
def log():
    global id_user
    username = entry_us.get()
    password = entry_pas.get()
    
    if username == "" or password == "":
        label_hasil.config(text="Error!Username dan Password Harus diisi!")
        return

    cursor = conn.cursor()
    query = "SELECT * FROM users WHERE Username = %s AND Password = %s"
    cursor.execute(query, (username, password))
    
    hasil =  cursor.fetchone()
    
    if hasil:
        id_user = hasil[0]
        label_hasil.config(text = f"Login Berhasil ,Selamat Datang 😊 {username}")
        tampilkan_menu() 
    else:
        label_hasil.config(text="Username atau Paword Tidak Sesuasi.")
       
        
def tampilkan_menu_utama():    
     sembunyikan_semua() 
     halaman_depan.pack(pady=12)   
     label_menu3.pack(pady=10)             
     tombol_login.pack(pady=5)
     tombol_regis.pack(pady=5)
     label_hasil.pack(pady=5)
     
def tampilkan_menu():
    sembunyikan_semua()
    
    label_menu.pack(pady=10)
    tombol_tahun.pack(pady=5)
    entry_tahun.pack(pady=5)
    entry_rating.pack(pady=5)
    tombol_rating.pack(pady=5)
    tombol_riwayat.pack(pady=5)
    tombol_hapus.pack(pady=5)
    tombol_keluar.pack(pady=5)
    label_hasil.pack(pady=10)
    
    

def sembunyikan_semua():
     
    label_menu1.pack_forget()
    label_menu2.pack_forget()
    label_menu3.pack_forget()
    tombol_regis.pack_forget()
    tombol_login.pack_forget()
    halaman_depan.pack_forget()    
    label_menu1.pack_forget()
    entry_us.pack_forget()
    entry_pas.pack_forget()
    tombol_log.pack_forget()
    label_menu2.pack_forget()
    reg_us.pack_forget()
    reg_pas.pack_forget()
    tombol_reg.pack_forget()
    tombol_kembali.pack_forget()
    
    label_menu.pack_forget()
    entry_tahun.pack_forget()
    tombol_tahun.pack_forget()
    entry_rating.pack_forget()
    tombol_rating.pack_forget()
    tombol_riwayat.pack_forget()
    tombol_hapus.pack_forget()
    label_hasil.pack_forget()
    tombol_keluar.pack_forget()


def tampil_log():
    sembunyikan_semua()
    label_menu1.pack(pady=10)
    entry_us.pack(pady =5)
    entry_pas.pack(pady =5)
    tombol_log.pack(pady =5)
    label_hasil.pack(pady=5)
  

    
def tampil_reg():  
    sembunyikan_semua()
    label_menu2.pack(pady=10)
    reg_us.pack(pady =5)
    reg_pas.pack(pady =5)
    tombol_reg.pack(pady =5) 
    tombol_kembali.pack(pady =5) 
    label_hasil.pack(pady=10)

def tahun():
    tahun = entry_tahun.get()
    if not tahun:
        label_hasil.config(text="Error: Tahun harus berupa angka!")
        return
    query = "SELECT * FROM drakor WHERE tahun = " + str(tahun)
    cursor = conn.cursor()
    cursor.execute(query)
    hasil = cursor.fetchall()

    if hasil:
        tabel = ""  
        for row in hasil:
            tabel += f"ID: {row[0]} | Nama: {row[1]} | Rating: {row[2]} | Genre: {row[3]} | Tahun: {row[4]}\n"

        label_hasil.config(text=tabel)

        simpan_riwayat("Tahun", hasil)
    else:
        label_hasil.config(text="Tidak ada drama ditemukan.")
       
def rating():
    rating = entry_rating.get()

    if not rating:
        label_hasil.config(text="Error: Rating harus berupa angka desimal!")
        return

    query = "SELECT * FROM drakor WHERE rating = " + str(rating)
    cursor = conn.cursor()
    cursor.execute(query)
    hasil = cursor.fetchall()

    if hasil:
        tabel = ""  
        for row in hasil:
            tabel += f"ID: {row[0]} | Nama: {row[1]} | Rating: {row[2]} | Genre: {row[3]} | Tahun: {row[4]}\n"

        label_hasil.config(text=tabel)

        
        simpan_riwayat("Rating", hasil)
    else:
        label_hasil.config(text="Tidak ada drama ditemukan.")

            
def lihat_riwayat():
    cursor = conn.cursor()
    query = (
        "SELECT urutan, query, id_user, id_drama, nama_drama, rating, tahun, waktu "
        "FROM riwayat_pencarian "
        f"WHERE id_user = '{id_user}' "
        "ORDER BY waktu DESC"
    )
    cursor.execute(query)
    hasil = cursor.fetchall()

    if hasil:
        tabel = "" 
        for row in hasil:
            tabel += f"{row[0]}. {row[1]} | ID User: {row[2]} | ID Drama: {row[3]} |Nama Drama : {row[4]} | Rating: {row[5]} | Tahun: {row[6]} | Waktu: {row[7]}\n"

        label_hasil.config(text=tabel)
    else:
        label_hasil.config(text="Tidak ada riwayat ditemukan.")
  
def hapus_riwayat():  
    cursor = conn.cursor()
    query = "DELETE FROM riwayat_pencarian "
    cursor.execute(query)
    conn.commit()
    label_hasil.config(text="Riwayat berhasil dihapus.")

def simpan_riwayat(query_type, hasil):
    global id_user
    cursor = conn.cursor()
    for row in hasil:
        id_drama = str(row[0])
        nama_drama = row[1]
        rating = str(row[2])
        tahun = str (row[4])

        # Query menggunakan concatenation
        query = "INSERT INTO riwayat_pencarian (query, id_user, id_drama, nama_drama, rating, tahun, waktu) VALUES (" \
                + "'" + query_type + "', " \
                + "'" + id_user + "', " \
                + "'" + id_drama + "', " \
                + "'" + nama_drama + "', " \
                + "'" + rating + "', " \
                + "'" + tahun + "', NOW())"

        cursor.execute(query)  
        conn.commit()  

def keluar():
    root.destroy()
    print("Koneksi terputus")

 
root = tk.Tk()
root.title("Aplikasi Pencarian Drama Korea")
root.geometry("800x500")

label_menu3 = tk.Label(root, text = "Silahkan Registrasi/Login Terlebih Dahulu", font = ("Arial", 12))
tombol_regis = tk.Button(root, text= "Registrasi", command = tampil_reg)
tombol_login = tk.Button(root, text = "Login", command =tampil_log )

label_menu1 = tk.Label(root, text = "Login", font = ("Arial", 12))
entry_us = tk.Entry(root, width=20)
entry_pas = tk.Entry(root, width=20, show = "*")
tombol_log = tk.Button(root, text= "Login" , command = log)

label_menu2 = tk.Label(root, text = "Registrasi", font = ("Arial", 12))
reg_us = tk.Entry(root,width = 20)
reg_pas = tk.Entry(root, width = 20, show = "*")
tombol_reg = tk.Button(root, text = "Register", command = reg)
tombol_kembali= tk.Button(root, text = "Halaman Depan", command =tampilkan_menu_utama )

label_menu = tk.Label(root, text = "Menu Utama", font = ("Arial", 12))
halaman_depan = tk.Label(root, text = "Mesin Pencari Drama Korea", font = ("Arial", 18))
entry_tahun = tk.Entry(root, width=20)
tombol_tahun = tk.Button(root, text ="Pencarian Dengan Tahun", command=tahun)
entry_rating = tk.Entry(root, width=20)
tombol_rating= tk.Button(root, text="Pencarian Dengan Rating", command=rating)
tombol_riwayat = tk.Button(root, text="Lihat Riwayat", command = lihat_riwayat)
tombol_hapus = tk.Button(root, text = "Hapus Riwayat", command = hapus_riwayat)
label_hasil = tk.Label(root, text = "", justify = "left", font = ("Arial", 12), wraplength = 800)
tombol_keluar = tk.Button(root, text = "Log Out", command = keluar)

halaman_depan.pack(pady=12) 
label_menu3.pack(pady=10)
tombol_login.pack(pady=5)
tombol_regis.pack(pady=5)

root.mainloop()

