import '../models/cart_item.dart';

class MenuData {
  // Бургеры
  static List<CartItem> burgers = [
    CartItem(id: 1, name: 'Классический «СарНайт»', description: 'Говяжья котлета 150г, сыр чеддер, лист салата, маринованный огурец, лук, соус «бургер»', price: 320, imagePath: 'assets/images/standart_burger.jpg'),
    CartItem(id: 2, name: 'Двойной бургер', description: 'Две говяжьи котлеты по 150г, двойной сыр, бекон, салат, соус чили', price: 490, imagePath: 'assets/images/double_burger.jpg'),
    CartItem(id: 3, name: 'Острый «Сарыч»', description: 'Котлета из говядины, халапеньо, сыр с перцем, соус сальса, лук фри', price: 370, imagePath: 'assets/images/spicy_burger.jpg'),
    CartItem(id: 4, name: 'Куриный «Нежный»', description: 'Котлета из куриного филе (су-вид), соус «ранч», салат айсберг, помидор', price: 340, imagePath: 'assets/images/chicken_burger.jpg'),
  ];

  // Картофель и закуски
  static List<CartItem> snacks = [
    CartItem(id: 5, name: 'Картофель фри «СарНайт»', description: 'Двойная обжарка, обсыпка паприка+чеснок', price: 150, imagePath: 'assets/images/free.jpg'),
    CartItem(id: 6, name: 'Картофель фри большой', description: 'Увеличенная порция', price: 210, imagePath: 'assets/images/free2.jpg'),
    CartItem(id: 7, name: 'Картошка по-деревенски', description: 'Дольки с кожурой, розмарин, чеснок, морская соль', price: 170, imagePath: 'assets/images/free3.jpg'),
    CartItem(id: 8, name: 'Наггетсы (6 шт.)', description: 'Куриное филе в панировке панко, соус на выбор', price: 220, imagePath: 'assets/images/nagets.jpg'),
  ];

  // Домашняя кухня
  static List<CartItem> homeFood = [
    CartItem(id: 9, name: 'Пюре с котлетой', description: 'Картофельное пюре (сливки, масло), котлета из свинины+говядины, подлива мясная', price: 330, imagePath: 'assets/images/pure_podliva.jpg'),
    CartItem(id: 10, name: 'Пюре с сосисками', description: 'Картофельное пюре, сосиски молочные (2 шт), горчица/кетчуп, горошек', price: 290, imagePath: 'assets/images/pure_sosiski.jpg'),
    CartItem(id: 11, name: 'Жареная картошка с сосисками и сыром', description: 'Картофель жареный дольками, сосиски нарезные, сыр мацарела расплавленный, зелень', price: 370, imagePath: 'assets/images/fried_potato.jpg'),
    CartItem(id: 12, name: 'Макароны с котлетой', description: 'Макароны из твердых сортов, котлета домашняя, сыр, зелень', price: 320, imagePath: 'assets/images/makaroni_kotleta.jpg'),
    CartItem(id: 13, name: 'Сырный суп с сосисками', description: 'Сливки, сыр плавленый, картофель, сосиски нарезанные, гренки чесночные', price: 250, imagePath: 'assets/images/sup.jpg'),
  ];

  // Курица и крылья
  static List<CartItem> chicken = [
    CartItem(id: 14, name: 'Крылья BBQ (6 шт.)', description: 'Крылья куриные, соус барбекю-медовый, кунжут', price: 350, imagePath: 'assets/images/BBQ.jpg'),
    CartItem(id: 15, name: 'Курица «Табака» половинка', description: 'Цыпленок, чеснок, перец, зелень, соус ткемали', price: 390, imagePath: 'assets/images/chicken_tabaka.jpg'),
  ];

  // Напитки и соусы
  static List<CartItem> drinks = [
    CartItem(id: 16, name: '«Добрый Cola»', description: 'Напиток охлажденный 0,5 л', price: 100, imagePath: 'assets/images/cola.jpg'),
    CartItem(id: 17, name: '«Добрый Апельсин»', description: 'Напиток охлажденный 0,5 л', price: 100, imagePath: 'assets/images/orange.jpg'),
    CartItem(id: 18, name: 'Морс клюквенный', description: 'Напиток охлажденный 0,5 л, домашний', price: 100, imagePath: 'assets/images/mors.jpg'),
    CartItem(id: 19, name: 'Чай с лимоном', description: 'Горячий чай 0,4 л (черный/зеленый)', price: 100, imagePath: 'assets/images/tea.jpg'),
    CartItem(id: 20, name: 'Кофе американо', description: 'Горячий кофе 0,3 л, зерновой', price: 100, imagePath: 'assets/images/coffee.jpg'),
    CartItem(id: 21, name: 'Соусы (4 вида)', description: 'Сырный / Чесночный / Барбекю / Кисло-сладкий', price: 40, imagePath: 'assets/images/sous.jpg'),
  ];

  // Ночные сеты
  static List<Map<String, dynamic>> nightSets = [
    {'id': 101, 'name': '🌙 «Сонный водитель»', 'desc': 'Двойной бургер + Картофель фри большой + Добрый Cola', 'oldPrice': 800, 'newPrice': 630, 'image': 'assets/images/set_driver.jpg'},
    {'id': 102, 'name': '🌙 «Как у мамы»', 'desc': 'Пюре с котлетой + Сырный суп с сосисками + Хлеб', 'oldPrice': 660, 'newPrice': 530, 'image': 'assets/images/how_mama.jpg'},
    {'id': 103, 'name': '🌙 «Студент»', 'desc': 'Жареная картошка с сосисками и сыром + Добрый Апельсин', 'oldPrice': 490, 'newPrice': 390, 'image': 'assets/images/student.jpg'},
    {'id': 104, 'name': '🌙 «Ночной хруст»', 'desc': 'Крылья BBQ + Картошка по-деревенски + Морс', 'oldPrice': 700, 'newPrice': 570, 'image': 'assets/images/night_hrust.jpg'},
    {'id': 105, 'name': '🌙 «Бюджет»', 'desc': 'Пюре с сосисками + Чай + Сахар', 'oldPrice': 480, 'newPrice': 450, 'image': 'assets/images/budget.jpg'},
    {'id': 106, 'name': '🌙 «Уютный вечер»', 'desc': 'Макароны с котлетой + Сырный суп с сосисками', 'oldPrice': 570, 'newPrice': 480, 'image': 'assets/images/cozy_evening.jpg'},
  ];
}