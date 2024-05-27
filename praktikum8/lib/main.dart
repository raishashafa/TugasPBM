import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart';
import 'package:url_launcher/url_launcher.dart';
import 'food_menu.dart';
import 'cart_item.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<CartItem> _cartItems = [];
  
  void _addToCart(FoodMenu foodMenu) {
    setState(() {
      _cartItems.add(CartItem(foodMenu: foodMenu));
      print("_cartItems");
      _cartItems.forEach((element){
        print(element.foodMenu.name);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Praktikum Flutter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Home',
          style: TextStyle(color: Colors.black), 
        ),
        backgroundColor: Colors.blue, 
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('Selamat Datang Di Praktikum Flutter!'),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const MenuPage()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue, 
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20), 
                ),
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15), 
              ),
              child: const Text('Menu' , style: TextStyle(color: Colors.black)),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>  AboutPage()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue, // Change button color to green
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20), // Rounded button shape
                ),
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15), // Button padding
              ),
              child: const Text('About' ,  style: TextStyle(color: Colors.black)),
              ),
          ],
        ),
      ),
    );
  }
}


class MenuPage extends StatefulWidget {
  const MenuPage({Key? key}) : super(key: key);

  @override
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  List<CartItem> cartItems = [];
  List<CartItem> _cartItems = [];
  final List<FoodMenu> foodMenus = [
  FoodMenu(
    imageUrl: 'https://hips.hearstapps.com/hmg-prod/images/delish-190903-pasta-pomodoro-0178-landscape-pf-1568667627.jpg?crop=0.728xw:0.546xh;0.117xw,0.154xh&resize=1200:*', 
    name: 'Pasta', 
    price: 45000,
    ),
  FoodMenu(
    imageUrl: 'https://images.immediate.co.uk/production/volatile/sites/30/2020/08/best-ever-beef-bourginon-ceb8ca3.jpg', 
    name: 'Beef Bourguignon', 
    price: 55000,
    ),
  FoodMenu(
    imageUrl: 'https://www.womensweeklyfood.com.au/wp-content/uploads/sites/4/2022/11/01/23953/HL1065C25B-scaled.jpg', 
    name: 'Seafood Paella', 
    price: 135000,
    ),
  FoodMenu(
    imageUrl: 'https://i0.wp.com/thegourmetboys.com/wp-content/uploads/2023/10/Nandos-Pastel-de-Nata_Landscape.jpg?resize=1024%2C683&ssl=1', 
    name: 'Pastel de Nata', 
    price: 105000,
    ),
  FoodMenu(
    imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/d/d7/Aringa-marinato.jpg', 
    name: 'Pickle Herring', 
    price: 71000,
    ),
  FoodMenu(
    imageUrl: 'https://media.istockphoto.com/id/935677984/photo/meat-carpaccio.jpg?s=612x612&w=0&k=20&c=6EuQl2nzX7ZNNTaLxxpmuND8ZzZk8Cq2Fs7_ByUARSU=', 
    name: 'Carpaccio', 
    price: 99000,
    ),
  FoodMenu(
    imageUrl: 'https://media.istockphoto.com/id/149075642/photo/roast-beef-with-a-side-of-peas-and-carrots.jpg?s=612x612&w=0&k=20&c=_iO6alimCedoq9Erdl5UuNkIJz2v8eTtmdI_4dPCl8A=', 
    name: 'Roast & Yorkshire Pudding', 
    price: 45000,
    ),
  FoodMenu(
    imageUrl: 'https://simpleisgourmet.com/wp-content/uploads/2023/07/Quick-and-easy-gyros-with-tzatziki-sauce-wrapped-in-parchment-paper-with-tomatoes-and-cucumbers-1024x683.jpg', 
    name: 'Gyros with Tzatziki', 
    price: 75000,
    ),
  FoodMenu(
    imageUrl: 'https://i0.wp.com/www.womensweeklyfood.com.au/wp-content/uploads/sites/4/2019/09/30/31278/MUSHROOM-AND-THREE-CHEESE-NO-KNEAD-PIZZA.HERO3_-scaled.jpg?fit=2560%2C2133&ssl=1', 
    name: 'Pizza with cheezy mushroom', 
    price: 85000,
    ),
  FoodMenu(
    imageUrl: 'https://www.justataste.com/wp-content/uploads/2013/03/easy-churros-chocolate.jpg', 
    name: 'Churros', 
    price: 45000,
    ),
];

