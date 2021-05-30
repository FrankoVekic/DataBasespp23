# odaberite sve autore kojima ne znamo datum rođenja

select * from autor where datumrodenja is null;

# autoru Rober Preišić postavite datum 
# rođenja na 7. veljače 1983

update autor set datumrodenja ='1983-02-07' where sifra=3;

# obaberite sve autore koji se zovu kao Vi

select * from autor where ime ='Franko';

# odaberite sve izdavače koji su 
# društva s ograničenom odgovornošću

select * from izdavac where naziv like '%d.o.o%' or naziv like '%d.oo' or naziv like '%do.o';

#Decko je prekinio sa curom te došao u knjižnicu za preporuku neke knjige.
#Koju knjigu bi ste mu preporučili?

select * from katalog where naslov like '%ljubav%' and sifra not in (2541,2680,2784,2938);

