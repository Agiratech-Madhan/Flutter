import 'package:flutter/material.dart';
import 'package:weatherapp/provider/data_provider.dart';

class ImageData extends StatelessWidget {
  const ImageData({
    Key? key,
    required this.provider,
    required this.autoComplete,
    required this.formatedDate,
  }) : super(key: key);

  final DataProvider provider;
  final bool? autoComplete;
  final String formatedDate;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        Image.network(
          provider.getImage('${provider.data?.condition}'),
          height: MediaQuery.of(context).size.height * 1,
          fit: BoxFit.fitHeight,
          filterQuality: FilterQuality.high,
        ),
        Positioned(
            top: 90,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    top: 30,
                  ),
                  child: autoComplete!
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            const Text(
                              'Today',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 30,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(formatedDate,
                                style: const TextStyle(
                                  color: Colors.black54,
                                )),
                            const SizedBox(
                              height: 50,
                            ),
                            SizedBox(
                              height: 100,
                              child: Text(
                                '${provider.data?.temperature ?? 7}°',
                                style: const TextStyle(
                                  fontSize: 100,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 40,
                            ),
                            SizedBox(
                              height: 40,
                              width: 250,
                              child: FittedBox(
                                child: Text(
                                  '${provider.data?.condition ?? 'Sunny'}',
                                  style: const TextStyle(
                                    fontSize: 40,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                )
              ],
            ))
      ],
    );
  }
}
