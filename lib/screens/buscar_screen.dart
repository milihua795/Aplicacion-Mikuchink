// lib/screens/buscar_screen.dart

import 'package:flutter/material.dart';
import '../utils/image_urls.dart';

class BuscarScreen extends StatefulWidget {
  const BuscarScreen({super.key});
  @override
  BuscarScreenState createState() => BuscarScreenState();
}

class BuscarScreenState extends State<BuscarScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0xFFF2A71A),
        title: const Text("Buscar Recetas"),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextField(
                decoration: InputDecoration(
                  hintText: "Busca tu receta aquí",
                  prefixIcon: const Icon(Icons.search),
                  filled: true,
                  fillColor: Colors.grey[200],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 24),
              GridView.count(
                crossAxisCount: 4,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                children: [
                  _buildCategoryItem("Desayuno", AppImageUrls.desayunoIcon),
                  _buildCategoryItem("Snack", AppImageUrls.snackIcon),
                  _buildCategoryItem("Almuerzo", AppImageUrls.almuerzoIcon),
                  _buildCategoryItem("Cena", AppImageUrls.cenaIcon),
                  _buildCategoryItem("Refrigerios", AppImageUrls.refrigeriosIcon),
                  _buildCategoryItem("Postres", AppImageUrls.postresIcon),
                  _buildCategoryItem("Bebidas", AppImageUrls.bebidasIcon),
                  _buildCategoryItem("Ver más...", AppImageUrls.verMasIcon),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryItem(String title, String imageUrl) {
    return InkWell(
      onTap: () {},
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(imageUrl, height: 40),
            const SizedBox(height: 8),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}