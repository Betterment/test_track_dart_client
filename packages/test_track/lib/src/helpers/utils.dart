/// Returns true if the current build is a debug build.
bool isDebug() {
  var isDebug = false;
  assert(isDebug = true, "Assertions only run in debug mode.");
  return isDebug;
}
