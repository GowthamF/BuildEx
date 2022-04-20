import 'package:flutter/material.dart';

class ServiceCentersRequests extends StatefulWidget {
  const ServiceCentersRequests({Key? key}) : super(key: key);

  @override
  State<ServiceCentersRequests> createState() => _ServiceCentersRequestsState();
}

class _ServiceCentersRequestsState extends State<ServiceCentersRequests> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Column(
        children: [
          const TabBar(
            labelColor: Colors.blue,
            tabs: [
              Tab(
                text: 'Pending',
              ),
              Tab(
                text: 'Accepted',
              ),
              Tab(
                text: 'Rejected',
              ),
            ],
          ),
          Expanded(
            child: TabBarView(
              children: [
                Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        itemCount: 10,
                        itemBuilder: (context, index) {
                          return ListTile(
                              title: Text('Appointment $index'),
                              subtitle: const Text('Requested by : User'),
                              trailing: Wrap(
                                children: [
                                  IconButton(
                                    onPressed: () {},
                                    icon: const Icon(
                                        Icons.check_circle_outline_outlined),
                                    color:
                                        const Color.fromARGB(255, 1, 101, 52),
                                  ),
                                  IconButton(
                                    onPressed: () {},
                                    icon: const Icon(Icons.cancel_outlined),
                                    color: Colors.red,
                                  ),
                                ],
                              ));
                        },
                      ),
                    )
                  ],
                ),
                Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        itemCount: 10,
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: Text('Appointment $index'),
                            subtitle: const Text('Requested by : User'),
                            leading: const Icon(
                              Icons.check_circle_outline_outlined,
                              color: Color.fromARGB(255, 1, 101, 52),
                            ),
                          );
                        },
                      ),
                    )
                  ],
                ),
                Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        itemCount: 10,
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: Text('Appointment $index'),
                            subtitle: const Text('Requested by : User'),
                            leading: const Icon(
                              Icons.cancel_outlined,
                              color: Colors.red,
                            ),
                          );
                        },
                      ),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
