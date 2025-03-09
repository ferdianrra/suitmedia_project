import 'package:flutter/material.dart';
import 'package:practices/commons/const.dart';
import 'package:practices/commons/space.dart';
import 'package:practices/commons/state_enum.dart';
import 'package:practices/presentation/provider/user_list_notifier.dart';
import 'package:practices/presentation/widgets/custom_app_bar.dart';
import 'package:practices/presentation/widgets/custom_text_button.dart';
import 'package:provider/provider.dart';
import '../widgets/user_item_widget.dart';

class UserListScreen extends StatefulWidget {
  static const ROUTE_NAME = "/third";
  const UserListScreen({super.key});

  @override
  State<UserListScreen> createState() => _UserListScreenState();
}

class _UserListScreenState extends State<UserListScreen> {
  final ScrollController scrollController =  ScrollController();

  void _fetchUser({bool isRefresh = false}) {
    Provider.of<UserListNotifier>(context, listen: false)
      .fetchUser(isRefresh: isRefresh);
  }

  @override
  void initState() {
    final userNotifier = context.read<UserListNotifier>();
    super.initState();

    Future.microtask(
        () => _fetchUser()
    );

    scrollController.addListener(() {
      bool hasReachedEnd = scrollController.position.pixels >= scrollController.position.maxScrollExtent;
      bool hasNextPage = userNotifier.pageItems != null;
      if(hasReachedEnd) {
        if(hasNextPage) {
          userNotifier.fetchUser();
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: CustomAppBar(titleAppBar: thirdScreen),
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () async {
            _fetchUser(isRefresh: true);
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Consumer<UserListNotifier>(builder: (context, data, child) {
              final state = data.userState;
              if(state == RequestState.loading && data.pageItems == 1) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state == RequestState.loaded) {
                if(data.user.isEmpty) {
                  return Center(
                      child: Text(
                        emptyData,
                        style: theme.textTheme.titleMedium,
                      )
                  );
                } else {
                  return ListView.builder(
                      controller: scrollController,
                      itemCount: data.user.length + (data.pageItems != null || data.hasPaginationError ? 1 : 0),
                      itemBuilder: (context, index){
                        bool isPaginationErrorItem = data.hasPaginationError && index == data.user.length;
                        if(isPaginationErrorItem) {
                          return CustomTextButton(
                              text: refreshButtonText,
                              onPressed: () {
                                _fetchUser();
                              });
                        }
                        bool isLoadingMoreItem = index == data.user.length && data.pageItems != null;
                        if(isLoadingMoreItem) {
                          return const Center(
                            child: Padding(
                              padding: EdgeInsets.all(8),
                              child: CircularProgressIndicator(),
                            ),
                          );
                        }
                        final user = data.user[index];
                        return UserItemWidget(
                            user: user,
                            onTap: () {
                              Navigator.pop(context, '${user.firstName} ${user.lastName}');
                            },
                          );
                      });
                }
              } else {
                return Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(data.message),
                    verticalSpaceSmall,
                    CustomTextButton(
                        text: refreshButtonText,
                        onPressed: () {
                          _fetchUser();
                        })
                  ],
                );
              }
            }),
          ),
        ),
      ),
    );
  }
}

