import 'package:units_converter/models/conversion_node.dart';
import 'package:units_converter/units_converter.dart';

void main() {
  ConversionNode conversionTree = ConversionNode(
    name: 'Dash',
    leafNodes: [
      ConversionNode(
        name: 'KiloDash',
        coefficientProduct: 1000,
      ),
      ConversionNode(
        name: 'DashPlus1',
        coefficientSum: -1,
        leafNodes: [
          ConversionNode(
            name: 'OneOver(DashPlus1)',
            conversionType: ConversionType.reciprocalConversion,
          ),
        ],
      ),
    ],
  );

  final Map<String, String> symbolsMap = {
    'Dash': 'dsh',
    'KiloDash': 'kdsh',
    'DashPlus1': 'dsh+1',
    'OneOver(DashPlus1)': '1/(dsh+1)',
  };

  var dash = CustomProperty(
    conversionTree: conversionTree,
    mapSymbols: symbolsMap,
    name: 'Conversion of Dash',
  );

  dash.convert('Dash', 1);
  var myUnits = dash.getAll();
  for (var unit in myUnits) {
    print(
        'name:${unit.name}, value:${unit.value}, stringValue:${unit.stringValue}, symbol:${unit.symbol}');
  }
}