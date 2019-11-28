//taken and modified from https://code-examples.net/en/q/b1dc31
static char *int128toa_helper(char *dest, __int128 x) {
  if (x >= 10) {
    dest = int128toa_helper(dest, x / 10);
  }
  //reach base case when x is a single digit (most significant digit)
  *dest = (char) (x % 10 + '0');
  return ++dest;
}

//taken and modified from https://code-examples.net/en/q/b1dc31
//should make a string with ones place right before '\0'
char *int128toa(char *dest, __int128 x) {
  *int128toa_helper(dest, x) = '\0';
  return dest;
}