extension EnumExtension on Enum? {
  String toShortString() {
    if (this == null) {
      return '';
    }

    // ignore: unnecessary_this
    return this.toString().split('.').last;
  }
}
