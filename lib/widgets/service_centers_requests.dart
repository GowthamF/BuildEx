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
                text: 'Accept',
              ),
              Tab(
                text: 'Rejected',
              ),
              Tab(
                text: 'Pending',
              )
            ],
          ),
          Expanded(
            child: TabBarView(
              children: [
                Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        itemCount: 20,
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: Text('data$index'),
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
                        itemCount: 20,
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: Text('data$index'),
                          );
                        },
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        itemCount: 20,
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: Text('data$index'),
                          );
                        },
                      ),
                    ),
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
