import 'package:flutter/material.dart';
import 'package:flutter_workshop/models/inquiry_model.dart';
import 'package:flutter_workshop/services/database.dart';

class AllInquiries extends StatelessWidget {
  final Stream<List<InquiryModel>>? inquiriesStream =
      Database().inquiriesStream();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('All Inquiries'),
        backgroundColor: Colors.black,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 30),
        child: StreamBuilder(
            stream: inquiriesStream,
            builder: (context, AsyncSnapshot snapshot) {
              if (!snapshot.hasData)
                return Center(child: CircularProgressIndicator());
              if (snapshot.data.length == 0)
                return Center(
                  child: Text('No Inquiries Found'),
                );
              return ListView(
                children: [
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const ScrollPhysics(),
                    itemCount: snapshot.data.length,
                    itemBuilder: (_, index) {
                      InquiryModel inquiryData = snapshot.data[0];
                      return Card(
                        child: ListTile(
                          leading:
                              Icon(Icons.person_outline, color: Colors.blue),
                          trailing: IconButton(
                            icon: Icon(
                              Icons.cancel,
                              color: Colors.deepPurple,
                            ),
                            onPressed: () async {
                              await Database().deleteInquiry(inquiryData.id);
                            },
                          ),
                          title: Text(inquiryData.name ?? ''),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 10,
                              ),
                              Text(inquiryData.email ?? ''),
                              Text(inquiryData.phone ?? ''),
                              Text(inquiryData.message ?? ''),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ],
              );
            }),
      ),
    );
  }
}
