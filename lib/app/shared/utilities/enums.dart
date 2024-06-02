enum StudentType {
  regular("Regular"),
  irregular("Irregular"),
  repeater("Repeater"),
  transfer("Transfer"),
  returnee("Returnee");

  final String value;
  const StudentType(this.value);

  static StudentType getStudentType(String value) {
    return StudentType.values.firstWhere(
      (e) => e.value == value,
    );
  }
}
