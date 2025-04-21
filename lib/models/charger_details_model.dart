import 'package:ev_charging_app/core/color_constants.dart';
import 'package:flutter/material.dart';

class ChargerModel {
  final String chargerID;
  final String imageUrl;
  final String fullImage;
  final String title;
  final String address;
  final String distance;
  final String price;
  final String type;
  final String status;
  final Color statusColor;
  final String avability;
  final String chargingPercentage;
  final double cost;
  final String chargingKwh;
  final String chargingTime;

  ChargerModel( {
    required this.chargerID,
    required this.imageUrl,
    required this.fullImage,
    required this.title,
    required this.address,
    required this.distance,
    required this.price,
    required this.type,
    required this.status,
    required this.statusColor,
    required this.avability,
    required this.chargingPercentage,
    required this.cost,
    required this.chargingKwh,
    required this.chargingTime
  });
}


final List<ChargerModel> chargers = [
  ChargerModel(
    chargerID:'ChargerID-001',
      imageUrl: 'lib/assets/chargers_image_first.png',
      fullImage: 'lib/assets/charger_detail_image.png',
      title: 'Hôtel de Ville',
      address: 'Pl. de l\'Hôtel de Ville, Paris',
      distance: '1.4 km',
      price: '€ 28.00/hour',
      type: 'Type 2 · 30kW',
      status: 'Charging',
      statusColor: AppColorConstants.warning600,
    avability: 'Open • 24 hours',
      chargingPercentage:'00%',
    cost:00.00,
      chargingKwh:"00.00",
      chargingTime:"0h 0m",
  ),

  ChargerModel(
      chargerID:'ChargerID-001',
      imageUrl: 'lib/assets/chargers_image_sec.png',
      fullImage: 'lib/assets/charger_detail_image.png',
      title: 'Ober Mamma',
      address: '107 Bd Richard-Lenoir, Paris',
      distance: '1.4 km',
      price: '€ 26.00/hour',
      type: 'Type 2 · 30kW',
      status: 'Available',
      statusColor:AppColorConstants.success600,
      avability: 'Open • 24 hours',
      chargingPercentage:'00%',
      cost:00.00,
      chargingKwh:"00.00",
      chargingTime:"0h 0m"
  ),

  ChargerModel(
      chargerID:'ChargerID-001',
      imageUrl: 'lib/assets/chargers_image_sec.png',
      fullImage: 'lib/assets/charger_detail_image.png',
      title: 'Bella Costimao',
      address: 'Forte dei Marmi, Tuscany',
      distance: '1.4 km',
      price: '€ 26.00/hour',
      type: 'Type 2 · 30kW',
      status: 'Available',
      statusColor:AppColorConstants.success600,
      avability: 'Open • 24 hours',
      chargingPercentage:'52%',
      cost:12.48,
      chargingKwh:"08.12",
      chargingTime:"0h 26m 24s"
  ),
];
