int globalVariable;
int * pointer;

extern int externalVariable;

int main() {
  pointer = &globalVariable;

  *pointer = 42;

  externalVariable = globalVariable;
}
