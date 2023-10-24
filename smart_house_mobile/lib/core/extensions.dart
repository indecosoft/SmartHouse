extension ScopeFunctionExtension<T> on T {
  R let<R>(R Function(T it) converter) => converter(this);
}
