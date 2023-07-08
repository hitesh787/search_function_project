import 'package:flutter/material.dart';
import 'package:search_function_project/list.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Map<String, dynamic>> foundCountryList = [];
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    foundCountryList = countryCodeList1;
    super.initState();
  }

  void _runFilter(String enterKeyword) {
    List<Map<String, dynamic>> result = [];
    if (enterKeyword.isEmpty) {
      result = countryCodeList1;
    } else {
      result = countryCodeList1
          .where((user) =>
              user["name"].toLowerCase().contains(enterKeyword.toLowerCase()))
          .toList();
    }
    setState(() {
      foundCountryList = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search Bar'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 30, right: 30, top: 50),
        child: Column(
          children: [
            TextField(
              onChanged: (value) => _runFilter(value),
              decoration: const InputDecoration(hintText: "Search contest"),
            ),
            const SizedBox(
              height: 30,
            ),
            Expanded(
              child: foundCountryList.isEmpty
                  ? const SearchContainer() 
                  : ListView.builder(
                      itemCount: foundCountryList.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          onTap: () {
                            print(
                                'Select Country ${foundCountryList[index]["name"]}');
                          },
                          leading: CircleAvatar(
                            radius: 30,
                            backgroundColor: Colors.transparent,
                            child: Text(
                              foundCountryList[index]["emoji"].toString(),
                              style: const TextStyle(fontSize: 30),
                            ),
                          ),
                          title: Text(
                            foundCountryList[index]["name"].toString(),
                            style: const TextStyle(fontSize: 20),
                          ),
                          subtitle: Text(
                            foundCountryList[index]["code"].toString(),
                            style: const TextStyle(fontSize: 15),
                          ),
                        );
                      }),
            )
          ],
        ),
      ),
    );
  }
}

class SearchContainer extends StatelessWidget {
  const SearchContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: const [
        Icon(
          Icons.search,
          size: 100,
        ),
        SizedBox(height: 20),
        Text(
          'Country not found',
          style: TextStyle(
              fontSize: 36, fontWeight: FontWeight.w700, color: Colors.black),
        ),
        SizedBox(height: 20),
      ],
    );
  }
}

//Search Filed In flutter
// class SearchScreen extends StatefulWidget {
//   @override
//   _SearchScreenState createState() => _SearchScreenState();
// }
//
// class _SearchScreenState extends State<SearchScreen> {
//   List<SearchResult> searchResults = [
//     SearchResult('Result 1', 'Description for Result 1'),
//     SearchResult('Result 2', 'Description for Result 2'),
//     SearchResult('Result 3', 'Description for Result 3'),
//   ];
//
//   List<SearchResult> displayedResults = [];
//   TextEditingController searchController = TextEditingController();
//
//   void search(String query) {
//     setState(() {
//       displayedResults = searchResults
//           .where((result) =>
//           result.title.toLowerCase().contains(query.toLowerCase()))
//           .toList();
//     });
//   }
//
//   void selectResult(SearchResult result) {
//     setState(() {
//       searchController.text = result.title;
//       displayedResults = [];
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Search'),
//       ),
//       body: Column(
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: TextField(
//               controller: searchController,
//               onChanged: search,
//               decoration: InputDecoration(
//                 labelText: 'Search',
//                 border: OutlineInputBorder(),
//               ),
//             ),
//           ),
//           Expanded(
//             child: ListView.builder(
//               itemCount: displayedResults.length,
//               itemBuilder: (context, index) {
//                 final result = displayedResults[index];
//                 return ListTile(
//                   title: Text(result.title),
//                   subtitle: Text(result.description),
//                   onTap: () {
//                     selectResult(result);
//                   },
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
//
// class SearchResult {
//   final String title;
//   final String description;
//
//   SearchResult(this.title, this.description);
// }
