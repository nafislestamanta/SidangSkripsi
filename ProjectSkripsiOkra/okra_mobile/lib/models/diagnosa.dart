class ModelProviderGejala {
  ModelProviderGejala({
    required this.kodeGejala,
    required this.kodeValue,
  });

  String kodeGejala;
  String kodeValue;

  Map<String, dynamic> toJson() => {
    "kodeGejala": kodeGejala,
    "kodeValue": kodeValue
  };
}


