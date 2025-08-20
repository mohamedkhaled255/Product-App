import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:lab4/api/api_provider.dart';
import 'package:lab4/build_chat_item.dart';
import 'package:lab4/build_story_item_widget.dart';
import 'package:lab4/controller/productsCubit/cubit/products_cubit_cubit.dart';
import 'package:lab4/models/chat_item_model.dart';
import 'package:lab4/models/products_model.dart';
class MyBlocObserver extends BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    print(' ${bloc.runtimeType}: ${change.nextState.runtimeType}');
  }
}






class MessengerScreen extends StatefulWidget {
  MessengerScreen({super.key});

  @override
  State<MessengerScreen> createState() => _MessengerState();
}

class _MessengerState extends State<MessengerScreen> {
  List<ChatItemModel> chatsItem = [
    ChatItemModel(
      name: "Mohamed Khaled",
      message: "My name is Mohamed Khaled",
      time: "08:00 AM",
    ),
    ChatItemModel(
      name: "Ahmed Gamal",
      message: "Hey, how are you?",
      time: "08:15 AM",
    ),
    ChatItemModel(
      name: "Salma Adel",
      message: "I'm working on the project now.",
      time: "08:30 AM",
    ),
    ChatItemModel(
      name: "Youssef Ali",
      message: "Let's meet at 10.",
      time: "09:00 AM",
    ),
    ChatItemModel(
      name: "Nada Hussein",
      message: "I'll call you later.",
      time: "09:45 AM",
    ),
    ChatItemModel(
      name: "Omar Tarek",
      message: "Did you finish the task?",
      time: "10:10 AM",
    ),
    ChatItemModel(
      name: "Laila Mostafa",
      message: "Good morning!",
      time: "10:30 AM",
    ),
    ChatItemModel(
      name: "Kareem Adel",
      message: "Check your email.",
      time: "11:00 AM",
    ),
    ChatItemModel(
      name: "Aya Mahmoud",
      message: "Thanks for your help!",
      time: "11:15 AM",
    ),
    ChatItemModel(
      name: "Tamer Hany",
      message: "Where are you now?",
      time: "11:45 AM",
    ),
    ChatItemModel(
      name: "Rania Fathy",
      message: "I'll be late today.",
      time: "12:00 PM",
    ),
    ChatItemModel(
      name: "Bassel Nader",
      message: "Meeting postponed to 2 PM.",
      time: "12:30 PM",
    ),
    ChatItemModel(
      name: "Heba Samir",
      message: "See you tomorrow.",
      time: "01:00 PM",
    ),
    ChatItemModel(
      name: "Mostafa Zaki",
      message: "Lunch at 1?",
      time: "01:15 PM",
    ),
    ChatItemModel(
      name: "Dina Ashraf",
      message: "I sent the files.",
      time: "01:30 PM",
    ),
  ];
  late ProductsModel productsModel;
  // late ProductsModel productsModel;
  // bool isLoading = true;