  void _addToCart(FoodMenu foodMenu) {
    setState(() {
      _cartItems.add(CartItem(foodMenu: foodMenu));
      print("_cartItems");
      _cartItems.forEach((element){
        print(element.foodMenu.name);
      });
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Menu'),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: (){
              Navigator.push(
                context, 
                MaterialPageRoute(builder: (context) => CartDialog(cartItems: _cartItems,)),
                );
            },
            ),
        ],
        backgroundColor: Colors.blue
      ),

      body: GridView.builder(
        itemCount: foodMenus.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.8,
          ),
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FoodMenuDetailPage(
                      foodMenu: foodMenus[index], 
                      addToCart: _addToCart,
                      cartItems: _cartItems,
                      ),
                  ),
                );
              },
        child: Card( 
          child: Column(
            children: [
              Expanded(
                child: Image.network(
                  foodMenus[index].imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    foodMenus[index].name,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                  Text('Rp ${foodMenus[index].price.toStringAsFixed(0)}'),
            ],
          ),
        ),
            );
          },
      ),
    );
  }
}

class CartDialog extends StatelessWidget {
  final List<CartItem> cartItems;
  
  CartDialog({required this.cartItems});
  
  @override
  Widget build(BuildContext context) {
    int itemCount = cartItems.fold<int>(0, (sum, item) => sum + item.quantity);
    double totalPrice = cartItems.fold<double>(0, (sum, item) => sum + item.foodMenu.price * item.quantity);
    
    print("itemCount $itemCount");
    print("totalPrice $totalPrice");

    return Scaffold(
      appBar: AppBar(
        title: Text("Keranjang"),
      ),
      body: Column(
        children: [
          ListView.builder(
            shrinkWrap: true,
            itemCount: cartItems.length,
            itemBuilder: (BuildContext context, int index) {
              print("a. $cartItems");
              return ListTile(
                leading: Image.network(
                  cartItems[index].foodMenu.imageUrl,
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                ),
                title: Text(cartItems[index].foodMenu.name),
                subtitle: Text(
                  'Rp ${cartItems[index].foodMenu.price.toStringAsFixed(0)} x ${cartItems[index].quantity}'),
                  trailing: Text(
                    'Rp ${(cartItems[index].foodMenu.price * cartItems[index].quantity).toStringAsFixed(0)}'),
                  );
            },
              ),
          Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Total Price Rp. $totalPrice"),
            )
          )
        ],
            ),
          );
  }
}
  
class FoodMenuDetailPage extends StatelessWidget {
  final FoodMenu foodMenu;
  final List<CartItem> cartItems;
  final void Function(FoodMenu) addToCart;

  FoodMenuDetailPage({
    Key? key, 
    required this.foodMenu,
    required this.addToCart,
    required this.cartItems,
    }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(foodMenu.name),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CartDialog(cartItems: cartItems,)
                ),
          );
  },
  ),
  ],
  ),
      body: SingleChildScrollView(
        child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(foodMenu.imageUrl),
            SizedBox(height: 16.0),
            Text(
              foodMenu.name,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'Harga: Rp ${foodMenu.price.toStringAsFixed(0)}'),
            ElevatedButton(onPressed: (){
              addToCart(foodMenu);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content:
                Text('${foodMenu.name} ditambahkan ke keranjang'),
                ),
                );
            }, 
            child: Text('Tambah ke Keranjang'),
            ),
          ],
        ),
      ),
      ),
    );
  }
}

class AboutPage extends StatefulWidget {
  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  String restaurantExteriorUrl = 'https://arsitagx-master.s3.ap-southeast-1.amazonaws.com/img_medium/1424/1255/7829/photo-exterior-view-bottega-ristorante-desain-arsitek-oleh-leo-einstein-fransiscus.jpeg';
  String restaurantInteriorUrl = 'https://static.wixstatic.com/media/92ee04_8c351df181eb4b3d8b4cd98e9743b8b3~mv2.jpg/v1/fill/w_480,h_320,al_c,q_80,usm_0.66_1.00_0.01,enc_auto/92ee04_8c351df181eb4b3d8b4cd98e9743b8b3~mv2.jpg';
  String restaurantName = 'Bistro Restaurant';
  String restaurantLocation = 'Jl. Jend Sudirman Kav 52-53 Fairgrounds SCBD, SCBD Lot 14, Jakarta 12950 Indonesia';
  String mapUrl = 'https://maps.app.goo.gl/jMoKWKyLe7CUwJXr8';

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text('About'),
        backgroundColor: Colors.blue
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                restaurantName,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 16),
                Text('Foto Luar Restoran: '),
                SizedBox(height: 8),
                Image.network(restaurantExteriorUrl),
                SizedBox(height: 16),
                Text('Foto Interior Restoran: '),
                SizedBox(height: 8),
                Image.network(restaurantInteriorUrl),
                SizedBox(height: 16),
                Text(
                  'Lokasi: ',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Text(restaurantLocation),
                SizedBox(height: 8),
                ElevatedButton.icon(
                  onPressed: () async {
                    await launch(mapUrl);
                  },
                  icon: Icon(Icons.map),
                  label: Text('Buka di Google Maps'),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

