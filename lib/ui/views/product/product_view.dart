import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:new_project/theme/styles.dart';
import 'package:stacked/stacked.dart';

import 'product_viewmodel.dart';

class ProductView extends StackedView<ProductViewModel> {
  const ProductView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    ProductViewModel viewModel,
    Widget? child,
  ) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              height: size.height * 0.5,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(
                        "https://img.freepik.com/free-photo/macaroni-noodles-with-meat-tomato-sauce-served-plate-table_1220-6904.jpg"),
                    fit: BoxFit.cover),
              ),
              // child: Image.network(
              //     "https://img.freepik.com/free-photo/macaroni-noodles-with-meat-tomato-sauce-served-plate-table_1220-6904.jpg"),
            ),
            // buttonArrow(context),
            scroll(size, viewModel),
          ],
        ),
      ),
    );
  }

  scroll(Size size, ProductViewModel viewModel) {
    return DraggableScrollableSheet(
        initialChildSize: 0.6,
        maxChildSize: 0.8,
        minChildSize: 0.6,
        builder: (context, scrollController) {
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            clipBehavior: Clip.hardEdge,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20)),
            ),
            child: SingleChildScrollView(
              controller: scrollController,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 25),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 5,
                          width: 35,
                          color: Colors.black12,
                        ),
                      ],
                    ),
                  ),
                  Text(
                    "Cacao Maca Walnut Milk",
                    style: GoogleFonts.ubuntu(
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      color: MyStyles.themeMode().mainTextColor,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Food .60 min",
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(color: Colors.grey),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      InkWell(
                        onTap: () {
                          
                        },
                        child: const CircleAvatar(
                          radius: 25,
                          backgroundImage: NetworkImage(
                              "https://img.freepik.com/free-photo/portrait-man-laughing_23-2148859448.jpg?size=338&ext=jpg&ga=GA1.1.1448711260.1706745600&semt=ais"),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Elena Shelby",
                        style: GoogleFonts.ubuntu(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: MyStyles.themeMode().mainTextColor,
                        ),
                      ),
                      const Spacer(),
                      CircleAvatar(
                        radius: 25,
                        backgroundColor: MyStyles.themeData().primaryColor,
                        child: const Icon(
                          Icons.favorite,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        "273 Likes",
                        style: GoogleFonts.ubuntu(
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                          color: MyStyles.themeMode().mainTextColor,
                        ),
                      ),
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 15),
                    child: Divider(
                      height: 4,
                    ),
                  ),
                  Text(
                    "Description",
                    style: GoogleFonts.ubuntu(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: MyStyles.themeMode().mainTextColor,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Your recipe has been uploaded, you can see it on your profile. Your recipe has been uploaded, you can see it on your',
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(color: Colors.grey),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 15),
                    child: Divider(
                      height: 4,
                    ),
                  ),
                  Text(
                    "Ingredients",
                    style: GoogleFonts.ubuntu(
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      color: MyStyles.themeMode().mainTextColor,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: 3,
                    itemBuilder: (context, index) => ingredients(context),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 15),
                    child: Divider(
                      height: 4,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      viewModel.goBack();
                    },
                    child: Container(
                      height: size.height * 0.080,
                      width: size.width,
                      // margin:
                      //     const EdgeInsets.only(left: 20, right: 20),
                      padding: const EdgeInsets.all(15.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: MyStyles.themeMode().buttonGradient!,
                        ),
                      ),
                      child: Center(
                        child: Text(
                          'Add to Cart',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.ubuntu(
                            fontSize: size.height * 0.028,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  ingredients(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          CircleAvatar(
            radius: 10,
            backgroundColor: const Color(0xFFE3FFF8),
            child: Icon(
              Icons.done,
              size: 15,
              color: MyStyles.themeData().primaryColor,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Text(
            "4 Eggs",
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }

  steps(BuildContext context, int index) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          CircleAvatar(
            backgroundColor: Colors.orange,
            radius: 12,
            child: Text("${index + 1}"),
          ),
          Column(
            children: [
              SizedBox(
                width: 270,
                child: Text(
                  "Your recipe has been uploaded, you can see it on your profile. Your recipe has been uploaded, you can see it on your",
                  maxLines: 3,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(color: Colors.black),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Image.asset(
                "assets/imges/Rectangle 219.png",
                height: 155,
                width: 270,
              )
            ],
          )
        ],
      ),
    );
  }

  @override
  ProductViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      ProductViewModel();
}
