import 'package:flutter/material.dart';

void main() {
  runApp(const DisasterGuardApp());
}

class DisasterGuardApp extends StatelessWidget {
  const DisasterGuardApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'DisasterGuard',
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.blue,
        scaffoldBackgroundColor: const Color(0xFFF5F7FA),
      ),
      home: const HomeScreen(),
    );
  }
}

// =====================================================
// SOS DATA
// =====================================================

class SOSRequest {
  final String name;
  final int people;
  final String emergency;
  final String priority;

  SOSRequest({
    required this.name,
    required this.people,
    required this.emergency,
    required this.priority,
  });
}

final List<SOSRequest> sosRequests = [];

// =====================================================
// HOME SCREEN
// =====================================================

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'DisasterGuard',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Your Safety, Our Priority',
              style: TextStyle(
                fontSize: 27,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 6),
            const Text(
              'Predict • Warn • Guide • SOS • Rescue',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),

            const SizedBox(height: 20),

            // CURRENT RISK
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.orange.shade50,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: Colors.orange.shade200,
                ),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.warning_rounded,
                    size: 48,
                    color: Colors.orange.shade800,
                  ),
                  const SizedBox(width: 15),
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'CURRENT AREA RISK',
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          'HIGH RISK',
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.deepOrange,
                          ),
                        ),
                        Text(
                          'Stay alert and follow safety instructions.',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 22),

            const Text(
              'Quick Actions',
              style: TextStyle(
                fontSize: 21,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 12),

            // ROW 1
            Row(
              children: [
                Expanded(
                  child: actionCard(
                    context,
                    Icons.sensors,
                    'Live Alert\nMonitor',
                    Colors.red,
                    const AlertMonitorScreen(),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: actionCard(
                    context,
                    Icons.cloud,
                    'Risk\nPrediction',
                    Colors.orange,
                    const RiskScreen(),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 12),

            // ROW 2
            Row(
              children: [
                Expanded(
                  child: actionCard(
                    context,
                    Icons.map,
                    'Safe\nZones',
                    Colors.green,
                    const SafeZoneScreen(),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: actionCard(
                    context,
                    Icons.sos,
                    'Emergency\nSOS',
                    Colors.red,
                    const SOSScreen(),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 12),

            // ROW 3
            Row(
              children: [
                Expanded(
                  child: actionCard(
                    context,
                    Icons.local_hospital,
                    'Rescue\nDashboard',
                    Colors.blue,
                    const RescueScreen(),
                  ),
                ),
                const SizedBox(width: 12),
                const Expanded(
                  child: SizedBox(),
                ),
              ],
            ),

            const SizedBox(height: 25),

            // CLOSE THE LOOP
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: Colors.blue.shade50,
                borderRadius: BorderRadius.circular(18),
              ),
              child: const Column(
                children: [
                  Icon(
                    Icons.shield,
                    size: 45,
                    color: Colors.blue,
                  ),
                  SizedBox(height: 8),
                  Text(
                    'CLOSE THE LOOP',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Predict → Warn → Guide → SOS → Prioritize → Rescue',
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget actionCard(
    BuildContext context,
    IconData icon,
    String title,
    Color color,
    Widget screen,
  ) {
    return InkWell(
      borderRadius: BorderRadius.circular(18),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => screen,
          ),
        );
      },
      child: Container(
        height: 130,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              blurRadius: 8,
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 40,
              color: color,
            ),
            const SizedBox(height: 10),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// =====================================================
// LIVE DISASTER ALERT MONITOR
// =====================================================

class AlertMonitorScreen extends StatefulWidget {
  const AlertMonitorScreen({super.key});

  @override
  State<AlertMonitorScreen> createState() =>
      _AlertMonitorScreenState();
}

class _AlertMonitorScreenState extends State<AlertMonitorScreen> {
  bool monitoring = false;

  int rainfall = 35;
  int waterLevel = 30;
  int windSpeed = 25;

  String status = 'NORMAL';
  Color statusColor = Colors.green;

  void startMonitoring() {
    setState(() {
      monitoring = true;

      rainfall = 82;
      waterLevel = 76;
      windSpeed = 68;

      status = 'HIGH RISK';
      statusColor = Colors.deepOrange;
    });
  }

  void simulateCritical() {
    setState(() {
      monitoring = true;

      rainfall = 95;
      waterLevel = 92;
      windSpeed = 88;

      status = 'CRITICAL';
      statusColor = Colors.red;
    });
  }

  void resetMonitoring() {
    setState(() {
      monitoring = false;

      rainfall = 35;
      waterLevel = 30;
      windSpeed = 25;

      status = 'NORMAL';
      statusColor = Colors.green;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Disaster Alert Monitor'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'LIVE DISASTER MONITOR',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 6),

            const Text(
              'Monitor environmental conditions and generate early warnings.',
              style: TextStyle(color: Colors.grey),
            ),

            const SizedBox(height: 20),

            // STATUS
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(22),
              decoration: BoxDecoration(
                color: statusColor.withOpacity(0.10),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: statusColor,
                  width: 2,
                ),
              ),
              child: Column(
                children: [
                  Icon(
                    monitoring
                        ? Icons.warning_rounded
                        : Icons.shield,
                    size: 60,
                    color: statusColor,
                  ),

                  const SizedBox(height: 10),

                  const Text(
                    'CURRENT STATUS',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 5),

                  Text(
                    status,
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: statusColor,
                    ),
                  ),

                  const SizedBox(height: 8),

                  Text(
                    monitoring
                        ? 'Abnormal environmental conditions detected.'
                        : 'Monitoring has not started.',
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),

            const SizedBox(height: 25),

            const Text(
              'Environmental Signals',
              style: TextStyle(
                fontSize: 21,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 12),

            signalCard(
              Icons.water_drop,
              'Rainfall',
              '$rainfall%',
              rainfall,
              Colors.blue,
            ),

            signalCard(
              Icons.waves,
              'Water Level',
              '$waterLevel%',
              waterLevel,
              Colors.indigo,
            ),

            signalCard(
              Icons.air,
              'Wind Speed',
              '$windSpeed%',
              windSpeed,
              Colors.teal,
            ),

            const SizedBox(height: 20),

            // START MONITORING
            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton.icon(
                onPressed: startMonitoring,
                icon: const Icon(Icons.sensors),
                label: const Text(
                  'START LIVE MONITORING',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),

            const SizedBox(height: 12),

            // CRITICAL
            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton.icon(
                onPressed: simulateCritical,
                icon: const Icon(Icons.emergency),
                label: const Text(
                  'SIMULATE CRITICAL ALERT',
                  style: TextStyle(fontSize: 16),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.white,
                ),
              ),
            ),

            const SizedBox(height: 12),

            // RESET
            SizedBox(
              width: double.infinity,
              height: 50,
              child: OutlinedButton.icon(
                onPressed: resetMonitoring,
                icon: const Icon(Icons.refresh),
                label: const Text('RESET MONITORING'),
              ),
            ),

            const SizedBox(height: 25),

            if (monitoring)
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(18),
                decoration: BoxDecoration(
                  color: statusColor.withOpacity(0.08),
                  borderRadius: BorderRadius.circular(18),
                ),
                child: Column(
                  children: [
                    Icon(
                      Icons.notifications_active,
                      color: statusColor,
                      size: 42,
                    ),

                    const SizedBox(height: 8),

                    Text(
                      status == 'CRITICAL'
                          ? 'CRITICAL ALERT GENERATED'
                          : 'EARLY WARNING GENERATED',
                      style: TextStyle(
                        color: statusColor,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 8),

                    Text(
                      status == 'CRITICAL'
                          ? 'Immediate evacuation and rescue prioritization recommended.'
                          : 'Risk is increasing. Residents should stay alert and prepare for evacuation.',
                      textAlign: TextAlign.center,
                    ),

                    const SizedBox(height: 15),

                    Row(
                      children: [
                        Expanded(
                          child: OutlinedButton.icon(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) =>
                                      const SafeZoneScreen(),
                                ),
                              );
                            },
                            icon: const Icon(Icons.map),
                            label: const Text('SAFE ZONE'),
                          ),
                        ),

                        const SizedBox(width: 10),

                        Expanded(
                          child: ElevatedButton.icon(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) =>
                                      const SOSScreen(),
                                ),
                              );
                            },
                            icon: const Icon(Icons.sos),
                            label: const Text('SOS'),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.red,
                              foregroundColor: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget signalCard(
    IconData icon,
    String title,
    String value,
    int percentage,
    Color color,
  ) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            Row(
              children: [
                Icon(
                  icon,
                  color: color,
                  size: 30,
                ),

                const SizedBox(width: 12),

                Expanded(
                  child: Text(
                    title,
                    style: const TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                Text(
                  value,
                  style: TextStyle(
                    color: color,
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 10),

            LinearProgressIndicator(
              value: percentage / 100,
              minHeight: 8,
            ),
          ],
        ),
      ),
    );
  }
}

// =====================================================
// RISK PREDICTION
// =====================================================

class RiskScreen extends StatefulWidget {
  const RiskScreen({super.key});

  @override
  State<RiskScreen> createState() => _RiskScreenState();
}

class _RiskScreenState extends State<RiskScreen> {
  double rainfall = 50;
  double waterLevel = 40;
  double windSpeed = 30;

  String risk = 'MEDIUM';
  Color riskColor = Colors.orange;

  void calculateRisk() {
    final score = (rainfall + waterLevel + windSpeed) / 3;

    setState(() {
      if (score >= 75) {
        risk = 'CRITICAL';
        riskColor = Colors.red;
      } else if (score >= 55) {
        risk = 'HIGH';
        riskColor = Colors.deepOrange;
      } else if (score >= 35) {
        risk = 'MEDIUM';
        riskColor = Colors.orange;
      } else {
        risk = 'SAFE';
        riskColor = Colors.green;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final bool danger =
        risk == 'HIGH' || risk == 'CRITICAL';

    return Scaffold(
      appBar: AppBar(
        title: const Text('Risk Prediction'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Environmental Conditions',
              style: TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 8),

            const Text(
              'Adjust the conditions to estimate disaster risk.',
              style: TextStyle(color: Colors.grey),
            ),

            const SizedBox(height: 20),

            buildSlider(
              'Rainfall',
              rainfall,
              Icons.water_drop,
              (value) {
                setState(() {
                  rainfall = value;
                });
              },
            ),

            buildSlider(
              'Water Level',
              waterLevel,
              Icons.waves,
              (value) {
                setState(() {
                  waterLevel = value;
                });
              },
            ),

            buildSlider(
              'Wind Speed',
              windSpeed,
              Icons.air,
              (value) {
                setState(() {
                  windSpeed = value;
                });
              },
            ),

            const SizedBox(height: 15),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: calculateRisk,
                icon: const Icon(Icons.analytics),
                label: const Padding(
                  padding: EdgeInsets.all(15),
                  child: Text(
                    'CALCULATE RISK',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 25),

            // RESULT
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(25),
              decoration: BoxDecoration(
                color: riskColor.withOpacity(0.12),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: riskColor,
                  width: 2,
                ),
              ),
              child: Column(
                children: [
                  Icon(
                    risk == 'SAFE'
                        ? Icons.check_circle
                        : Icons.warning_rounded,
                    size: 55,
                    color: riskColor,
                  ),

                  const SizedBox(height: 10),

                  const Text(
                    'CALCULATED RISK',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 5),

                  Text(
                    risk,
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: riskColor,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 18),

            if (danger)
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(18),
                decoration: BoxDecoration(
                  color: Colors.red.shade50,
                  borderRadius: BorderRadius.circular(18),
                  border: Border.all(
                    color: Colors.red.shade300,
                    width: 2,
                  ),
                ),
                child: Column(
                  children: [
                    const Icon(
                      Icons.emergency,
                      color: Colors.red,
                      size: 45,
                    ),

                    const SizedBox(height: 8),

                    Text(
                      risk == 'CRITICAL'
                          ? 'CRITICAL DISASTER RISK'
                          : 'HIGH DISASTER RISK',
                      style: const TextStyle(
                        color: Colors.red,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 8),

                    const Text(
                      'Immediate action is recommended. '
                      'Move towards a safe location or request emergency help.',
                      textAlign: TextAlign.center,
                    ),

                    const SizedBox(height: 15),

                    Row(
                      children: [
                        Expanded(
                          child: OutlinedButton.icon(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) =>
                                      const SafeZoneScreen(),
                                ),
                              );
                            },
                            icon: const Icon(Icons.map),
                            label: const Text('SAFE ZONE'),
                          ),
                        ),

                        const SizedBox(width: 10),

                        Expanded(
                          child: ElevatedButton.icon(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) =>
                                      const SOSScreen(),
                                ),
                              );
                            },
                            icon: const Icon(Icons.sos),
                            label: const Text('SOS'),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.red,
                              foregroundColor: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

            if (!danger)
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: riskColor.withOpacity(0.08),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  children: [
                    Icon(
                      risk == 'SAFE'
                          ? Icons.check_circle
                          : Icons.info,
                      color: riskColor,
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        risk == 'SAFE'
                            ? 'Conditions are currently safe. Continue monitoring.'
                            : 'Stay alert and monitor the conditions.',
                      ),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget buildSlider(
    String title,
    double value,
    IconData icon,
    ValueChanged<double> onChanged,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(
              icon,
              color: Colors.blue,
            ),
            const SizedBox(width: 8),
            Text(
              '$title: ${value.toInt()}',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),

        Slider(
          value: value,
          min: 0,
          max: 100,
          divisions: 20,
          onChanged: onChanged,
        ),

        const SizedBox(height: 10),
      ],
    );
  }
}

// =====================================================
// SAFE ZONES
// =====================================================

class SafeZoneScreen extends StatelessWidget {
  const SafeZoneScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Disaster Safety Map',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text(
            'Nearby Safety Locations',
            style: TextStyle(
              fontSize: 23,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 6),

          const Text(
            'Choose the nearest safe location during an emergency.',
            style: TextStyle(color: Colors.grey),
          ),

          const SizedBox(height: 18),

          // SAFETY STATUS
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.red.shade50,
              borderRadius: BorderRadius.circular(18),
              border: Border.all(
                color: Colors.red.shade200,
              ),
            ),
            child: const Row(
              children: [
                Icon(
                  Icons.warning_rounded,
                  color: Colors.red,
                  size: 38,
                ),
                SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment:
                        CrossAxisAlignment.start,
                    children: [
                      Text(
                        'HIGH RISK AREA',
                        style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        'Move towards the nearest safe zone.',
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 18),

          // MAP
          Container(
            height: 250,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.blue.shade50,
              border: Border.all(
                color: Colors.blue.shade200,
                width: 2,
              ),
            ),
            child: Stack(
              children: [
                Positioned(
                  top: 105,
                  left: 0,
                  right: 0,
                  child: Container(
                    height: 18,
                    color: Colors.white,
                  ),
                ),

                Positioned(
                  left: 105,
                  top: 0,
                  bottom: 0,
                  child: Container(
                    width: 18,
                    color: Colors.white,
                  ),
                ),

                // DANGER ZONE
                Positioned(
                  top: 20,
                  right: 20,
                  child: Container(
                    width: 95,
                    height: 75,
                    decoration: BoxDecoration(
                      color: Colors.red.withOpacity(0.25),
                      shape: BoxShape.circle,
                    ),
                    child: const Center(
                      child: Text(
                        'DANGER\nZONE',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),

                // USER
                const Positioned(
                  left: 78,
                  top: 175,
                  child: Column(
                    children: [
                      Icon(
                        Icons.person_pin_circle,
                        color: Colors.blue,
                        size: 42,
                      ),
                      Text(
                        'YOU',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),

                // SHELTER
                const Positioned(
                  right: 45,
                  bottom: 35,
                  child: Column(
                    children: [
                      Icon(
                        Icons.home,
                        color: Colors.green,
                        size: 38,
                      ),
                      Text(
                        'SHELTER',
                        style: TextStyle(
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                          fontSize: 11,
                        ),
                      ),
                    ],
                  ),
                ),

                // HOSPITAL
                const Positioned(
                  left: 35,
                  top: 30,
                  child: Column(
                    children: [
                      Icon(
                        Icons.local_hospital,
                        color: Colors.red,
                        size: 38,
                      ),
                      Text(
                        'HOSPITAL',
                        style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                          fontSize: 11,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 20),

          const Text(
            'Recommended Safe Locations',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 12),

          locationCard(
            Icons.home,
            'Community Shelter',
            '2.1 km • Safe',
            Colors.green,
          ),

          locationCard(
            Icons.local_hospital,
            'Government Hospital',
            '3.4 km • Emergency Support',
            Colors.red,
          ),

          locationCard(
            Icons.school,
            'Emergency Relief Center',
            '1.8 km • Safe',
            Colors.blue,
          ),

          const SizedBox(height: 15),

          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.green.shade50,
              borderRadius: BorderRadius.circular(16),
            ),
            child: const Row(
              children: [
                Icon(
                  Icons.route,
                  color: Colors.green,
                  size: 35,
                ),
                SizedBox(width: 12),
                Expanded(
                  child: Text(
                    'The safest nearby location is recommended based on distance and safety status.',
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget locationCard(
    IconData icon,
    String title,
    String distance,
    Color color,
  ) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        contentPadding: const EdgeInsets.all(12),
        leading: CircleAvatar(
          radius: 25,
          backgroundColor: color.withOpacity(0.12),
          child: Icon(
            icon,
            color: color,
          ),
        ),
        title: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(distance),
        trailing: ElevatedButton(
          onPressed: () {},
          child: const Text('GO'),
        ),
      ),
    );
  }
}

// =====================================================
// SOS SCREEN
// =====================================================

class SOSScreen extends StatefulWidget {
  const SOSScreen({super.key});

  @override
  State<SOSScreen> createState() => _SOSScreenState();
}

class _SOSScreenState extends State<SOSScreen> {
  final nameController = TextEditingController();
  final peopleController = TextEditingController();

  String emergency = 'Medical Emergency';

  void sendSOS() {
    final name = nameController.text.trim();

    final int people =
        int.tryParse(peopleController.text.trim()) ?? 1;

    if (name.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter your name'),
        ),
      );
      return;
    }

    String priority;

    if (emergency == 'Medical Emergency' || people >= 5) {
      priority = 'CRITICAL';
    } else if (people >= 3 || emergency == 'Trapped') {
      priority = 'HIGH';
    } else {
      priority = 'MEDIUM';
    }

    sosRequests.add(
      SOSRequest(
        name: name,
        people: people,
        emergency: emergency,
        priority: priority,
      ),
    );

    showDialog(
      context: context,
      builder: (dialogContext) {
        return AlertDialog(
          title: const Text('SOS Sent 🚨'),
          content: Text(
            'Emergency request sent successfully.\n\n'
            'Priority: $priority',
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(dialogContext);
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    nameController.dispose();
    peopleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Emergency SOS'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const Icon(
              Icons.sos,
              size: 80,
              color: Colors.red,
            ),

            const SizedBox(height: 10),

            const Text(
              'SEND EMERGENCY REQUEST',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 25),

            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                labelText: 'Your Name',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.person),
              ),
            ),

            const SizedBox(height: 15),

            TextField(
              controller: peopleController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Number of People',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.people),
              ),
            ),

            const SizedBox(height: 15),

            DropdownButtonFormField<String>(
              value: emergency,
              decoration: const InputDecoration(
                labelText: 'Emergency Type',
                border: OutlineInputBorder(),
              ),
              items: const [
                DropdownMenuItem(
                  value: 'Medical Emergency',
                  child: Text('Medical Emergency'),
                ),
                DropdownMenuItem(
                  value: 'Trapped',
                  child: Text('Trapped'),
                ),
                DropdownMenuItem(
                  value: 'Flood',
                  child: Text('Flood'),
                ),
                DropdownMenuItem(
                  value: 'Other',
                  child: Text('Other'),
                ),
              ],
              onChanged: (value) {
                if (value != null) {
                  setState(() {
                    emergency = value;
                  });
                }
              },
            ),

            const SizedBox(height: 15),

            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.blue.shade50,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Row(
                children: [
                  Icon(
                    Icons.location_on,
                    color: Colors.blue,
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      'Current location will be shared with rescue teams.',
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 25),

            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton.icon(
                onPressed: sendSOS,
                icon: const Icon(Icons.sos),
                label: const Text(
                  'SEND SOS',
                  style: TextStyle(fontSize: 18),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// =====================================================
// RESCUE DASHBOARD
// =====================================================

class RescueScreen extends StatefulWidget {
  const RescueScreen({super.key});

  @override
  State<RescueScreen> createState() => _RescueScreenState();
}

class _RescueScreenState extends State<RescueScreen> {
  Color priorityColor(String priority) {
    switch (priority) {
      case 'CRITICAL':
        return Colors.red;
      case 'HIGH':
        return Colors.orange;
      default:
        return Colors.blue;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rescue Dashboard'),
      ),
      body: sosRequests.isEmpty
          ? const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.inbox,
                    size: 70,
                    color: Colors.grey,
                  ),
                  SizedBox(height: 15),
                  Text(
                    'No new SOS requests',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'SOS requests will appear here.',
                  ),
                ],
              ),
            )
          : ListView(
              padding: const EdgeInsets.all(16),
              children: [
                Text(
                  '${sosRequests.length} Emergency Request(s)',
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 15),

                ...sosRequests.asMap().entries.map(
                  (entry) {
                    final index = entry.key;
                    final request = entry.value;

                    return Card(
                      margin: const EdgeInsets.only(bottom: 12),
                      child: ListTile(
                        contentPadding:
                            const EdgeInsets.all(12),
                        leading: CircleAvatar(
                          backgroundColor:
                              priorityColor(request.priority),
                          child: const Icon(
                            Icons.warning,
                            color: Colors.white,
                          ),
                        ),
                        title: Text(
                          'Request #${index + 1} • ${request.name}',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Padding(
                          padding:
                              const EdgeInsets.only(top: 5),
                          child: Text(
                            '${request.people} people\n'
                            '${request.emergency}',
                          ),
                        ),
                        trailing: Text(
                          request.priority,
                          style: TextStyle(
                            color: priorityColor(
                              request.priority,
                            ),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    );
                  },
                ),

                const SizedBox(height: 15),

                Container(
                  padding: const EdgeInsets.all(18),
                  decoration: BoxDecoration(
                    color: Colors.blue.shade50,
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: const Column(
                    children: [
                      Icon(
                        Icons.priority_high,
                        size: 45,
                        color: Colors.blue,
                      ),
                      SizedBox(height: 10),
                      Text(
                        'SMART PRIORITIZATION',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Requests are prioritized using emergency type and number of people affected.',
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}