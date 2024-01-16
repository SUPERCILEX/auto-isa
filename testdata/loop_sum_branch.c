#include <stdlib.h>
#include <stdio.h>

__attribute__ ((noinline))
static void loop_sum(int* a, int* b, int* output, int length) {
  for (int i = 0; i < length; ++i) {
    if ((i % 2) == 0) {
      *output += a[i] * 2;
    } else {
      *output += b[i] + 3;
    }
  }
}

int main(int argc, char *argv[]) {
  int* a = malloc(100000 * sizeof(int));
  int* b = malloc(100000 * sizeof(int));

  for (int i = 0; i < 100000; i++) {
      a[i] = rand();
      b[i] = rand();
  }

  int result = 0;
  loop_sum(a, b, &result, 100000);
  printf("Sum: %d\n", result);
  return 0;
}
