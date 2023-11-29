struct Data {
  int data0;
  int data1;
};

struct Node {
  int metadata0;
  int metadata1;
  int metadata2;
  int metadata3;

  struct Node* next;
  struct Data* data;
};

void pointer_chase(struct Node* node, int* result) {
  while (node != 0) {
    *result += node->data->data0 + node->data->data1;
    node = node->next;
  }
}
