abstract class Usecase<Return, Params> {
  Future<Return> exec(Params params);
}
