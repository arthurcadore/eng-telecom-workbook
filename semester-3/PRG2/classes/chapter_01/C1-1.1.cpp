#include <iostream>
#include <string>

using namespace std;

int main() {
  string bar;
  string ter;

  cout << "Barometro:";
  cin >> bar;

  cout << "Termometro:";
  cin >> ter;

  if ((bar == "subindo") && (ter == "subindo"))
    cout << "Tempo bom, ventos quentes e secos" << endl;

  if ((bar == "subindo") && (ter == "estacionario"))
    cout << "Tempo bom, ventos de leste frescos" << endl;

  if ((bar == "subindo") && (ter == "baixando"))
    cout << "Tempo bom, ventos de sul a sudeste" << endl;

  if ((bar == "estacionario") && (ter == "subindo"))
    cout << "Tempo mudando para bom, ventos de leste" << endl;

  if ((bar == "estacionario") && (ter == "estacionario"))
    cout << "Tempo incerto, ventos variaveis" << endl;

  if ((bar == "estacionario") && (ter == "baixando"))
    cout << "Chuva provavel, ventos de sul a sudeste" << endl;

  if ((bar == "baixando") && (ter == "subindo"))
    cout << "Tempo instavel, aproximacao de frente" << endl;

  if ((bar == "baixando") && (ter == "estacionario"))
    cout << "Frente quente, com chuvas provaveis" << endl;

  if ((bar == "baixando") && (ter == "baixando"))
    cout << "Chuvas abundantes e ventos de sul a sudeste fortes" << endl;
}