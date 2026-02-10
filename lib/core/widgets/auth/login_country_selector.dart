import 'package:flutter/material.dart';

class LoginCountrySelector extends StatefulWidget {
  final List<String> countries;
  final ValueChanged<String> onSelected;
  String? selectedCountry;

  LoginCountrySelector({
    super.key,
    required this.countries,
    required this.onSelected,
  });

  @override
  State<LoginCountrySelector> createState() => _LoginCountrySelectorState();
}

class _LoginCountrySelectorState extends State<LoginCountrySelector> {
  String? selectedCountry;
  OverlayEntry? overlayEntry;
  final GlobalKey _key = GlobalKey();

  void _showMenu() {
    final RenderBox box = _key.currentContext!.findRenderObject() as RenderBox;
    // ignore: unused_local_variable
    final Offset position = box.localToGlobal(Offset.zero);

    overlayEntry?.remove();
    overlayEntry = OverlayEntry(
      builder: (_) => Positioned(
        top: 30,
        right: 0,
        width: 160,
        height: 700,
        child: Material(
          elevation: 6,
          borderRadius: BorderRadius.circular(8),
          color: const Color(0xff7c9a7e),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxHeight: 250),
            child: ListView(
              padding: const EdgeInsets.symmetric(vertical: 8),
              children: widget.countries.map((country) {
                return InkWell(
                  onTap: () {
                    setState(() => selectedCountry = country);
                    widget.onSelected(country);
                    overlayEntry?.remove();
                    overlayEntry = null;
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Text(
                      country,
                      textAlign: TextAlign.right,
                      style: const TextStyle(fontSize: 18),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ),
      ),
    );

    Overlay.of(context).insert(overlayEntry!);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _showMenu,
      child: Container(
        key: _key,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            Expanded(
              child: Text(
                selectedCountry ?? 'Select your country',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const Icon(Icons.arrow_drop_down, size: 35, color: Colors.green),
          ],
        ),
      ),
    );
  }
}
