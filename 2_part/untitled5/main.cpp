#include <bits/stdc++.h>
#include <cmath>

using namespace std;

void PrintFunctions(){
    cout << "1. addition" << endl;
    cout << "2. subtraction" << endl;
    cout <<  "3. multiplication by a scalar" << endl << endl;
}

void f1(int a1, int b1, int a2, int b2)
{
    cout << "Answer: " << a1+a2;
    if (b1+b2 >= 0) cout << "+" << b1+b2 << "i" << endl;
    else cout << b1+b2 << "i" << endl;
}

void f2(int a1, int b1, int a2, int b2)
{
    cout << a1-a2;
    if (b1-b2 >= 0) cout << "+" << b1-b2 << "i" << endl;
    else cout << b1-b2 << "i" << endl;
}

void f3(int a1, int b1, int l)
{
    cout << a1*l;
    if (b1*l >= 0) cout << "+" << b1*l << "i" << endl;
    else cout << b1*l << "i" << endl;
}


int main()
{
  PrintFunctions();
  cout << "Scalar number is represented as: a + b*i. You need to write 'a' and 'b' separately" << endl << endl;
  cout << "Choose a function" << endl;
  int num;
  cin >> num;
  if(num == 1)
  {
      int aa1, bb1, aa2, bb2;
      cout << "Input a1:"; cin >> aa1; cout << endl;
      cout << "Input b1:"; cin >> bb1; cout << endl;
      cout << "Input a2:"; cin >> aa2; cout << endl;
      cout << "Input b2:"; cin >> bb2; cout << endl;
      f1(aa1, bb1, aa2, bb2);
  }
  if(num == 2)
  {
      int aa1, bb1, aa2, bb2;
      cout << "Input a1:"; cin >> aa1; cout << endl;
      cout << "Input b1:"; cin >> bb1; cout << endl;
      cout << "Input a2:"; cin >> aa2; cout << endl;
      cout << "Input b2:"; cin >> bb2; cout << endl;
      f2(aa1, bb1, aa2, bb2);
  }
  if(num == 3)
  {
      int aa1, bb1, ll;
      cout << "Input a1:"; cin >> aa1; cout << endl;
      cout << "Input b1:"; cin >> bb1; cout << endl;
      cout << "Input scalar:"; cin >> ll; cout << endl;
      f3(aa1, bb1, ll);
  }
  return 0;
}
