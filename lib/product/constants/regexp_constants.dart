// ignore_for_file: public_member_api_docs

final class RegExpConstants {
  RegExpConstants._();
  static final email = RegExp(
    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
  );
}
