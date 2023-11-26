void loop_sum(int* a, int* b, int* output, int length) {
  for (int i = 0; i < length; ++i) {
    output[i] = a[i] + b[i];
  }
}
