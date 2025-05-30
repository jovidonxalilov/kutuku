import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:kutuku/core/navigation/routes.dart';
import 'package:kutuku/features/common/text_widget.dart';
import 'package:kutuku/features/home/manager/home_bloc.dart';
import 'package:kutuku/features/home/manager/home_state.dart';

import '../widget/category_item.dart';
import '../widget/product_card.dart';

class HomeDetail extends StatelessWidget {
  const HomeDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Delivery address'),
        actions: [
          Icon(Icons.favorite_border),
          SizedBox(width: 10),
          Icon(Icons.shopping_cart_outlined),
          SizedBox(width: 10),
        ],
      ),
      body: ListView(
        children: [
          BlocBuilder<HomeBloc, HomeState>(
            builder: (context, state) {
              final product = state.product;
              if (state.status == HomeStatus.loading) {
                return Center(child: CircularProgressIndicator(),);
              }
              if (state.status == HomeStatus.idle) {
                return Column(
                  children: [
                    TextField(
                      decoration: InputDecoration(
                        hintText: 'Search here...',
                        prefixIcon: Icon(Icons.search),
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 16),
                    Container(
                      padding: const EdgeInsets.all(16),
                      color: Colors.orange[200],
                      child: Text(
                        'UPTO 60% OFF\nSchool Collections',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(height: 16),
                    Text(
                      'Category',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(height: 8),
                    SizedBox(
                      height: 80,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          CategoryItem(label: 'Apparel', icon: Icons.checkroom),
                          CategoryItem(label: 'School', icon: Icons.school),
                          CategoryItem(label: 'Sports', icon: Icons.sports),
                          CategoryItem(label: 'Electronic', icon: Icons.devices),
                          CategoryItem(label: 'All', icon: Icons.all_inbox),
                        ],
                      ),
                    ),
                    SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          'Recent product',
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                        ),
                        Icon(Icons.filter_list),
                      ],
                    ),
                    SizedBox(height: 8),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: GridView.builder(
                        itemCount: product.length,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 12,
                          mainAxisSpacing: 12,
                          childAspectRatio: 0.7,
                        ),
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              context.push(
                                Routes.product(product[index].id),
                                extra: product[index],
                              );

                            },
                              child: ProductCard(product: product[index]));
                        },
                      ),
                    )
                  ],
                );
              }
              if (state.status == HomeStatus.error) {
                return Center(child: TextWidget(text: "Malomot Kelmadi", fontSize: 25,),);
              }
              return Center(child: TextWidget(text: "Malumotlar Topilmadi", fontSize: 25,),);
            },
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite_border), label: 'Wishlist'),
          BottomNavigationBarItem(icon: Icon(Icons.history), label: 'History'),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_outline), label: 'Account'),
        ],
      ),
    );
  }
}
