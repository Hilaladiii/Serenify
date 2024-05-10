import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:serenify/bloc/seminar/seminar_bloc.dart';
import 'package:serenify/styles/my_colors.dart';
import 'package:serenify/styles/my_text.dart';

class DetailSeminarPage extends StatefulWidget {
  const DetailSeminarPage({super.key, required this.id});
  final String id;

  @override
  State<DetailSeminarPage> createState() => _DetailSeminarPageState();
}

class _DetailSeminarPageState extends State<DetailSeminarPage> {
  @override
  void initState() {
    super.initState();
    context.read<SeminarBloc>().add(GetSeminarByIdEvent(id: widget.id));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Detail',
          style: MyTextStyle.h5semi(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: BlocBuilder<SeminarBloc, SeminarState>(
          builder: (context, state) {
            if (state is GetSeminarByIdFetchSuccess) {
              var seminarData = state.seminar;
              var tanggal = seminarData.time.substring(0, 10);
              var waktu = seminarData.time.substring(11, 19);
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 36),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.network(seminarData.photoLink),
                    const SizedBox(
                      height: 16,
                    ),
                    Text(
                      seminarData.title,
                      style: MyTextStyle.h5bold(color: Colors.black),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SvgPicture.asset(
                          'assets/svgs/time.svg',
                          color: MyColors.tertiary400,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          '$tanggal \n$waktu',
                          style: MyTextStyle.h8reg(color: MyColors.gray400),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        SvgPicture.asset(
                          'assets/svgs/location.svg',
                          color: MyColors.tertiary400,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          seminarData.place,
                          style: MyTextStyle.h8reg(color: MyColors.gray400),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Row(
                      children: [
                        Text(
                          'Rp.${seminarData.price}',
                          style:
                              MyTextStyle.h5semi(color: MyColors.tertiary400),
                        ),
                        Text(
                          '/ orang',
                          style: MyTextStyle.h8reg(color: MyColors.gray200),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Informasi Lainnya',
                      style: MyTextStyle.h7bold(color: Colors.black),
                    ),
                    Text(
                      seminarData.description,
                      style: MyTextStyle.h8reg(color: MyColors.gray300),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              );
            }
            if (state is GetSeminarByIdFetchFailure) {
              return Center(
                child: Text(state.error),
              );
            }
            if (state is GetSeminarByIdFetchLoading) {
              return const Center(
                child: Text('loading...'),
              );
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }
}
