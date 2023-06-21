abstract class StreamUseCase<T, P> {
  Stream<T?> execute(P params);
}
