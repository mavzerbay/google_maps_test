import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/components/platform_loader.dart';
import '../../core/init/extensions/context.extension.dart';
import '../../core/init/extensions/struct.extension.dart';
import 'blocs/bus/bus_bloc.dart';
import 'blocs/components/line_detail_row.dart';

class BusDetailView extends StatelessWidget {
  final String lineNo;
  const BusDetailView({
    Key? key,
    required this.lineNo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("$lineNo Detayı"),
          centerTitle: true,
        ),
        body: BlocProvider(
          lazy: false,
          create: (context) =>
              BusBloc(context.globalService)..add(BusGetBus(lineNo)),
          child: BlocListener<BusBloc, BusState>(
            listener: (context, state) {
              if (state is BusInitial) {
                context.read<BusBloc>().add(BusGetBus(lineNo));
              }
            },
            child: BlocBuilder<BusBloc, BusState>(
              builder: (context, state) {
                if (state is BusLoading) {
                  return _showLoader();
                } else if (state is BusError) {
                  return Center(
                    child: Text(
                      state.error.toString(),
                      style: context.textTheme.headline6,
                    ),
                  );
                } else if (state is BusLoaded &&
                    state.busResponse.hataVarMi.isTrue) {
                  return Center(
                    child: Text(
                      state.busResponse.hataMesaj ?? "",
                      style: context.textTheme.headline6,
                    ),
                  );
                } else if (state is BusLoaded &&
                    state.busResponse.hataVarMi.isFalse) {
                  return ListView.separated(
                    itemBuilder: ((context, index) {
                      final item = state.busResponse.hatlar![index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 10,
                        ),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    color: Colors.redAccent,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Text(
                                    "${item.hatNo}",
                                    style: context.textTheme.headline6,
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Expanded(
                                  child: Text(
                                    item.adi ?? "",
                                    style: context.textTheme.labelLarge,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            LineDetailRow(
                                title: "Açıklama", value: item.aciklama),
                            const SizedBox(height: 10),
                            LineDetailRow(
                              title: "Güzergah Açıklama",
                              value: item.guzergahAciklama,
                            ),
                            const SizedBox(height: 10),
                            LineDetailRow(
                              title: "Hat Başlangıç",
                              value: item.hatBaslangic,
                            ),
                            const SizedBox(height: 10),
                            LineDetailRow(
                              title: "Hat Bitiş",
                              value: item.hatBitis,
                            ),
                            const SizedBox(height: 10),
                            LineDetailRow(
                              title: "Gidiş",
                              value: item.calismaSaatiGidis,
                            ),
                            const SizedBox(height: 10),
                            LineDetailRow(
                              title: "Dönüş",
                              value: item.calismaSaatiDonus,
                            ),
                          ],
                        ),
                      );
                    }),
                    separatorBuilder: (context, index) => const Divider(),
                    itemCount: state.busResponse.hatlar!.length,
                  );
                }
                return const SizedBox();
              },
            ),
          ),
        ));
  }

  WillPopScope _showLoader() {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Card(
          margin: EdgeInsets.zero,
          color: Colors.transparent,
          elevation: 2,
          child: SimpleDialog(
            key: key,
            backgroundColor: Colors.transparent,
            elevation: 0,
            children: const [PlatformLoader()],
          ),
        ),
      ),
    );
  }
}
