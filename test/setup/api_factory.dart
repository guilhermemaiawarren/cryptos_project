import 'package:faker/faker.dart';

Faker faker = Faker();

class ApiFactory {
  static List<Map<String, dynamic>> getAllCryptos() {
    return [
      {
        "id": faker.lorem.word(),
        "symbol": faker.lorem.word(),
        "name": faker.lorem.word(),
        "image": faker.image.image(),
        "current_price": faker.randomGenerator.decimal(),
        "price_change_percentage_24h": faker.randomGenerator.decimal(),
      }
    ];
  }

  static Map<String, dynamic> getPricesData(String id) {
    return {
      "prices": [
        [
          faker.randomGenerator.decimal(),
          faker.randomGenerator.decimal(),
        ],
      ],
    };
  }

  static const pricesData = '''
{
"prices": [
[
1367107200000,
135.3
],
[
1367193600000,
141.96
]
]
}
''';
}
