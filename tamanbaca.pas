PROGRAM TamanBaca;
Uses crt;
const nMax = 1000;

type Taman = record
	idMem,idBuk,jdBuk,nmMem,alMem : string;
	pnMem,umMem, Stbuk: integer;
end;

type arrData = array[1..nMax] of Taman;

PROCEDURE MenuAwal(n : integer; data : arrData);forward;


PROCEDURE inputDataMember(var n : integer;var datTam : arrData);
{IS.-
FS. Memasukkan isi data Member }
var
	i : integer;
begin
	i := 1;
	datTam[i].pnMem:=0;
	write('masukkan banyak data  :'); readln(n);
	for i:= 1 to n do
	begin
		write('Id Member :  '); readln(datTam[i].idMem);
		write('Nama Member :'); readln(datTam[i].nmMem);
		write('Umur Member :'); readln(datTam[i].umMem);
		write('Alamat Member: '); readln(datTam[i].alMem);
		writeln('Poin: 0 '); datTam[i].pnMem := 0;
				writeln(i);
		readln();
	end;
	MenuAwal(n, datTam);
end;

Procedure inputDataBuku(var n: integer; var datTam: arrData);
{IS. - 
FS. Memasukkan isi data Buku}
var
	i: Integer;
begin
	i:=1;
	write('masukkan banyak data  :'); readln(n);
	write(n);
	for i:= 1 to n do
	begin
	write('Id Buku :  '); readln(datTam[i].idBuk);
	write('Judul Buku :  '); readln(datTam[i].jdBuk);
	write('Stok Buku :  '); readln(datTam[i].Stbuk);
	readln();
	end;
	MenuAwal(n,datTam);
end;

//PROCEDURE BUBBLE SORT\\
procedure bubbleSort( var datTam : arrData ; jumData : integer); 
{IS. Terdefinisi sejumlah data kecamatan
FS. Mengurutkan data dari yang terkecil ke terbesar menggunakan bubble sort}
var 
 i,pass : integer; 
 tmp : Taman; 
begin 
 pass := 1; 
 while pass <= jumData-1 do 
 begin  
  i:= 1; 
  while i <= jumData-1 do 
  begin 
   if datTam[i].pnMem > datTam[i+1].pnMem then 
   begin 
    tmp := datTam[i]; 
    datTam[i] := datTam[i+1]; 
    datTam[i+1] := tmp; 
   end; 
   {end if} 
   i := i +1; 
  end; //end while 
  pass := pass + 1; 
 end; 
end; 



PROCEDURE LihatDataMember(var datTam : arrData ; var jumData : integer);
{IS. Terdefinisi data Member
FS. Memberikan output data yang telah dimasukkan}
var 
j,menu,position:integer;
begin
for j := 1 to jumData do
	begin
		writeln('Id Member :  ', datTam[j].idMem);
		writeln('Nama Member :', datTam[j].nmMem);
		writeln('Umur Member: ', datTam[j].UMMem);
		writeln('Alamat Member: ', datTam[j].alMem);
		writeln('Poin: ', datTam[j].pnMem);
	end;

	readln();
	writeln('1. Urutkan berdasarkan poin:');
	writeln('2. untuk Kembali ke menu awal:  ');
	readln(menu);
	if (menu=1) then
	begin
		bubbleSort(datTam,jumData);
		LihatDataMember(datTam,jumData)		
	end
	else if (menu=2) then
		MenuAwal(jumData,datTam);
		READLN();
end;



PROCEDURE LihatDataBuku(var datTam : arrData ; var jumData : integer);
{IS. Terdefinisi data Member
FS. Memberikan output data yang telah dimasukkan}
var 
i,menu,position:integer;
begin
for i:= 1 to jumData do
	begin
	writeln('Id Buku :  ', datTam[i].idBuk);
	writeln('Judul Buku :  ', datTam[i].jdBuk);
	writeln('Stok Buku :  ', datTam[i].Stbuk);
	end;
	readln();
write('tekan 1 untuk Kembali ke menu awal: ');readln(menu);
if (menu=1) then
		MenuAwal(jumData,datTam);
READLN();
end;


PROCEDURE cariDataMember(datTam : arrData; jumData :integer);
{IS. Terdefinisi sejumlah data Member
FS.Mencari data sesuai kategori yang diinginkan}
var
	 menu : integer;
	 idbuku, idmember : string;
	 resCariMem , resCariBuk : arrData;
	 i,jum,stok: integer;
	 cek : Boolean;
