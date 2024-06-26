--veri taban� olu�turma
create database okul
--veri taban� silme
drop database okul
 
--VER� T�RLER�NE BAKILIP �NCELEND�

--identity: otomatik artan deger
--not null: bos gecielemez

--sorgular new query ile olu�turulur execute ile �al��t�r�l�r


--tablo olu�turma, ogrenci_�d primary key yap�ld�

create table ogrenci(
ogrenci_id int primary key identity,
ad_soyad varchar(50) not null,
tcno char(11) not null,
cinsiyet char(1),
sinif varchar(2),
telefon char(10) not null,
mail varchar(100)
)

--mevcut tabloya sutun ekleme
alter table ogrenci add boy varchar(2)

--mecvut tablo sutununun �zelliklerini de�i�tirme
alter table ogrenci alter column boy tinyint;

--mevcut sutunu silme
alter table ogrenci drop column boy;

--KISITLAYICILAR

--unique key ekleme
create table ogrenci(
ogrenci_id int primary key identity,
tc_no char(11) unique,
mail varchar(90)
)

--benzersiz(unique) de�i�ken olu�turma
alter table ogrenci add unique(mail);
--benzersiz de�i�keni listele
select *from sys.objects where type='UQ';


--DEFAULT: tabloda bir alana de�er eklenmedi�inde otomatik ekleme yapar.
--kay�t zaman� de�erini default yapmak istedim
create table kayit(
kayit_id int primary key identity,
kayit_zamani datetime default getdate(),
durum char(1)
)

--sonradan bir de�eri default yapmak istedi�imde
alter table kayit add default '1' for durum

--default olan de�erleri d�nd�r�r
select *from sys.objects where type='d'

-- k�s�tlay�c�l��� kald�r�r
alter table kayit drop constraint DF__kayit__durum__47DBAE45


--CHECK KONTROL
--girilen de�erde kesinlikle olmas� gereken ifade var m� yok mu
create table kullanici(
kullanici_id int primary key identity,
cinsiyet char(1) check(cinsiyet='K' or cinsiyet='E')
)

--e�er sonradan eklemek istersek
alter table kullanici add check (cinsiyet ='K' or cinsiyet = 'E')

--tablodaki check ifadeleri d�nd�r�r
select * from sys.objects where type='C';

--check k�s�tlay�c�s�n� kald�r�r
alter table calisan drop constraint CK__kullanici__cinsi__4AB81AF0

--ogrenci tablosu olu�turuldu ders_id de�i�keni foreign key yani ders tablosunun primary keyi oldu

create table ogrenci(
ogrenci_id int primary key identity,
ders_id int foreign key references ders(ders_id)
)

--ogrenci tablosu olu�turuldu ders_id de�i�keni foreign key yani ders tablosunun primary keyi oldu
create table ogrenci(
ogrenci_id int primary key identity,
ders_id int foreign key references ders(ders_id)
)

--foreign keyler listelendi
select * from sys.objects where type='F'

--mevcut bir tabloya sonradan ekleme
alter table ogrenci add foreign key (ders_id) references ders(ders_id) 