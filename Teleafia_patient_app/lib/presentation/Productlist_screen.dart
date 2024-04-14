import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:badges/badges.dart' as badges;
import 'package:uuid/uuid.dart';

import '../e-dawa cart/cart_model.dart';
import '../e-dawa cart/cart_provider.dart';
import '../e-dawa cart/db_helper.dart';
import 'cart_screen.dart';
// Import UUID package

class ProductList extends StatefulWidget {
  const ProductList({Key? key}) : super(key: key);

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  final Color maroon = const Color(0xFF982B15);
  late CartProvider cart;
  late DBHelper dbHelper;
  final uuid = Uuid();
  String uniqueProductId = Uuid().v4();

  List<String> ProductName = ['MOLNUPIRAVIR', 'ORAL-MINOXIDIL', 'LUPINAVIR', 'AZITHROMYCIN TABLETS'];
  List<String> ProductDescription = ['Antiviral pill', 'Anti-Biotic', 'Vitamins', 'Anti-Bacterial'];
  List<int> ProductPrice = [500, 750, 400, 850];
  List<String> ProductImage = [
    'https://images.theconversation.com/files/430413/original/file-20211104-19-tij9pk.jpg?ixlib=rb-1.1.0&rect=1235%2C0%2C3741%2C3741&q=45&auto=format&w=240&h=240&fit=crop',
    'https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcSiUOocjcXSmwdeUCgPWyY7fzKLS1O1gyE4_T7fcUtVsoEYEmJn',
    'https://media.istockphoto.com/id/997043058/vector/set-of-different-medience-containers-and-pills.jpg?s=612x612&w=0&k=20&c=ZjDoGsLiPq84hA9CKT7UsCG7RgN4lB5t7C-L5gI21LI=',
    'https://5.imimg.com/data5/ANDROID/Default/2023/4/301013277/XJ/UQ/QP/73935541/product-jpeg-500x500.jpg',
  ];

  @override
  void initState() {
    super.initState();
    dbHelper = DBHelper(); // Initialize dbHelper
    dbHelper.initDatabase(); // Initialize the database
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Initialize the cart variable using Provider.of within didChangeDependencies
    cart = Provider.of<CartProvider>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: maroon,
        title: Text(
          'Our Products',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () async {
                // Get cart items from the provider
                List<Cart> cartItems = await cart.getData();
                // Navigate to CartScreen and pass cart items
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CartScreen(cartItems: cartItems, cartProvider: cart), // Corrected syntax
                  ),
                );
              },
              child: Center(
                child: badges.Badge(
                  badgeContent: Builder(
                    builder: (context) {
                      return Consumer<CartProvider>(
                        builder: (context, value, child) {
                          return  Text(value.counter.toString(), style: TextStyle(color: Colors.white));
                        },
                      );
                    },
                  ),
                  child: Icon(Icons.shopping_cart, color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: ProductName.length,
              itemBuilder: (context, index) {
                return Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Image(
                              height: 100,
                              width: 100,
                              image: NetworkImage(ProductImage[index]),
                            ),
                            SizedBox(width: 20.0,),
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(ProductName[index], style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),),
                                  SizedBox(height: 5,),
                                  Text(ProductDescription[index], style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.blue),),
                                  SizedBox(height: 5,),
                                  Text('Ksh.' + ProductPrice[index].toString(), style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: maroon),),
                                  SizedBox(width: 0,),
                                  Align(
                                    alignment: Alignment.centerRight,
                                    child: InkWell(
                                      onTap: () {
                                        addToCart(index); // Call the function to add to cart
                                      },
                                      child: Container(
                                        height: 35,
                                        width: 100,
                                        decoration: BoxDecoration(
                                          color: maroon,
                                          borderRadius: BorderRadius.circular(10),
                                        ),
                                        child: Center(
                                          child: Text('Add to Cart', style: TextStyle(fontWeight: FontWeight.w300, fontSize: 16, color: Colors.white),),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        color: Colors.transparent,
        child: Container(
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
            color: Colors.white,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              bottomNavigatorButtons('Explore', 'assets/explore.PNG'),
              bottomNavigatorButtons('Payments', 'assets/payments.PNG'),
              bottomNavigatorButtons('Home', 'assets/home.PNG'),
              bottomNavigatorButtons('Customer Care', 'assets/customer_care.PNG'),
              bottomNavigatorButtons('Profile', 'assets/profile.PNG'),
            ],
          ),
        ),
      ),
    );
  }

  Widget bottomNavigatorButtons(String title, String imagePath) {
    return Container(
      width: 45,
      padding: const EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            imagePath,
            height: 25,
          ),
          const SizedBox(height: 2),
          Text(
            title,
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 6.5,
            ),
          ),
        ],
      ),
    );
  }

  void addToCart(int index) {
    int uniqueId = DateTime.now().millisecondsSinceEpoch; // Generate a unique integer ID using milliseconds since epoch
    dbHelper.insert(
      Cart(
        id: uniqueId,
        productId: index.toString(),
        productName: ProductName[index],
        productDescription: ProductDescription[index],
        productPrice: ProductPrice[index],
        productImage: ProductImage[index],
      ),
    ).then((value) {
      print('Product is added to cart');
      cart.addtotalPrice(double.parse(ProductPrice[index].toString()));
      cart.addCounter(); // Increment the counter
      // Notify listeners to reflect changes in the UI
      cart.notifyListeners();
    }).catchError((error) {
      print('Error inserting product into cart: $error');
    });
  }
}
