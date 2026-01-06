import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const _TopHeader(),
                const SizedBox(height: 3),

                // 1.Stacking PNG organs on SVG body
                const Center(
                  child: SizedBox(
                    width: 322,
                    height: 347,
                    child: _BodyWithOrgans(),
                  ),
                ),

                // 2.Heart Rate & SpO2 Card
                const Center(
                  child: _HeartRateCard(),
                ),

                const SizedBox(height: 20),

                // 3.Bottom Controls
                const _BottomControls(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

//Mixes SVG Body with PNG Organs
class _BodyWithOrgans extends StatelessWidget {
  const _BodyWithOrgans();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final double height = constraints.maxHeight;
        final double width = constraints.maxWidth;

        return Stack(
          alignment: Alignment.topCenter,
          children: [
            //Layer 1
            SvgPicture.asset(
              'assets/icons/human.svg', 
              height: height,
              fit: BoxFit.contain,
              colorFilter: const ColorFilter.mode(Color(0xFFE0E0E0), BlendMode.srcIn), 
            ),

            //Layer 2: Brain- Top of Head
            Positioned(
              top: height * 0.01, // Adjust for head position
              child: Image.asset(
                'assets/images/brain (1).png',
                height: height * 0.23, 
                fit: BoxFit.contain,
              ),
            ),

            //Layer 3: Lungs- Chest Area
            Positioned(
              top: height * 0.39, // Adjust for chest position
              child: Image.asset(
                'assets/images/lungs (1).png', 
                height: height * 0.42,
                fit: BoxFit.contain,
              ),
            ),

            // Layer 4: Heart- On top of lungs
            Positioned(
              top: height * 0.51, 
              left: width * 0.45, 
              child: Image.asset(
                'assets/images/heart 3.png',
                height: height * 0.16,
                fit: BoxFit.contain,
              ),
            ),
          ],
        );
      },
    );
  }
}


class _HeartRateCard extends StatelessWidget {
  const _HeartRateCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 365,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: const Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _StatRow(
            title: "Heart Rate",
            beforeValue: "100",
            afterValue: "95",
            unit: "bpm",
            improvement: "5%",
          ),
          SizedBox(height: 15),
          Divider(height: 1, color: Color(0xFFEEEEEE)),
          SizedBox(height: 15),
          _StatRow(
            title: "SpO2",
            beforeValue: "100",
            afterValue: "97",
            unit: "%",
            improvement: "5%",
          ),
        ],
      ),
    );
  }
}

class _StatRow extends StatelessWidget {
  final String title;
  final String beforeValue;
  final String afterValue;
  final String unit;
  final String improvement;

  const _StatRow({
    required this.title,
    required this.beforeValue,
    required this.afterValue,
    required this.unit,
    required this.improvement,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
            ),
            const Spacer(),
            const Icon(Icons.show_chart, color: Colors.grey, size: 20),
            const SizedBox(width: 10),
            const Icon(Icons.info_outline, color: Colors.grey, size: 20),
          ],
        ),
        const SizedBox(height: 15),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Before", style: TextStyle(color: Colors.grey, fontSize: 12)),
                const SizedBox(height: 4),
                RichText(
                  text: TextSpan(
                    style: const TextStyle(color: Colors.black, fontFamily: 'Arial'),
                    children: [
                      TextSpan(
                        text: beforeValue,
                        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      TextSpan(
                        text: " $unit",
                        style: const TextStyle(fontSize: 12, color: Colors.black54),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: BoxDecoration(
                color: Colors.green.withOpacity(0.1),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  const Icon(Icons.arrow_downward, color: Colors.green, size: 14),
                  const SizedBox(width: 4),
                  Text(
                    "$improvement better",
                    style: const TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("After", style: TextStyle(color: Colors.grey, fontSize: 12)),
                const SizedBox(height: 4),
                RichText(
                  text: TextSpan(
                    style: const TextStyle(color: Colors.black, fontFamily: 'Arial'),
                    children: [
                      TextSpan(
                        text: afterValue,
                        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      TextSpan(
                        text: " $unit",
                        style: const TextStyle(fontSize: 12, color: Colors.black54),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}

class _TopHeader extends StatelessWidget {
  const _TopHeader();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Icon(Icons.check_circle, color: Colors.green, size: 20),
            const SizedBox(width: 8),
            Text(
              'Completed',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Colors.green,
                    fontWeight: FontWeight.w600,
                  ),
            ),
            const Spacer(),
            IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(Icons.ios_share),
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(),
            ),
          ],
        ),
        const SizedBox(height: 5),
        Text(
          'You did good!',
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
        ),
        const SizedBox(height: 5),
        Text('05 Jul, 12:30pm', style: Theme.of(context).textTheme.bodyMedium),
      ],
    );
  }
}

class _BottomControls extends StatelessWidget {
  const _BottomControls();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 160,
          height: 40,
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(30),
          ),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly, 
            children: [
              _IconButton(
                assetPath: 'assets/images/bx_brain.png',
                isSelected: false
              ),
              _IconButton(
                assetPath: 'assets/images/ri_heart-pulse-line.png', 
                isSelected: true
              ),
              _IconButton(
                assetPath: 'assets/images/lungs (1).png', 
                isSelected: false
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
        TextButton(
          onPressed: () {},
          child: Text(
            'Skip',
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: Colors.grey.shade700,
                  decoration: TextDecoration.underline,
                ),
          ),
        ),
      ],
    );
  }
}

class _IconButton extends StatelessWidget {
  final String assetPath;
  final bool isSelected;

  const _IconButton({
    required this.assetPath, 
    required this.isSelected
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 30,
      height: 30,
      decoration: isSelected
          ? BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 5,
                  offset: const Offset(0, 2),
                ),
              ],
            )
          : null,
      child: IconButton(
        onPressed: () {},
        padding: EdgeInsets.zero, 
        constraints: const BoxConstraints(), 
        icon: Image.asset(
          assetPath,
          width: 24, 
          height: 24,
          // Only use color if the icon is transparent/black. 
          // If it's a colored PNG, remove this line.
          color: isSelected ? Colors.blue : Colors.grey,
        ),
      ),
    );
  }
}