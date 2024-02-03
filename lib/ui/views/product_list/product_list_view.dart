import 'package:flutter/material.dart';
import 'package:new_project/theme/styles.dart';
import 'package:new_project/widgets/custom_listtile_widget.dart';
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
          title: 'Our Products',
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
                child: GestureDetector(
                  onTap: () {
                    viewModel.navigateToProductDetail();
                  },
                  child: CustomListTile(
                    height: 90,
                    leading: Container(
                      height: 120,
                      width: 120,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: const DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                            "https://i.pinimg.com/736x/25/a3/80/25a380a1939efa6f94d9d7b1ec623ee8.jpg",
                          ),
                        ),
                      ),
                    ),
                    title: const Text(
                      "Product Name",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                    ),
                    subTitle: Text(
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
                  ),
                ),
              );
            }),
      ),
    );
  }

  @override
  ProductListViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      ProductListViewModel();
}
