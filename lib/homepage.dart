import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff121315),
      appBar: AppBar(
        backgroundColor: const Color(0xff121315),
        elevation: 0,
        title: const Text(
          'Trade',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.normal,
          ),
        ),
        centerTitle: true,
        leading: const Icon(Icons.menu),
        actions: [
          SizedBox(
            height: 30.0,
            width: 30.0,
            child: Stack(
              fit: StackFit.expand,
              children: [
                const Icon(Icons.notifications_outlined),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      width: 15.0,
                      height: 15.0,
                      decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(100.0)),
                      child: const Center(child: Text('3')),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            width: 8.0,
          ),
        ],
      ),
      body: Column(
        children: [
          _SearchField(),
          SizedBox(height: 16.0),
          SizedBox(
            height: 30.0,
            child: _Filters(),
          ),
          SizedBox(height: 16.0),
          _Cryptos(),
          _SeeAllButton(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xff121315),
        selectedItemColor: const Color(0xff3f74eb),
        showUnselectedLabels: true,
        unselectedItemColor: Colors.white,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.pie_chart_outlined),
            backgroundColor: Color(0xff121315),
            label: 'Assets'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.trending_up,),
            label: 'Trade'
          ),
          BottomNavigationBarItem(
            label: '',
            icon: Container(
              height: 50.0,
              width: 50.0,
              decoration: BoxDecoration(
                color: Color(0xff3f74eb),
                borderRadius: BorderRadius.circular(100.0),
              ),
              child: Center(
                child: Icon(
                  Icons.compare_arrows, 
                  color: Color(0xff121315)
                ),
              ),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.money), 
            label: 'Pay'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star_outline),
            label: 'For You'
          ),
        ],
      ),
    );
  }
}

class _SearchField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Container(
        child: Container(
          width: double.infinity,
          height: 60.0,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4.0),
              border: Border.all(
                color: Colors.white.withOpacity(0.5),
                width: 1.0,
              )),
          child: Row(
            children: [
              const SizedBox(width: 8.0),
              Icon(
                Icons.search,
                color: Colors.white.withOpacity(0.5),
              ),
              const SizedBox(width: 16.0),
              Expanded(
                child: TextField(
                  controller: TextEditingController(),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Search',
                    hintStyle: TextStyle(
                      color: Colors.white.withOpacity(0.5),
                    ),
                  ),
                  style: const TextStyle(color: Colors.white),
                ),
              ),
              const SizedBox(width: 8.0),
            ],
          ),
        ),
      ),
    );
  }
}

class _Filters extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.horizontal,
      children: [
        SizedBox(
          width: 16.0,
        ),
        _Filter(name: 'Tradable', isActive: true),
        _Filter(name: 'Watchlist'),
        _Filter(name: 'New in Coinbase'),
        _Filter(name: 'All assets'),
        _Filter(name: 'Watchlist'),
        _Filter(name: 'New in Coinbase'),
        _Filter(name: 'All assets'),
        SizedBox(
          width: 16.0,
        ),
      ],
    );
  }
}

class _Filter extends StatelessWidget {
  final String name;
  final bool isActive;
  _Filter({this.name, this.isActive = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30.0,
      padding: EdgeInsets.symmetric(horizontal: 8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100.0),
        color: isActive
            ? const Color(0xff3f74eb).withOpacity(0.1)
            : Colors.transparent,
        border: Border.all(
          color: isActive ? const Color(0xff3f74eb) : Colors.transparent,
        ),
      ),
      child: Center(
        child: Text(
          name,
          style: TextStyle(
              color: isActive ? const Color(0xff3f74eb) : Colors.white),
        ),
      ),
    );
  }
}

class _Cryptos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _CryptoItem(
            imagePath: "assets/images/bitcoin.png",
            name: 'Bitcoin',
            description: 'BTC',
            value: '\$50,906.08',
            growth: -6.25),
        _CryptoItem(
            imagePath: "assets/images/ethereum.png",
            name: 'Ethereum',
            description: 'ETH',
            value: '\$3,473.88',
            growth: -4.80),
        _CryptoItem(
            imagePath: "assets/images/tether.png",
            name: 'Tether',
            description: 'USDT',
            value: '\$0.86',
            growth: 0.26),
        _CryptoItem(
            imagePath: "assets/images/cardano.png",
            name: 'Cardano',
            description: 'ADA',
            value: '\$1.72',
            growth: -8.64),
        _CryptoItem(
            imagePath: "assets/images/solana.png",
            name: 'Solana',
            description: 'SOL',
            value: '\$166.98',
            growth: -9.43),
      ],
    );
  }
}

class _CryptoItem extends StatelessWidget {
  final String imagePath;
  final String name;
  final String description;
  final String value;
  final double growth;

  _CryptoItem(
      {this.imagePath, this.name, this.description, this.value, this.growth});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 80.0,
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        children: [
          Image.asset(imagePath, width: 60.0, height: 60.0),
          const SizedBox(width: 10.0),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(name,
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold)),
              const SizedBox(
                height: 8.0,
              ),
              Text(description,
                  style: TextStyle(color: Colors.white.withOpacity(0.5))),
            ],
          ),
          const Spacer(),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(value, style: TextStyle(color: Colors.white)),
              const SizedBox(
                height: 8.0,
              ),
              Text(
                "$growth%",
                style: TextStyle(
                  color: growth < 0 ? Colors.red[300] : Colors.green,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class _SeeAllButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Container(
        height: 60.0,
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4.0),
            border: Border.all(
              color: Colors.white.withOpacity(0.5),
            )),
        child: Center(
          child: Text(
            'See all',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
