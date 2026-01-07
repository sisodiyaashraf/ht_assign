import 'package:flutter/material.dart';
import 'second_screen.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const _TopHeader(),
                const SizedBox(height: 5),
                Center(
                  child: SizedBox(
                    width: 322,
                    height: 347,
                    child: Image.asset(
                      'assets/images/Frame 427319209.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                const Center(child: _StressLevelCard()),

                const SizedBox(height: 20),
                const _BottomControls(),
              ],
            ),
          ),
        ),
      ),
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
              onPressed: () {},
              icon: const Icon(Icons.ios_share),
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(),
            ),
          ],
        ),
        const SizedBox(height: 10),
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

class _StressLevelCard extends StatelessWidget {
  const _StressLevelCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 365,
      height: 194,
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Text(
                'Stress Level',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              const Spacer(),
              const Icon(Icons.show_chart, color: Colors.grey),
              const SizedBox(width: 10),
              const Icon(Icons.info_outline, color: Colors.grey),
            ],
          ),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Relaxation Index',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: 4),
              Row(
                children: [
                  Text(
                    '100 %',
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Spacer(),
                  const Text(
                    "You're Stressed",
                    style: TextStyle(
                      color: Color(0xFFE57373),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),

          const _CustomProgressBar(),
        ],
      ),
    );
  }
}

class _CustomProgressBar extends StatelessWidget {
  const _CustomProgressBar();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 297,
          height: 39,
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(2.5),
                ),
              ),
              FractionallySizedBox(
                widthFactor: 0.3,
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color(0xFFE57373),
                    borderRadius: BorderRadius.circular(2.5),
                  ),
                ),
              ),
              const _ProgressBarMarker(leftFraction: 0.3),
              const _ProgressBarMarker(leftFraction: 0.75),
            ],
          ),
        ),
        const SizedBox(height: 5),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 4.0),
          child: Row(
            children: [
              Spacer(flex: 30),
              Text('30%', style: TextStyle(color: Colors.grey, fontSize: 10)),
              Spacer(flex: 45),
              Text('75%', style: TextStyle(color: Colors.grey, fontSize: 10)),
              Spacer(flex: 25),
            ],
          ),
        ),
      ],
    );
  }
}

class _ProgressBarMarker extends StatelessWidget {
  final double leftFraction;

  const _ProgressBarMarker({required this.leftFraction});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment(leftFraction * 2 - 1, 0),
      child: Container(
        height: 45,
        width: 3,
        color: Colors.grey.shade500,
        child: Center(
          child: Container(height: 45, width: 1, color: Colors.grey.shade200),
        ),
      ),
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
                isSelected: false,
              ),
              _IconButton(
                assetPath: 'assets/images/ri_heart-pulse-line.png',
                isSelected: true,
              ),
              _IconButton(
                assetPath: 'assets/images/lungs (1).png',
                isSelected: false,
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
        TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const SecondScreen()),
            );
          },
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

  const _IconButton({required this.assetPath, required this.isSelected});

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
          color: isSelected ? Colors.blue : Colors.grey,
        ),
      ),
    );
  }
}
