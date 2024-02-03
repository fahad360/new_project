import 'package:flutter/material.dart';
import 'package:new_project/theme/styles.dart';
import 'package:new_project/ui/views/navbar/navbar_view.dart';
import 'package:new_project/widgets/main_appbar.dart';
import 'package:stacked/stacked.dart';

import 'product_list_viewmodel.dart';

class ProductListView extends StackedView<ProductListViewModel> {
  const ProductListView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    ProductListViewModel viewModel,
    Widget? child,
  ) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100),
        child: appbarWidget(
          onTap: () {
            // viewModel.selectRole();
          },
          size: size,
          context: context,
          title: 'Product Detail',
          color: MyStyles.themeData().primaryColor,
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
        child: ListView.builder(
            itemCount: 10,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  elevation: 8,
                  // shadowColor: MyStyles.themeData().primaryColor,
                  child: ListTile(
                    leading: const CircleAvatar(
                      backgroundImage: NetworkImage(
                          "https://i.pinimg.com/736x/25/a3/80/25a380a1939efa6f94d9d7b1ec623ee8.jpg"),
                      radius: 30,
                    ),
                    title: const Text(
                      "Product Name",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                    ),
                    subtitle: Text(
                      "\$3.50",
                      style: TextStyle(
                          color: MyStyles.themeData().primaryColor,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                    trailing: IconButton(
                      icon: Icon(
                        viewModel.isFav
                            ? Icons.favorite
                            : Icons.favorite_border,
                        color: MyStyles.themeData().primaryColor,
                      ),
                      onPressed: () {
                        viewModel.changeIcon();
                        // viewModel.navigateToProductDetail();
                      },
                    ),
                    onTap: () {
                      viewModel.navigateToProductDetail();
                    },
                  ),
                ),
              );
            }),
      ),
      bottomNavigationBar: const NavbarView(),
    );
  }

  @override
  ProductListViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      ProductListViewModel();
}
