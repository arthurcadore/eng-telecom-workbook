#ifndef LIST_API
#define LIST_API

#include <stdexcept>

// um node (a caixinha)
template <typename T>
struct node {
  // um data armazenado
  T data;

  // isto indica qual o próximo node da sequência
  node* next;
};

template <typename T>
struct list {
  // o first node da list
  node<T>* first;

  node<T>* last;

  // o lenght da list (quantos nodes existem)
  int lenght;
};

template <typename T>
list<T> list_create() {
  // Create a new list and add null pointers on parameters, size of 0;
  list l = {nullptr, nullptr, 0};

  return l;
}

template <typename T>
node<T>* node_create(const T& data) {
  // Creates a new pointer for the memory region that the node is included.

  auto new_node = new node;

  // Add data into node parameter.
  new_node->data = data;
  new_node->next = nullptr;

  return new_node;
}

template <typename T>
node<T>* node_find(list<T>& l, int position) {
  if (position >= l.lenght) {
    return nullptr;
  }

  auto ptr = l.first;

  for (int i = 0; i < position; i++) {
    ptr = ptr->next;
  }

  return ptr;
}

// acrescenta um data ao final da list
template <typename T>
void list_insert_back(list<T>& l, const T& data) {
  // criar node

  auto node = node_create(data);

  if (l.lenght == 0) {
    l.first = node;

  } else {
    auto ptr = l.last;

    ptr->next = node;

    l.last = node;
  }

  l.last = node;
  l.lenght++;

  return;
}

template <typename T>
void list_pop_back(list<T>& l) {
  if (l.lenght == 0) {
    throw std::length_error("empty list!");
  }

  node* old_last = l.last;

  node* new_last = node_find(l, l.lenght - 2);

  l.last = new_last;

  delete old_last;

  l.lenght--;
  return;
}

// insere um data no início da list
template <typename T>
void list_insert_front(list<T>& l, const T& data) {
  auto node = node_create(data);

  if (l.lenght == 0) {
    l.last = node;

  } else {
    auto ptr = l.first;

    node->next = l.first;

    l.first = node;
  }

  l.first = node;

  l.lenght++;

  return;
}

template <typename T>
void list_pop_front(list<T>& l) {
  if (l.lenght == 0) {
    throw std::length_error("empty list!");
  }

  node* old_first = l.first;
  l.first = old_first->next;
  delete old_first;

  l.lenght--;
  return;
}

// acessa um data no início da list
template <typename T>
T list_get_front(list<T>& l) {
  if (l.lenght == 0)
    throw std::length_error("empty list!");
  else {
    auto ptr = l.first;

    return ptr->data;
  }
};

// acessa um data no final da list
template <typename T>
T list_get_back(list<T>& l) {
  if (l.lenght == 0)
    throw std::length_error("empty list!");
  else {
    auto ptr = l.last;

    return ptr->data;
  }
}

// acessa um data em posição qualquer da list
template <typename T>
T list_get(list<T>& l, int position) {
  auto pointer = node_find(l, position);
  if (pointer == nullptr) throw std::length_error("empty list!");

  return pointer->data;
}

// insere um data em uma posição qualquer
template <typename T>
void list_insert(list<T>& l, int position, const T& data) {
  // --

  if (l.lenght == 0) {
    list_insert_front(l, data);

    return;
  }

  if (position >= l.lenght) {
    list_insert_back(l, data);

    return;
  }
  node* node = node_create(data);

  int position_last = position - 1;
  auto old_node = node_find(l, position_last);

  auto old_next = old_node->next;

  node->next = old_next;

  old_node->next = node;
  l.lenght++;

  return;
}
// remove um dado da lista
template <typename T>
void list_remove(list<T>& l, int position) {
  if (l.lenght == 0) {
    throw std::length_error("empty list!");
  }

  if (position == 0) {
    list_pop_front(l);
    return;
  }

  if (position = l.lenght - 1) {
    list_pop_back(l);
    return;
  }

  auto last_node = node_find(l, position - 1);
  auto removed_node = node_find(l, position);
  auto next_node = node_find(l, position + 1);

  last_node->next = next_node;

  delete removed_node;

  l.lenght--;

  return;
}

#endif
