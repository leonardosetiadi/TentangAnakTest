abstract class UseCase<T, P> {
  Future<T> get({P params});
}
