part of 'pages.dart';

class Home extends StatelessWidget {
  final bool internet = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: orangeColor,
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: Text('MY ORDERS'),
          flexibleSpace: Container(
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.symmetric(horizontal: defaultMargin),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(
                  Icons.menu,
                  color: whiteColor,
                ),
                GestureDetector(
                  onTap: () => showDialog<String>(
                    context: context,
                    builder: (BuildContext context) => AlertDialog(
                      title: const Text('Logout'),
                      content: const Text('AlertDialog description'),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () => Navigator.pop(context, 'Cancel'),
                          child: const Text('Cancel'),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/login');
                          },
                          child: const Text('OK'),
                        ),
                      ],
                    ),
                  ),
                  child: Icon(
                    Icons.logout,
                    color: whiteColor,
                  ),
                ),
              ],
            ),
          ),
        ),
        body: Container(
          margin: EdgeInsets.only(top: defaultMargin),
          child: DefaultTabController(
            length: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ButtonsTabBar(
                  borderColor: orangeColor,
                  unselectedBorderColor: orangeColor,
                  backgroundColor: orangeColor,
                  unselectedBackgroundColor: Colors.white,
                  labelStyle: textBlack.copyWith(
                    fontWeight: bold,
                  ),
                  unselectedLabelStyle: textOrange.copyWith(
                    fontWeight: bold,
                  ),
                  height: 40,
                  contentPadding: EdgeInsets.symmetric(horizontal: 55),
                  buttonMargin: EdgeInsets.symmetric(horizontal: 0),
                  borderWidth: 1,
                  tabs: [
                    Tab(
                      text: 'NEW',
                    ),
                    Tab(
                      text: 'ACCEPTED',
                    ),
                    Tab(
                      text: 'REJECTED',
                    ),
                  ],
                ),
                Expanded(
                  child: TabBarView(
                    children: [
                      NewOrder(),
                      AcceptedOrder(),
                      RejectedOrder(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: Container(
          width: double.infinity,
          height: 20,
          color: internet ? Colors.green : Colors.red,
          child: Center(
            child: Text(
              'Connected server to respone 1 :',
            ),
          ),
        ),
      ),
    );
  }
}

class NewOrder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          margin: EdgeInsets.only(top: 20),
          width: double.infinity,
          height: 20,
          color: greyColor.withOpacity(0.2),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: defaultMargin, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      'Himanshu Rawal',
                      style: textOrange.copyWith(
                        fontWeight: bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  Icon(Icons.phone),
                  SizedBox(width: 20),
                  Icon(
                    Icons.message,
                  ),
                ],
              ),
              Text(
                'Order Number :',
                style: textBlack,
              ),
              Divider(
                thickness: 2,
              ),
              Row(
                children: [
                  Icon(Icons.calendar_today),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    '22 may 2017',
                    style: textBlack,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Icon(Icons.timer),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    '22:00 - 23:00 WIB',
                    style: textBlack,
                  ),
                ],
              ),
              SizedBox(
                height: 25,
              ),
              Row(
                children: [
                  Text(
                    'RS. 255',
                    style: textBlack.copyWith(
                      fontSize: 20,
                      fontWeight: bold,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 20),
                    padding: EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      border: Border.all(color: greyColor.withOpacity(0.4)),
                    ),
                    child: Text(
                      'Cash on Delivery',
                      style: textGrey.copyWith(
                        color: greyColor.withOpacity(0.4),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      '32 Galungan Road, Baturaja Denpasar, Bali12121',
                      style: textGrey.copyWith(
                        color: greyColor.withOpacity(0.4),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: 16,
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  TextButton(
                    style: TextButton.styleFrom(
                        padding: EdgeInsets.symmetric(
                          horizontal: 30,
                        ),
                        backgroundColor: Colors.greenAccent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        )),
                    onPressed: () {},
                    child: Text(
                      'ACCEPT',
                      style: textBlack,
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 30, vertical: 7),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: greyColor),
                      ),
                      child: Text(
                        'REJECT',
                        style: textBlack,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 10),
          width: double.infinity,
          height: 20,
          color: greyColor.withOpacity(0.2),
        ),
      ],
    );
  }
}

class AcceptedOrder extends StatefulWidget {
  @override
  _AcceptedOrderState createState() => _AcceptedOrderState();
}

class _AcceptedOrderState extends State<AcceptedOrder> {
  List<BluetoothDevice> devices = [];
  BluetoothDevice selectedDevice;
  BlueThermalPrinter printer = BlueThermalPrinter.instance;

  @override
  // ignore: override_on_non_overriding_member
  void iniState() {
    super.initState();
    getDevices();
  }

