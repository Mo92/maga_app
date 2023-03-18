import 'package:flutter/material.dart';
import 'package:maga_app/app/dashboard/data/gastro_model.dart';
import 'package:maga_app/app/shared/ui/default_page.dart';

final data = [
  GastroModel(
    name: 'Cafe Corner',
    street: 'Grafenstr.',
    houseNr: '33',
    postalCode: 64295,
    city: 'Darmstadt',
    distance: '0.8 km',
    queue: 4,
    averageWaitingTime: '3 - 5 \n min',
    backgroundImageUrl:
        'https://www.p-stadtkultur.de/wp-content/uploads/2014/09/cafes.jpg',
  ),
  GastroModel(
    name: 'Grizzly Bar / Lounge',
    street: 'Elisabethenstraße',
    houseNr: '32a',
    postalCode: 64295,
    city: 'Darmstadt',
    distance: '1.2 km',
    queue: 0,
    averageWaitingTime: '5 - 15 \n min',
    backgroundImageUrl:
        'https://media-cdn.tripadvisor.com/media/photo-s/10/e5/73/92/photo1jpg.jpg',
  )
];

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultPage(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 8),
        child: Center(
            child: ListView.builder(
          itemCount: data.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: GastroCard(
                gastroModel: data[index],
              ),
            );
          },
        )),
      ),
    );
  }
}

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
          image: NetworkImage(gastroModel.backgroundImageUrl),
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(15),
        ),
      ),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: Align(
              alignment: Alignment.topRight,
              child: Column(
                children: [
                  Container(
                    height: 54,
                    width: 80,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(18),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          gastroModel.queue.toString(),
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(width: 4),
                        const Icon(Icons.people_outline, size: 28)
                      ],
                    ),
                  ),
                  const SizedBox(height: 12),
                  Container(
                    height: 54,
                    width: 80,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(18),
                    ),
                    child: Center(
                      child: Text(
                        gastroModel.averageWaitingTime.toString(),
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
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
                          Text(
                            gastroModel.name,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
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
