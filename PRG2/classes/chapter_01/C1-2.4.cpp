#include <iostream>
#include <string>

using namespace std;

int main(int argc, char *argv[]) {
    string stringInput = argv[1];

    int firstSlash = stringInput.find_first_of("/");
    int secondSlash = stringInput.find_first_of("/", firstSlash + 1);

    if (!((firstSlash > 0 && firstSlash < 3) ||
          (secondSlash > 2 && secondSlash < 6)))
        cout << "data invalida";

    int monthSize = (secondSlash - firstSlash) - 1;

    string day = stringInput.substr(0, firstSlash);
    string month = stringInput.substr(firstSlash + 1, monthSize);
    string year = stringInput.substr(secondSlash + 1);

    if (int size = year.size() != 4) cout << "data invalida" << endl;

    cout << "day: " << day << endl;
    cout << "month: " << month << endl;
    cout << "year: " << year << endl;

    int dayValue = stoi(day);
    int monthValue = stoi(month);
    int yearValue = stoi(year);
}