  void getDevices() async {
    devices = await printer.getBondedDevices();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        SizedBox(
          height: 20,
        ),
        ListTile(
          leading: FlutterLogo(),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Fresh Fare',
                style: textBlack.copyWith(
                  fontWeight: semiBold,
                  fontSize: 16,
                ),
              ),
              Text(
                '\$500 (6 items)',
                style: textGrey.copyWith(
                  fontWeight: bold,
                  fontSize: 12,
                ),
              ),
              Text(
                'Accepted',
                style: textBlack.copyWith(
                  fontSize: 12,
                  color: Colors.greenAccent,
                ),
              ),
            ],
          ),
          trailing: Text('Today'),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 14),
          padding: EdgeInsets.all(20),
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Your order has been accepted',
                style: textBlack.copyWith(
                  fontWeight: semiBold,
                  fontSize: 16,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                'Estimated delivery time',
                style: textBlack.copyWith(
                  fontWeight: semiBold,
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      '20:20',
                      style: textBlack.copyWith(
                        fontWeight: semiBold,
                        fontSize: 36,
                        color: Colors.greenAccent,
                      ),
                    ),
                  ),
                  Icon(
                    Icons.departure_board_outlined,
                    size: 80,
                  )
                ],
              ),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.all(20),
          margin: EdgeInsets.symmetric(horizontal: 14, vertical: 14),
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Delivering to :',
                style: textBlack.copyWith(
                  fontWeight: semiBold,
                  fontSize: 16,
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 10),
                width: double.infinity,
                height: 20,
                color: blackColor,
              ),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.all(20),
          margin: EdgeInsets.symmetric(horizontal: 14, vertical: 10),
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      'Order sunmmary',
                      style: textBlack.copyWith(
                        fontWeight: semiBold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  Text(
                    '#2534363446',
                    style: textBlack,
                  ),
                ],
              ),
              Divider(
                thickness: 2,
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      'Grill Dumplings(4)',
                      style: textBlack.copyWith(
                        fontSize: 16,
                      ),
                    ),
                  ),
                  Text(
                    '\$5,00',
                    style: textBlack.copyWith(
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      'Prawn Crackers',
                      style: textBlack.copyWith(
                        fontSize: 16,
                      ),
                    ),
                  ),
                  Text(
                    '\$1,80',
                    style: textBlack.copyWith(
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      'Spare Ribs with Barbecued Sauce',
                      style: textBlack.copyWith(
                        fontSize: 16,
                      ),
                    ),
                  ),
                  Text(
                    '\$5,80',
                    style: textBlack.copyWith(
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      'Hot & Sour Shop',
                      style: textBlack.copyWith(
                        fontSize: 16,
                      ),
                    ),
                  ),
                  Text(
                    '\$3,00',
                    style: textBlack.copyWith(
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
              Divider(
                thickness: 2,
              ),
              SizedBox(
                height: 2,
              ),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      'Total Price',
                      style: textBlack.copyWith(
                        fontWeight: semiBold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  Text(
                    '\$253,6',
                    style: textBlack.copyWith(
                      fontWeight: semiBold,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          child: DropdownButton<BluetoothDevice>(
            value: selectedDevice,
            hint: const Text('Select Thermal Printer'),
            onChanged: (devices) {
              setState(() {
                selectedDevice = devices;
              });
            },
            items: devices
                .map(
                  (e) => DropdownMenuItem(
                    child: Text(e.name),
                    value: e,
                  ),
                )
                .toList(),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: blackColor,
                ),
                onPressed: () {
                  printer.connect(selectedDevice);
                },
                child: Text(
                  'Connect',
                  style: textWhite.copyWith(
                    fontSize: 20,
                    fontWeight: bold,
                  ),
                ),
              ),
              TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: blackColor,
                ),
                onPressed: () async {
                  if ((await printer.isConnected)) {
                    printer.printNewLine();
                    printer.printCustom('Order sunmmary #2534363446', 0, 1);
                    printer.printQRcode(
                        'Order sunmmary #2534363446', 200, 200, 1);
                    printer.printNewLine();
                    printer.printNewLine();
                  }
                },
                child: Text(
                  'Print',
                  style: textWhite.copyWith(
                    fontSize: 20,
                    fontWeight: bold,
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 20,
        ),
      ],
    );
  }
}

class RejectedOrder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          margin: EdgeInsets.only(top: 20),
          width: double.infinity,
          height: 20,
          color: greyColor.withOpacity(0.2),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: defaultMargin, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      'Himanshu Rawal',
                      style: textOrange.copyWith(
                        fontWeight: bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  Container(
                    color: Colors.redAccent,
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Text('rejected'),
                  ),
                  // Icon(Icons.phone),
                  // SizedBox(width: 20),
                  // Icon(
                  //   Icons.message,
                  // ),
                ],
              ),
              Text(
                'Order Number :',
                style: textBlack,
              ),
              Divider(
                thickness: 2,
              ),
              Row(
                children: [
                  Icon(Icons.calendar_today),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    '22 may 2017',
                    style: textBlack,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Icon(Icons.timer),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    '22:00 - 23:00 WIB',
                    style: textBlack,
                  ),
                ],
              ),
              SizedBox(
                height: 25,
              ),
              Row(
                children: [
                  Text(
                    'RS. 255',
                    style: textBlack.copyWith(
                      fontSize: 20,
                      fontWeight: bold,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 20),
                    padding: EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      border: Border.all(color: greyColor.withOpacity(0.4)),
                    ),
                    child: Text(
                      'Cash on Delivery',
                      style: textGrey.copyWith(
                        color: greyColor.withOpacity(0.4),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      '32 Galungan Road, Baturaja Denpasar, Bali12121',
                      style: textGrey.copyWith(
                        color: greyColor.withOpacity(0.4),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: 16,
                  ),
                ],
              ),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 10),
          width: double.infinity,
          height: 20,
          color: greyColor.withOpacity(0.2),
        ),
      ],
    );
  }
}
