import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

void main() => runApp(MyApp());


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 1;

  final List<Widget> _screens = [
    DashboardScreen(),
    MarketScreen(),
    Center(child: Text('Portfolio Screen')),
    Center(child: Text('News Screen')),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: [
          DashboardScreen(),
          MarketScreen(),
          const Center(child: Text('Portfolio Screen')),
          const Center(child: Text('News Screen')),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        backgroundColor: Colors.black,
        selectedItemColor: Colors.greenAccent,
        unselectedItemColor: Colors.white70,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Stack(
              clipBehavior: Clip.none,
              children: [
                const Icon(Icons.pie_chart),
                if (_currentIndex == 0)
                  const Positioned(
                    top: -5,
                    right: -5,
                    child: Icon(
                      Icons.circle,
                      size: 8,
                      color: Colors.greenAccent,
                    ),
                  ),
              ],
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Stack(
              clipBehavior: Clip.none,
              children: [
                const Icon(Icons.pie_chart),
                if (_currentIndex == 1)
                  const Positioned(
                    top: -5,
                    right: -5,
                    child: Icon(
                      Icons.circle,
                      size: 8,
                      color: Colors.greenAccent,
                    ),
                  ),
              ],
            ),
            label: 'Explore',
          ),
          BottomNavigationBarItem(
            icon: Stack(
              clipBehavior: Clip.none,
              children: [
                Icon(Icons.pie_chart),
                if (_currentIndex == 2)
                  const Positioned(
                    top: -5,
                    right: -5,
                    child: Icon(
                      Icons.circle,
                      size: 8,
                      color: Colors.greenAccent,
                    ),
                  ),
              ],
            ),
            label: 'Portfolio',
          ),
          BottomNavigationBarItem(
            icon: Stack(
              clipBehavior: Clip.none,
              children: [
                const Icon(Icons.pie_chart),
                if (_currentIndex == 3)
                  const Positioned(
                    top: -5,
                    right: -5,
                    child: Icon(
                      Icons.circle,
                      size: 8,
                      color: Colors.greenAccent,
                    ),
                  ),
              ],
            ),
            label: 'News',
          ),
        ],
      ),
    );
  }
}

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 16.0,left: 16.0,right: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Header Section
               const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage(
                        "assets/person.png"),
                    radius: 22,
                  ),
                  SizedBox(width: 10),
                  Text(
                    "Hi Martin!",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "TOTAL AMOUNT",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    "€9,968.00",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "0.32%",
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.red,
                        ),
                      ),
                      Text(
                        "(-€32)",
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              // Candlestick Chart
              Container(
                height: 200,
                // decoration: BoxDecoration(
                //   color: Color(0xFF1E1E1E),
                //   borderRadius: BorderRadius.circular(12),
                // ),
                padding: const EdgeInsets.all(8.0),
                child: SfCartesianChart(
                  backgroundColor: Colors.transparent,
                  plotAreaBorderWidth: 0,
                  primaryXAxis: NumericAxis(
                    majorGridLines: const MajorGridLines(width: 0),
                    axisLine: const AxisLine(color: Colors.transparent),
                    interval: 1
                  ),
                  primaryYAxis: NumericAxis(
                    minimum: 2000,
                    maximum: 10000,
                    interval: 2000,
                    labelStyle: const TextStyle(color: Colors.grey),
                    majorGridLines: const MajorGridLines(width: 0.1),
                    axisLine: const AxisLine(width: 0),
                      opposedPosition: true
                  ),
                  tooltipBehavior: TooltipBehavior(enable: true),
                  zoomPanBehavior: ZoomPanBehavior(
                    enablePanning: true,
                    enablePinching: true,
                    zoomMode: ZoomMode.x,
                  ),
                  series: <CartesianSeries>[
                    CandleSeries<ChartData, int>(
                      dataSource: getChartData(),
                      xValueMapper: (ChartData data, int index) => index + 1,
                      lowValueMapper: (ChartData data, _) => data.low,
                      highValueMapper: (ChartData data, _) => data.high,
                      openValueMapper: (ChartData data, _) => data.open,
                      closeValueMapper: (ChartData data, _) => data.close,
                      // bearColor: Colors.blue,
                      // bullColor: Colors.red,
                      enableSolidCandles: true,
                    ),
                  ],
                ),
              ),
              // const SizedBox(height: 16),
              // Time Period Selector
              Container(
                height: 30,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.grey.shade900,
                  borderRadius: BorderRadius.circular(5.0),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: ["24H", "1W", "1M", "1Y", "All"].map((text) {
                    return TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                        foregroundColor: Colors.white,
                      ),
                      child: Text(
                        text,
                        style: const TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
              // Action Buttons
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () {},
                      style: OutlinedButton.styleFrom(
                        side: BorderSide(
                          color: Colors.white, // Set the border color
                          width: 1.5, // Set the border width
                        ),
                        backgroundColor: Colors.black, // Optional: Background color of the button
                      ),
                      child: Text("Sell",style: TextStyle(color: Colors.white),),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                      ),
                      child: const Text("Buy"),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Whatchlist',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              WatchlistScreen(),
            ],
          ),
        ),
      ),
    );
  }
  List<ChartData> getChartData() {
    return [
      ChartData(0, 5000, 9000, 5500, 7000),
      ChartData(1, 4000, 8000, 4500, 6000),
      ChartData(2, 4500, 7500, 5000, 7000),
      ChartData(3, 4800, 8500, 5000, 8000),
      ChartData(4, 4800, 8500, 5000, 8000),
      ChartData(5, 4800, 8500, 5000, 8000),
      ChartData(4, 4800, 8500, 5000, 8000),
      ChartData(7, 4800, 8500, 5000, 8000),
      ChartData(8, 4800, 8500, 5000, 8000),
      ChartData(9, 4800, 8500, 5000, 8000),
      ChartData(10, 4800, 8500, 5000, 8000),
      ChartData(11, 4800, 8500, 5000, 8000),
    ];
  }
}

