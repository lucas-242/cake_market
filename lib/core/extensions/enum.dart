extension EnumExtension on Enum? {
  String toShortString() {
    if (this == null) {
      return '';
    }

    return this.toString().split('.').last;
  }
}
