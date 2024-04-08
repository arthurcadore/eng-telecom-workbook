#include <fstream>
#include <iostream>
#include <list>
#include <string>
#include <unordered_map>

using namespace std;

struct user_register {
  string name;
  int access_count = 0;
  int lease_time;
};

bool comparation(const user_register& first_integer,
                 const user_register& second_integer) {
  return first_integer.name > second_integer.name;
}

void show_unique(unordered_map<string, user_register>& users_unique,
                 string name_unique) {
  if (users_unique.count(name_unique)) {
    cout << name_unique << " ";
    cout << users_unique[name_unique].access_count << " ";
    cout << users_unique[name_unique].lease_time << " ";
  } else {
    cout << "usuario invalido" << endl;
  }
}

void show_all(unordered_map<string, user_register>& users_all) {
  list<user_register> output;

  for (auto& par : users_all) {
    // user_register aux;

    // aux.name = interator.first;
    // aux.access_count = interator.second;
    // aux.lease_time = interator.tird;
    output.push_back(par.second);
  }

  output.sort(comparation);

  for (auto& info : output) {
    cout << info.name << " ";
    cout << info.access_count << " ";
    cout << info.lease_time << endl;
  }
}

int main(int argc, char* argv[]) {
  ifstream arq(argv[1]);
  string user_input = argv[2];
  string user_name;
  string user_time;
  int user_lease;

  unordered_map<string, user_register> users_acess;

  while (arq >> user_name >> user_time >> user_lease) {
    users_acess[user_name].name = user_name;
    users_acess[user_name].access_count++;
    users_acess[user_name].lease_time += user_lease;
  }

  if (user_input.length() < 0) {
    show_unique(users_acess, user_input);
  } else {
    show_all(users_acess);
  }
}
