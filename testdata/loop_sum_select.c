#include <stdlib.h>
#include <stdio.h>

__attribute__ ((noinline))
static void loop_sum(int* a, int* output, int length) {
  for (int i = 0; i < length; ++i) {
    if ((i % 2) == 0) {
      *output += a[i] * 2;
    } else {
      *output += a[i] + 3;
    }
  }
}

int main(int argc, char *argv[]) {
  int* a = malloc(100000 * sizeof(int));

  for (int i = 0; i < 100000; i++) {
      a[i] = rand();
  }

  int* result = malloc(sizeof(int));
  loop_sum(a, result, 100000);
  printf("Sum: %d\n", *result);
  return 0;
}
