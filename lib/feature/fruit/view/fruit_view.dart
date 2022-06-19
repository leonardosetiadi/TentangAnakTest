import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../store/fruit_store.dart';

class FruitView extends StatefulWidget {
  const FruitView({Key? key}) : super(key: key);

  static const String routeName = 'fruit-view';

  @override
  _FruitViewState createState() => _FruitViewState();
}

class _FruitViewState extends State<FruitView> {
  showHighestFruitQuantityDialog(BuildContext context) {
    AlertDialog alert = AlertDialog(
      title: const Text('Highest Fruit Quantity'),
      content: Consumer<FruitStore>(
        builder: (context, fruitStore, _) {
          return Text(fruitStore.getFruitWithHighestQuantity());
        },
      ),
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          _fruitListView(),
          _fruitImage(),
          _checkQuantityButton(),
        ],
      ),
    );
  }

  Widget _fruitListView() {
    return Consumer<FruitStore>(
      builder: (context, fruitStore, _) {
        if (fruitStore.isLoading) {
          return const Center(child: CircularProgressIndicator());
        } else {
          if (fruitStore.errorMessage != null) {
            return Text(fruitStore.errorMessage!);
          } else {
            return ListView.builder(
              shrinkWrap: true,
              itemCount: fruitStore.filteredFruitModelList.length,
              itemBuilder: (context, position) {
                return GestureDetector(
                  onTap: () {
                    fruitStore.changeFruitImage(
                      fruitStore.getFruitName(position),
                    );
                  },
                  child: Container(
                    color: Colors.blueAccent,
                    margin: const EdgeInsets.only(bottom: 4),
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          fruitStore.getFruitName(position),
                          style: const TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          'Total Rp. ${fruitStore.getFruitPrice(position)}',
                          style: const TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          }
        }
      },
    );
  }

  Widget _fruitImage() {
    return Consumer<FruitStore>(
      builder: (context, fruitStore, _) {
        if (fruitStore.isLoading) {
          return const Center(child: CircularProgressIndicator());
        } else {
          if (fruitStore.errorMessage != null) {
            return Text(fruitStore.errorMessage!);
          } else {
            return SizedBox(
              height: 100,
              width: 100,
              child: Image.network(
                fruitStore.fruitImage,
                errorBuilder: (context, exception, stackTrace) {
                  return const Center(
                    child: Text(
                      'No Image Available',
                      textAlign: TextAlign.center,
                    ),
                  );
                },
                loadingBuilder: (context, widget, loadingProgress) {
                  if (loadingProgress != null) {
                    return const CircularProgressIndicator();
                  } else {
                    return widget;
                  }
                },
              ),
            );
          }
        }
      },
    );
  }

  Widget _checkQuantityButton() {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 8,
      ),
      color: Colors.blueAccent,
      child: MaterialButton(
        onPressed: () => showHighestFruitQuantityDialog(context),
        textColor: Colors.white,
        child: const Center(
          child: Text(
            'Check Quantity',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
