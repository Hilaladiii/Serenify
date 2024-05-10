import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:serenify/bloc/seminar/seminar_bloc.dart';
import 'package:serenify/models/seminar_model.dart';
import 'package:serenify/presentations/pages/seminar/detail_seminar_page.dart';
import 'package:serenify/presentations/pages/seminar/widgets/card_seminar.dart';

class SeminarPage extends StatefulWidget {
  const SeminarPage({super.key});

  @override
  State<SeminarPage> createState() => _SeminarPageState();
}

class _SeminarPageState extends State<SeminarPage> {
  @override
  void initState() {
    super.initState();
    context.read<SeminarBloc>().add(GetAllSeminarEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocBuilder<SeminarBloc, SeminarState>(builder: (context, state) {
        if (state is GetAllSeminarFetchSuccess) {
          List<SeminarModel> article = state.seminar;
          return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 22),
              child: ListView.separated(
                  itemBuilder: (context, index) {
                    return CardSeminar(
                        title: article[index].title,
                        image: article[index].photoLink,
                        place: article[index].place,
                        price: article[index].price,
                        time: article[index].time,
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) {
                              return DetailSeminarPage(id: article[index].id);
                            },
                          ));
                        });
                  },
                  separatorBuilder: (context, index) {
                    return const SizedBox(
                      height: 10,
                    );
                  },
                  itemCount: article.length));
        }
        if (state is GetAllSeminarFetchLoading) {
          return const Center(
            child: Text('Loading...'),
          );
        }
        if (state is GetAllSeminarFetchFailure) {
          return Center(
            child: Text(state.error),
          );
        } else {
          return Container();
        }
      }),
    );
  }
}
