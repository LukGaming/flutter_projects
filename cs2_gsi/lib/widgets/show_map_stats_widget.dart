import 'package:cs2_gsi/models/map_data.dart';
import 'package:cs2_gsi/models/player_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ShowMapStatsWidget extends StatelessWidget {
  final CurrentMapData mapData;
  const ShowMapStatsWidget({super.key, required this.mapData});

  @override
  Widget build(BuildContext context) {
    print("nome do bot: ${mapData.trPlayers.first.name}");
    print("x: ${mapData.trPlayers.first.position.x}");
    print("y: ${mapData.trPlayers.first.position.y}");
    print("tamanho do mapa: ${MediaQuery.of(context).size.width}");

    final getMapSize = mapSize(
      width: MediaQuery.of(context).size.width,
      height: 600,
    );

    Offset playerPosition = convertGameToWidgetCoordinates(
      mapSize: getMapSize,
      playerPosition: PlayerPosition(
        x: mapData.trPlayers.first.position.x,
        y: mapData.trPlayers.first.position.y,
        z: mapData.trPlayers.first.position.z,
      ),
    );

    Offset secondPlayerPosition = convertGameToWidgetCoordinates(
      mapSize: getMapSize,
      playerPosition: PlayerPosition(
        x: mapData.ctPlayers.first.position.x,
        y: mapData.ctPlayers.first.position.y,
        z: mapData.ctPlayers.first.position.z,
      ),
    );

    print(secondPlayerPosition.dx);

    print(secondPlayerPosition.dy);

    return SizedBox(
      width: getMapSize.width,
      height: getMapSize.height,
      child: Stack(
        children: [
          Container(
            color: Colors.red,
            child: Image.asset('assets/images/dust2.webp'),
          ),
          Positioned(
            left: playerPosition.dx,
            top: playerPosition.dy,
            child: PlayerRoundedWidget(
              playerData: mapData.trPlayers.first,
            ),
          ),
          Positioned(
            left: secondPlayerPosition.dx,
            top: secondPlayerPosition.dy,
            child: PlayerRoundedWidget(
              playerData: mapData.ctPlayers.first,
            ),
          ),
        ],
      ),
    );
  }
}

class PlayerRoundedWidget extends StatelessWidget {
  final PlayerData playerData;
  const PlayerRoundedWidget({super.key, required this.playerData});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 0),
      width: 20,
      height: 20,
      decoration: const BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.all(Radius.circular(30)),
      ),
      child: const Center(child: Text('1')),
    );
  }
}

const double mapGameMinX = -2215;
const double mapGameMaxX = 2000;
const double mapGameMinY = 2000;
const double mapGameMaxY = -1056;

// Função para converter coordenadas do jogo para coordenadas do widget
Offset convertGameToWidgetCoordinates({
  required PlayerPosition playerPosition,
  required Size mapSize,
}) {
  if (playerPosition.x < 0) {
    print("Posição x menor que zero: ${playerPosition.x}");
  }
  if (playerPosition.y < 0) {
    print("Posição y menor que zero: ${playerPosition.y}");
  }

  double widgetX =
      ((playerPosition.x - mapGameMinX) / (mapGameMaxX - mapGameMinX)) *
          mapSize.width;
  double widgetY =
      ((playerPosition.y - mapGameMinY) / (mapGameMaxY - mapGameMinY)) *
          mapSize.height;
  return Offset(widgetX, widgetY);
}

Size mapSize({required double width, required double height}) {
  return Size(width, height);
}
