import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:more/constants/constants.dart';
import 'package:more/constants/custom_container.dart';
import 'package:more/constants/custom_scaffoldMsg.dart';
import 'package:more/constants/custom_text.dart';
import 'package:more/core/cubit/app_cubit.dart';
import 'package:more/features/news/cubit/news-state.dart';
import 'package:more/features/news/cubit/news_cubit.dart';
import 'package:more/features/news/widgets/article_item.dart';
import '../../../constants/custom_textfield.dart';

class NewsPage extends StatelessWidget {
  const NewsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsCubitState>(
      listener: (context , state) {
        if(state is SuccessNewsCubit) {
         successMsg(context,"Success");
        } else if (state is FailureNewsCubit) {
          errorMsg(context,"Failure");
        }
      },
      builder: (context , state) {
        var list = NewsCubit.get(context).articlesList;
        var cubit = NewsCubit.get(context);
        return Scaffold(
          appBar: AppBar(),
          body: ConditionalBuilder(
            condition: state is! LoadingNewsCubit,
            fallback: (context) => const Center(child: CircularProgressIndicator()),
            builder: (context) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: CustomScrollView(
                slivers: [
                  SliverList(
                    delegate: SliverChildListDelegate(
                      [
                        kHeight40,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(child: SearchTextField(
                              hintText: 'Search',
                              controller: cubit.searchController,
                              onChanged: (value) {},
                            )),
                            kWidth10,
                            InkWell(
                                onTap: () {
                                  context.read<AppCubit>().changeTheme();
                                },
                                child: CustomContainer(
                                  height: 46,
                                  width: 46,
                                  radius: 8,
                                  color: Colors.grey[900],
                                  child: const Icon(
                                      CupertinoIcons.brightness,
                                      size: 30,
                                      color: Colors.yellow,
                                  ),
                                ),
                            ),
                          ],
                        ),
                        kHeight20,
                        kHeight40,
                      ],
                    ),
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
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}



