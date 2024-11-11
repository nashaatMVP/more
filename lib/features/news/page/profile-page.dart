import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:more/constants/constants.dart';
import 'package:more/constants/custom_textfield.dart';
import 'package:more/features/news/cubit/news-state.dart';
import 'package:more/features/news/cubit/news_cubit.dart';
import 'package:more/features/news/widgets/article_item.dart';
import '../../../constants/custom_text.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});

  TextEditingController searchController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsCubitState>(
      listener: (context,state) {},
      builder: (context,state) {
        var list = NewsCubit.get(context).searchList;
        var cubit = NewsCubit.get(context);
        return  Scaffold(
          body: ConditionalBuilder(
            condition: state is! LoadingNewsCubit,
            fallback: (context) => const Center(child: CircularProgressIndicator()),
            builder: (context) => CustomScrollView(
              slivers: [
                SliverList(
                    delegate: SliverChildListDelegate([
                  kHeight100,
                  Row(
                    children: [
                      kWidth30,
                      Material(
                        shadowColor: Colors.black,
                        elevation: 20,
                        borderRadius: BorderRadius.circular(39),
                        child: const CircleAvatar(
                          radius: 38,
                          backgroundColor: Colors.white,
                          child: CircleAvatar(
                            radius: 35,
                            backgroundColor: Colors.white,
                            backgroundImage: NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR59PcOodbdbcdDU9GiOPgntKpbCREadMs69g&s"),
                          ),
                        ),
                      ),
                      kWidth30,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextWidgets.heading("Mahmoud Kamal",fontSize: 20),
                          TextWidgets.subHeading("Mahmoud Kamal@gmail.com",fontSize: 18,color: Colors.white60),
                        ],
                      ),
                    ],
                  ),
                  kHeight40,
                  SearchTextField(
                    hintText: 'Search',
                    controller: searchController,
                    onChanged: (value) {
                      cubit.getSearch(value);
                    },
                  ),


                  SliverGrid(
                    delegate: SliverChildBuilderDelegate(
                      childCount: list.length,
                          (context, index) => ArticleItem(list[index],context),
                    ),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 30,
                      crossAxisSpacing: 10,
                      childAspectRatio: 0.6 / 0.6,
                    ),
                  ),
                ])),
              ],
            ),
          ),
        );
      },
    );
  }
}
