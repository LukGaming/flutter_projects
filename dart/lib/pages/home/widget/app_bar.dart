import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(120); // Define a altura desejada da barra de aplicativos

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 120,
      title: Column(
        children: [
          const Text(
            'Chuva 💜 Flutter',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
          ),
          const Text(
            'Programação',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w400, fontSize: 20),
          ),
          Container(
            width: MediaQuery.of(context).size.width, // Usa MediaQuery.of(context).size para obter a largura da tela
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            color: const Color(0XFF456189),
            child: Container(
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Colors.white,
              ),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: const Color(0XFF306dc3),
                    ),
                    child: const Icon(Icons.calendar_month_outlined),
                  ),
                  const Expanded(
                    child: Text(
                      'Exibindo todas as atividades',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
      centerTitle: true,
    );
  }
}
