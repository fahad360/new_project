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
    return
        //  ViewModelBuilder<ProductListViewModel>.reactive(
        //     builder: (context, viewModel, child) =>
        Scaffold(
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
      body: viewModel.isBusy
          ? const Center(child: CircularProgressIndicator())
          : Container(
              padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
              child: ListView.builder(
                  itemCount: viewModel.products.length,
                  itemBuilder: (context, index) {
                    // final product = viewModel.data?[index];
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
                                "https://images.unsplash.com/photo-1523275335684-37898b6baf30?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8cHJvZHVjdHxlbnwwfHwwfHx8MA%3D%3D"),
                            radius: 30,
                          ),
                          title: Text(
                            viewModel.products[index].title!,
                            // "Smart Watch",
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w500),
                          ),
                          subtitle: Text(
                            "\$ 39.99",
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
                              // viewModel.changeIcon(
                              //     int.parse(viewModel.data![index]));
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
    // viewModelBuilder: () => ProductListViewModel());
  }

  @override
  ProductListViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      ProductListViewModel();
}
