--veri tabaný oluþturma
create database okul
--veri tabaný silme
drop database okul
 
--VERÝ TÜRLERÝNE BAKILIP ÝNCELENDÝ

--identity: otomatik artan deger
--not null: bos gecielemez

--sorgular new query ile oluþturulur execute ile çalýþtýrýlýr


--tablo oluþturma, ogrenci_ýd primary key yapýldý

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

--mecvut tablo sutununun özelliklerini deðiþtirme
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

--benzersiz(unique) deðiþken oluþturma
alter table ogrenci add unique(mail);
--benzersiz deðiþkeni listele
select *from sys.objects where type='UQ';


--DEFAULT: tabloda bir alana deðer eklenmediðinde otomatik ekleme yapar.
--kayýt zamaný deðerini default yapmak istedim
create table kayit(
kayit_id int primary key identity,
kayit_zamani datetime default getdate(),
durum char(1)
)

--sonradan bir deðeri default yapmak istediðimde
alter table kayit add default '1' for durum

--default olan deðerleri döndürür
select *from sys.objects where type='d'

-- kýsýtlayýcýlýðý kaldýrýr
alter table kayit drop constraint DF__kayit__durum__47DBAE45


--CHECK KONTROL
--girilen deðerde kesinlikle olmasý gereken ifade var mý yok mu
create table kullanici(
kullanici_id int primary key identity,
cinsiyet char(1) check(cinsiyet='K' or cinsiyet='E')
)

--eðer sonradan eklemek istersek
alter table kullanici add check (cinsiyet ='K' or cinsiyet = 'E')

--tablodaki check ifadeleri döndürür
select * from sys.objects where type='C';

--check kýsýtlayýcýsýný kaldýrýr
alter table calisan drop constraint CK__kullanici__cinsi__4AB81AF0

--ogrenci tablosu oluþturuldu ders_id deðiþkeni foreign key yani ders tablosunun primary keyi oldu

create table ogrenci(
ogrenci_id int primary key identity,
ders_id int foreign key references ders(ders_id)
)

--ogrenci tablosu oluþturuldu ders_id deðiþkeni foreign key yani ders tablosunun primary keyi oldu
create table ogrenci(
ogrenci_id int primary key identity,
ders_id int foreign key references ders(ders_id)
)

--foreign keyler listelendi
select * from sys.objects where type='F'

--mevcut bir tabloya sonradan ekleme
alter table ogrenci add foreign key (ders_id) references ders(ders_id) 