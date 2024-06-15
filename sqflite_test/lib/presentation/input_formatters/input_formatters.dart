String brlCurrencyFormatters(String valueStr) {
  // Converte a string para double
  double value = double.parse(valueStr);

  // Converte o valor para string com duas casas decimais
  valueStr = value.toStringAsFixed(2);

  // Separa a parte inteira e a parte decimal
  List<String> parts = valueStr.split('.');
  String integerPart = parts[0];
  String decimalPart = parts[1];

  // Adiciona pontos como separadores de milhar
  RegExp regExp = RegExp(r'\B(?=(\d{3})+(?!\d))');
  integerPart = integerPart.replaceAllMapped(regExp, (match) => '.');

  // Retorna o valor formatado com o símbolo BRL
  return '$integerPart,$decimalPart';
}
