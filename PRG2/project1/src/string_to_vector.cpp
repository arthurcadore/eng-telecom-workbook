#include "string_to_vector.h"

vector<string> string_to_vector(const string& input,
                                const string& str_separator) {
  int space = 0;

  vector<string> line;

  string aux;

  while (space != string::npos) {
    int word = input.find_first_not_of(str_separator, space);

    if (word == string::npos) break;

    space = input.find(str_separator, word);
    if (space == string::npos) {
      aux = input.substr(word);
    } else {
      aux = input.substr(word, space - word);
    }
    line.push_back(aux);
  }

  return line;
}