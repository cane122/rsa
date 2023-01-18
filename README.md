# RSA Algoritam

RSA Algoritam na procesoru sa lprs1.

UART ne radi, treba se popraviti

U asembleru konacne vrednosti R1 i R2 su output gde je R1 sifrovana poruka a R2 desifrovana

Kod u c++: https://www.tutorialspoint.com/cplusplus-program-to-implement-the-rsa-algorithm

gcd algo:
int gcd(int a,int b) {
  int R;
  while ((a % b) > 0)  {
    R = a % b;
    a = b;
    b = R;
  }
  return b;
}
