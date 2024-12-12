class Welcome {
  final String greeting;
  final List<String> instructions;

  const Welcome({
    this.greeting="",
    this.instructions=const [],
  });

  Welcome copyWith({
    String? greeting,
    List<String>? instructions,
  }) =>
      Welcome(
        greeting: greeting ?? this.greeting,
        instructions: instructions ?? this.instructions,
      );

  Map<String, dynamic> toJson() => {
    "greeting": greeting,
    "instructions": List<dynamic>.from(instructions.map((x) => x)),
  };
}