  // getProductFromApiProvider() async {
  //   productsModel = await ApiProvider().getAllProduct();
  //   print(productsModel.products[1].title);
  //   setState(() {
  //     isLoading = false;
  //   });
  // }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // getProductFromApiProvider();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (context) => productsCubit()..getProducts(),
        child: BlocConsumer<productsCubit, ProductsState>(
          listener: (context, state) {
           // print("current state $state");
            if (state is ProductsError) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(state.message)));
            }
            if (state is ProductsSuccess) {
              productsModel = state.productsModel;
            }
          },
          builder: (context, state) {
            return Scaffold(
              appBar: AppBar(
                elevation: 0,
                backgroundColor: Colors.grey[50],
                title: Row(
                  spacing: 10,
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundImage: NetworkImage(
                        'https://www.mosoah.com/wp-content/uploads/2019/11/%D8%B5%D9%88%D8%B1-%D8%A8%D8%B1%D9%85%D8%AC%D8%A93.jpg',
                      ),
                    ),
                    Text(
                      "Chats",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                actions: [
                  CircleAvatar(
                    radius: 20,
                    backgroundColor: Colors.blue,
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.camera_alt, color: Colors.white),
                    ),
                  ),
                  SizedBox(width: 10),
                  CircleAvatar(
                    radius: 20,
                    backgroundColor: Colors.blue,
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.edit, color: Colors.white),
                    ),
                  ),
                  SizedBox(width: 10),
                ],
              ),
              body: Padding(
                padding: const EdgeInsets.all(20),
                child: SingleChildScrollView(
                  child: Column(
                    spacing: 20,
                    children: [
                      Container(
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          spacing: 10,
                          children: [
                            Icon(Icons.search, size: 40),
                            Text("search", style: TextStyle(fontSize: 30)),
                          ],
                        ),
                      ),

                      SizedBox(
                        height: 100,
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) =>
                              BuildStoryItemWidget(),
                          separatorBuilder: (context, index) =>
                              SizedBox(width: 10),
                          itemCount: 20,
                        ),
                      ),
                      state is ProductsLoading
                          ? CircularProgressIndicator()
                          :ListView.separated(
                        separatorBuilder: (context, index) =>
                            SizedBox(height: 20),
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: productsModel.products.length,
                        itemBuilder: (context, index) {
                          final listProduct = productsModel.products;
                          return BuildChatItem(
                            name: listProduct[index].title,
                            message: listProduct[index].category,
                            time: "${listProduct[index].price.toString()}\$",
                            image: listProduct[index].thumbnail,
                          );
                        },
                      ) ,

                      //    : GridView.builder(
                      // itemCount: productsModel.products.length,
                      // shrinkWrap: true,
                      // physics: NeverScrollableScrollPhysics(),

                      // gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1), itemBuilder:
                      // (context,index){
                      //   final Product = productsModel.products[index];
                      //   return BuildChatItem(name: Product.title, message: Product.category, time: "${Product.price.toString()}\$", image: Product.thumbnail);
                      // })

                      // : StaggeredGrid.count(
                      //     crossAxisCount: 2,
                      //     mainAxisSpacing: 8,
                      //     crossAxisSpacing: 8,

                      //     children: List.generate(productsModel.products.length, (
                      //       index,
                      //     ) {
                      //       final product = productsModel.products[index];

                      //       // تحكم في الحجم بناءً على الفهرس
                      //       final crossAxis = (index % 4 == 0)
                      //           ? 2
                      //           : 1; // أحيانًا ياخد كل العرض
                      //       final mainAxis = (index % 3 == 0)
                      //           ? 0.5
                      //           : 1.2
                      //           ; // ارتفاع مختلف

                      //       return StaggeredGridTile.count(
                      //         crossAxisCellCount: crossAxis,
                      //         mainAxisCellCount: mainAxis,
                      //         child: BuildChatItem(
                      //           name: product.title,
                      //           message: product.category,
                      //           time: "${product.price.toString()}\$",
                      //           image: product.thumbnail,
                      //         ),
                      //       );
                      //     }),
                      //   ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}







/*ListView.separated(
                        separatorBuilder: (context, index) =>
                            SizedBox(height: 20),
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: productsModel.products.length,
                        itemBuilder: (context, index) {
                          final listProduct = productsModel.products;
                          return BuildChatItem(
                            name: listProduct[index].title,
                            message: listProduct[index].category,
                            time: "${listProduct[index].price.toString()}\$",
                            image: listProduct[index].thumbnail,
                          );
                        },
                      ),*/

                      // ListView.builder(
                      //         itemCount: context.read<productsCubit>().productsModel.products.length,
                      //         shrinkWrap: true,
                      //         physics: NeverScrollableScrollPhysics(),
                      //         itemBuilder: (context, index) {
                      //           final listProduct = context.read<productsCubit>().productsModel.products;
                      //           return BuildChatItem(
                      //             name: listProduct[index].title,
                      //             message: listProduct[index].category,
                      //             time: "${listProduct[index].price.toString()}\$",
                      //             image: listProduct[index].thumbnail,
                      //           );
                      //         },
                      //       )