begin
		writeln('1. Berdasarkan ID Member');
		writeln('2. Berdasarkan ID Buku ');
		writeln('3. Kembali');
		repeat 
			write('Pilih Menu : ');	readln(menu);
		until (menu>=1) and (menu<=3);
		if(menu = 1)  then
		begin
			write('Masukan ID Member : '); readln(idmember);
			i := 1;
			while i <= jumData do
			begin
				if(idmember = datTam[i].idMem) then
				begin
				jum := 1;
					writeln('Id Member :  ', datTam[i].idMem);
					writeln('Nama Member :', datTam[i].nmMem);
					writeln('Umur Member: ', datTam[i].UMMem);
					writeln('Alamat Member: ', datTam[i].alMem);
					writeln('Poin: ', datTam[i].pnMem);
				end;
				i:= i+1;
			end;
			readln();
			MenuAwal(jumData,datTam);
		end
		else if (menu=2) then
		begin
			clrscr;
			write('Masukkan ID Buku : '); readln(idbuku);
			for i := 1 to jumData do
			begin
				if(idBuku = datTam[i].idBuk) then
				begin
					cek := true;
					stok := datTam[i].Stbuk;
				end;
			end;
			if((cek = true) and (stok >= 2)) then
			begin
				writeln('Ok');
				writeln('Stok : ',stok);
				readln();
				MenuAwal(jumData,datTam);
			end
			else 
			begin
				writeln('Tidak dapat dipinjam');
				writeln('Stok : ',stok);
				readln();
				MenuAwal(jumData,datTam);
			end;
		end
		else if (menu=3)then
			begin
			MenuAwal(jumData,datTam);
		end;
end;

Procedure Peminjaman(datTam : arrData; jumData :integer);
{IS. Terdefinisi sejumlah data Member
FS.Mencari data sesuai kategori yang diinginkan}
var
	 idbuku, idmember, Ok, TglPinjam, TglBlk, TglBalik, t: string;
	 resCariMem , resCariBuk : arrData;
	 i,jum,stok, sisa, tgl, pinjem, p,j, indeks, indeksMem: integer;
	 cek,cekMember : Boolean;

begin
			clrscr;
			write('Masukkan ID Buku yang ingin dipinjam : '); readln(idbuku);
			write('Masukkan ID Member yang meminjam: '); readln(idmember);
			for i := 1 to jumData do
			begin
				if(idBuku = datTam[i].idBuk) then
				begin
					cek := true;
					stok := datTam[i].Stbuk;
					p := datTam[i].pnMem;
					indeks := i;
				end;
			end;
			for j := 1 to jumData do
			begin
				if(idmember = datTam[j].idMem) then
				begin
					cekMember := true;
					idmember := datTam[j].idMem;
					p := datTam[j].pnMem;
					indeksMem := j;
				end;
			end;
			if((cek = true) and (stok >= 2)) then
			begin
				writeln('Ok'); 
				datTam[indeks].Stbuk := datTam[indeks].Stbuk - 1;
				datTam[indeksMem].pnMem := datTam[indeksMem].pnMem + 5;
				writeln('Poin : ',datTam[indeksMem].pnMem);
				writeln('Stok : ',datTam[indeks].Stbuk);

				repeat
					write('Tanggal Peminjaman : '); readln(pinjem);
				until (pinjem>=1) and (pinjem<=30);
				
				if(pinjem >= 25) then
				begin
					jum := pinjem + 7;
					sisa := jum mod 30;
					write('Tanggal Kembali : ',sisa);
				end
				else 
				begin
					jum := pinjem + 7;
					write('Tanggal Kembali : ',jum);
				end;
				Ok:= 'Ok';
				readln();
			end
			else if(stok < 2) then
			begin
				writeln('Tidak dapat dipinjam');
				readln();
	
			end;
			readln;
			MenuAwal(jumData,datTam);
end;


// PROCEDURE MENU AWAL \\
PROCEDURE MenuAwal(n : integer; data : arrData);
{IS.
FS. Memberikan output berupa tampilan awal dari program}
var
		menu : integer;
begin
	menu:=0;
	begin
		clrscr;
		writeln('-----------------------------------');
		writeln('-----------------------------------');
		writeln('          SELAMAT DATANG           ');
		writeln('     APLIKASI ANGGOTA TAMAN BACA   ');
		writeln('-----------------------------------');
		writeln('-----------------------------------');
		writeln;
		writeln('Menu Utama');
		writeln('1. Tambah Data Anggota ');
		writeln('2. Lihat Data Anggota');
		writeln('3. Urutkan Data Anggota');
		writeln('4. Input Data Buku');
		writeln('5. Lihat Data Buku');
		writeln('6. Peminjaman Buku');
		writeln('7. Cari Data');
		writeln('8. EXIT');
		repeat
		write('pilih menu : '); readln(menu);
		until (menu>=1) and (menu<=8);
		if (menu = 1) then
		begin
			clrscr;
			inputDataMember(n,data);
		end
		else if (menu=2) then
		begin
			clrscr;
			LihatDataMember(data, n);
		end
		{else if (menu=3) then
		begin
			clrscr;
			cariData(data, n)
		end;
		If  (menu=4) then
			begin
			clrscr;
			writeln('Press any key.....');
			end;}
		else if (menu = 4) then
		begin
			clrscr;
			inputDataBuku(n,data);
		end
		else if (menu=5) then
		begin
			clrscr;
			LihatDataBuku(data, n);
		end
		else if (menu=6) then
		begin
			clrscr;
			Peminjaman(data, n);
		end
		else if (menu=7) then
		begin
			clrscr;
			cariDataMember(data, n);
		end
		else If  (menu=8) then
			begin
			clrscr;
			writeln('Press any key.....');
			end; 
	end;	
end;

// MAIN PROGRAM \\
var
	n : integer;
	data : arrData;
begin
	clrscr;
	n := 0;
	MenuAwal(n,data);
	readln;
end.