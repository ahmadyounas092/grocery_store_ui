import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery_test/model/cart_model.dart';
import 'package:grocery_test/pages/payment_page.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.green),
      ),
      body: Consumer<CartModel> (builder: (context, value, child){
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                "My Cart",
                style: GoogleFonts.notoSerif(
                    fontWeight: FontWeight.bold, fontSize: 36),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: value.cartItmes.length,
                  padding: const EdgeInsets.all(12),
                  itemBuilder: (context, index){
                    return Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(8)
                        ),
                        child: ListTile(
                          leading: Image.asset(value.cartItmes[index][2], height: 36,),
                          title: Text(value.cartItmes[index][0]),
                          subtitle: Text(value.cartItmes[index][1]),
                          trailing: IconButton(
                            onPressed: ()=> Provider.of<CartModel> (context ,listen: false).removeItemsfromCart(index) ,
                            icon: const Icon(Icons.cancel),
                          ),
                        ),
                      ),
                    );
                  }
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(36),
              child: Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(12)
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Total Price", style: TextStyle(color: Colors.green.shade100),),
                        const SizedBox(
                          height: 4,
                        ),
                        Text("${value.CalculateTotal()} Rs", style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w500),),
                      ],
                    ),
                    GestureDetector(
                      onTap: () => const PaymentPage(),
                      child: Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.green.shade100),
                          borderRadius: BorderRadius.circular(12)
                        ),
                        child: const Row(
                          children: [
                            Text("Pay Now", style: TextStyle(color: Colors.white),),
                            Icon(Icons.arrow_forward_ios, color: Colors.white,)
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      },),
    );
  }
}
