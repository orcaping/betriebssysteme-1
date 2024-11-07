unsigned int unsigned_number = 42;
unsigned int second_unsigned_number = 160;
int signed_number = -128;
int second_signed_number = -64;
int bit_index = 3;

int main() {
  if (unsigned_number == 21) {
    return 1;
  }

  if (unsigned_number == 0) {
    return 2;
  }

  if (unsigned_number == second_unsigned_number) {
    return 3;
  }

  if (unsigned_number < 18) {
    return 4;
  }

  if (signed_number < 18) {
    return 5;
  }

  if (signed_number < 0) {
    return 6;
  }

  if (unsigned_number < second_unsigned_number) {
    return 7;
  }

  if (signed_number < second_signed_number) {
    return 8;
  }

  if (signed_number & (1 << 3)) {
    return 9;
  }

  if (signed_number & (1 << bit_index)) {
    return 10;
  }
}
