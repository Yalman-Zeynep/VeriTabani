create table ogrenci(
ogrenci_id int primary key identity,
ad_soyad varchar(50) not null,
tcno char(11) not null,
cinsiyet char(1),
sinif varchar(2),
telefon char(10) not null,
mail varchar(100)
)