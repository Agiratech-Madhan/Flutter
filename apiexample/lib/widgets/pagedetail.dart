import 'package:flutter/material.dart';
import 'package:apiexample/providers/page_provider.dart';

import 'package:provider/provider.dart';

class PageDetail extends StatefulWidget {
  const PageDetail({super.key});

  @override
  State<PageDetail> createState() => _PageDetailState();
}

class _PageDetailState extends State<PageDetail> {
  @override
  Widget build(BuildContext context) {
    final values = Provider.of<PageProvider>(context);

    return Builder(
        builder: ((context) => Expanded(
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: values.pageItem.length,
                  itemBuilder: ((context, index) => Container(
                        margin: EdgeInsets.all(10),
                        // color: Colors.pink,
                        width: MediaQuery.of(context).size.width * 0.9,
                        // height: MediaQuery.of(context).size.height * 0.75,
                        child: Column(
                          children: [
                            Text(
                                '${values.pageItem[index].author!.firstName}${values.pageItem[index].author!.lastName}'),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                OutlinedButton(
                                    onPressed: () {},
                                    child: Text(
                                        'total${values.pageItem[0].total}')),
                                OutlinedButton(
                                    onPressed: () {},
                                    child: Text(
                                        'perPage${values.pageItem[0].perPage}')),
                                OutlinedButton(
                                    onPressed: () {},
                                    child: Text(
                                        'totalPages${values.pageItem[0].totalPages}'))
                              ],
                            ),
                            Stack(
                              alignment: Alignment.center,
                              children: [
                                Container(
                                  child: Image.network(
                                    values.pageItem[0].data![index].avatar
                                        .toString(),
                                    width:
                                        MediaQuery.of(context).size.width * 1,
                                    height: MediaQuery.of(context).size.height *
                                        0.5,
                                  ),
                                ),
                                Positioned(
                                  // top: 100,
                                  // left: 100,
                                  child: Container(
                                    width: 120,
                                    height: 40,
                                    color: Colors.black54,
                                    alignment: Alignment.center,
                                    child: Text(
                                      textAlign: TextAlign.center,
                                      values.pageItem[0].data![index].first_name
                                          .toString(),
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ))),
            )));
  }
}