class ChartData {
  final double x;
  final double low;
  final double high;
  final double open;
  final double close;

  ChartData(this.x, this.low, this.high, this.open, this.close);
}


class WatchlistScreen extends StatelessWidget {
  final List<Stock> stocks = [
    Stock('Apple Inc.', 'AAPL', 125.40, 0.19, 'up', 'assets/alp.png'),
    Stock('Microsoft Co', 'MSFT', 251.01, -0.09, 'down', 'assets/amazan.png'),
    Stock('Amazon.com', 'AMZN', 3240.30, 1.03, 'up', 'assets/apple.png'),
    Stock('Facebook Inc.', 'FB', 329.49, 0.84, 'up', 'assets/mic.png'),
    Stock('Alphabet Inc.', 'GOOGL', 2331.90, -0.08, 'down', 'assets/alp.png'),
    Stock('JPMorgan', 'JPM', 125.40, 0.27, 'up', 'assets/amazan.png'),
    Stock('Tesla Inc.', 'TSLA', 251.01, 2.04, 'up', 'assets/apple.png'),
  ];

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: stocks.length,
        itemBuilder: (context, index) {
          final stock = stocks[index];
          return StockTile(stock: stock);
        },
      ),
    );
  }
}

class StockTile extends StatelessWidget {
  final Stock stock;

  StockTile({required this.stock});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Left Section: Logo and Name
          Row(
            children: [
              CircleAvatar(
                backgroundImage: AssetImage(stock.logoPath),
                backgroundColor: Colors.transparent,
                radius: 20,
              ),
              SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    stock.name,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    stock.symbol,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ],
          ),
          // Right Section: Price and Change
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                stock.price.toStringAsFixed(2),
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              Row(
                children: [
                  Icon(
                    stock.changeDirection == 'up'
                        ? Icons.arrow_upward
                        : Icons.arrow_downward,
                    size: 16,
                    color: stock.changeDirection == 'up'
                        ? Colors.green
                        : Colors.red,
                  ),
                  Text(
                    '${stock.change.toStringAsFixed(2)}%',
                    style: TextStyle(
                      fontSize: 14,
                      color: stock.changeDirection == 'up'
                          ? Colors.green
                          : Colors.red,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class Stock {
  final String name;
  final String symbol;
  final double price;
  final double change;
  final String changeDirection; // 'up' or 'down'
  final String logoPath;

  Stock(this.name, this.symbol, this.price, this.change, this.changeDirection,
      this.logoPath);
}
class MarketScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          backgroundColor: Color(0xFF121212),
          body: Padding(
            padding: const EdgeInsets.only(top: 16.0,left: 16.0,right: 16.0),
            child: Column(
              children: [
                TextField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey[900],
                    prefixIcon: Icon(Icons.search, color: Colors.white70),
                    suffixIcon: Icon(Icons.filter_alt_outlined, color: Colors.white70),
                    hintText: 'Search instruments',
                    hintStyle: TextStyle(color: Colors.white70),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  style: TextStyle(color: Colors.white),
                ),
                SizedBox(height: 20),
                TabBar(
                  indicator: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  unselectedLabelColor: Colors.white70,
                  labelColor: Colors.white,
                  tabs: [
                    Tab(text: 'Market'),
                    Tab(text: 'Watchlist'),
                  ],
                ),
                // SizedBox(height: 20),
                Expanded(
                  child: TabBarView(
                    children: [
                      MarketTab(),
                      Center(child: Text('Watchlist', style: TextStyle(color: Colors.white))),
                    ],
                  ),
                ),
                Container(
                  height: MediaQuery.sizeOf(context).width*0.8,
                  color: Colors.transparent,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MarketTab extends StatelessWidget {
  final List<_ChartData> chartData = [
    _ChartData(1, 40),
    _ChartData(2, 120),
    _ChartData(3, 20),
    _ChartData(4, 140),
  ];

  Widget _buildCard(String title, String subtitle, String value, String percentage) {
    return SizedBox(
      width: 140,
      child: Card(
        color: Colors.grey[900],
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: TextStyle(color: Colors.white, fontSize: 16)),
              SizedBox(height: 4),
              Text(subtitle, style: TextStyle(color: Colors.white70, fontSize: 12)),
              SizedBox(
                height: 60,
                child: SfCartesianChart(
                  primaryXAxis: NumericAxis(isVisible: false),
                  primaryYAxis: NumericAxis(isVisible: false),
                  plotAreaBorderWidth: 0,
                  series: <ChartSeries>[
                    LineSeries<_ChartData, int>(
                      dataSource: chartData,
                      xValueMapper: (_ChartData data, _) => data.x,
                      yValueMapper: (_ChartData data, _) => data.y,
                      color: Colors.green,
                      width: 2,
                    ),
                  ],
                ),
              ),
              Text(value, style: TextStyle(color: Colors.white, fontSize: 13)),
              SizedBox(height: 4),
              Text(percentage, style: TextStyle(color: Colors.green, fontSize: 12)),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Indices', style: TextStyle(color: Colors.white, fontSize: 18)),
            Text('Show all', style: TextStyle(color: Colors.blue, fontSize: 14)),
          ],
        ),
        SizedBox(height: 12),
        Expanded(
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 5,
            itemBuilder: (context, index) {
              return _buildCard('Dow 30', 'Dow Jones Index', '34529.46', '+0.19%');

            },
          ),
        ),
      ],
    );
  }
}

class _ChartData {
  final int x;
  final double y;

  _ChartData(this.x, this.y);
}

