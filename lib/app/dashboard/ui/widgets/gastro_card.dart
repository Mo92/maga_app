import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:maga_app/app/dashboard/data/models/gastro_model.dart';
import 'package:maga_app/mage_theme.dart';

class GastroCard extends StatelessWidget {
  final GastroModel gastroModel;
  const GastroCard({required this.gastroModel, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 280,
      width: MediaQuery.of(context).size.width * 0.9,
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: CachedNetworkImageProvider(gastroModel.backgroundImageUrl),
        ),
        borderRadius: const BorderRadius.all(Radius.circular(15)),
      ),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: Align(
              alignment: Alignment.topRight,
              child: Column(
                children: [
                  // TODO(Mo): outsource in seperated widget
                  Container(
                    height: 54,
                    width: 80,
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColorLight,
                      borderRadius: BorderRadius.circular(18),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          gastroModel.queue.toString(),
                          style: Theme.of(context).textTheme.info,
                        ),
                        const SizedBox(width: 4),
                        const Icon(Icons.people_outline, size: 28)
                      ],
                    ),
                  ),
                  const SizedBox(height: 12),
                  // TODO(Mo): outsource in seperated widget
                  Container(
                    height: 54,
                    width: 80,
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColorLight,
                      borderRadius: BorderRadius.circular(18),
                    ),
                    child: Center(
                      child: Text(
                        gastroModel.averageWaitingTime.toString(),
                        style: Theme.of(context).textTheme.info,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 70,
              decoration: const BoxDecoration(
                backgroundBlendMode: BlendMode.hardLight,
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(15),
                  bottomLeft: Radius.circular(15),
                ),
                color: Colors.black45,
              ),
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(gastroModel.name,
                              style: Theme.of(context)
                                  .textTheme
                                  .info
                                  .copyWith(color: Colors.white)),
                          Expanded(
                            child: Text(
                              '${gastroModel.street} ${gastroModel.houseNr}, ${gastroModel.postalCode} ${gastroModel.city}',
                              style: const TextStyle(
                                fontSize: 18,
                                color: Colors.white60,
                              ),
                              overflow: TextOverflow.fade,
                            ),
                          )
                        ],
                      ),
                    ),
                    Chip(
                      label: Text(
                        gastroModel.distance,
                        style: const TextStyle(color: Colors.white),
                      ),
                      backgroundColor: Colors.grey,
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
