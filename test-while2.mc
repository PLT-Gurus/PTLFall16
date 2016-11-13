

int main()
{
  int a;
  a=1;
  print(a);


  
  print(foo(7));
  print(1234);

}

int foo(int a)
{
  int j;
  j = 0;
  while (a > 0) {
    j = j + 2;
    a = a - 1;
  }
  return j;
}