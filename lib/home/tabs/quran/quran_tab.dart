import 'package:flutter/material.dart';
import 'package:islami/home/app_colors.dart';
import 'package:islami/home/tabs/quran/sura_details_screen.dart';
import 'package:islami/home/tabs/quran/sura_list_widget.dart';
import 'package:islami/models/sura_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class QuranTab extends StatefulWidget {
  const QuranTab({super.key});

  @override
  State<QuranTab> createState() => _QuranTabState();
}

class _QuranTabState extends State<QuranTab> {
  /// Prevent sura list from being added multiple times
  void addSuraList() {
    if (SuraModel.suraList.isNotEmpty) return; // ✅ fix duplication
    for (int i = 0; i <= 113; i++) {
      SuraModel.suraList.add(
        SuraModel(
          suraEnName: SuraModel.suraEnList[i],
          suraArName: SuraModel.suraArList[i],
          numberOfVerses: SuraModel.numberOfVersesList[i],
          fileName: '${i + 1}.txt',
        ),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    addSuraList();
    loadLastSura(); // ✅ load saved sura when screen starts
  }

  List<SuraModel> filterList = SuraModel.suraList;
  String searchText = '';
  Map<String, String> loadSuraList = {}; // ✅ this will hold last sura info

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.asset('assets/images/logo.png'),
          TextField(
            style: const TextStyle(color: AppColors.white),
            cursorColor: AppColors.white,
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: const BorderSide(
                  color: AppColors.primary,
                  width: 2,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: const BorderSide(
                  color: AppColors.primary,
                  width: 2,
                ),
              ),
              prefixIcon: Image.asset('assets/images/icon_search.png'),
              hintText: 'Sura Name',
              hintStyle: const TextStyle(color: AppColors.white),
            ),
            onChanged: (text) {
              searchText = text;

              /// ✅ filter list by English or Arabic name
              filterList = SuraModel.suraList.where((suraModel) {
                return suraModel.suraArName.contains(searchText) ||
                    suraModel.suraEnName
                        .toLowerCase()
                        .contains(searchText.toLowerCase());
              }).toList();

              setState(() {});
            },
          ),
          const SizedBox(height: 20),

          /// ✅ show "Most Recently" only when search is empty AND sura is saved
          if (searchText.isEmpty && (loadSuraList['suraEnName']?.isNotEmpty ?? false))
            buildMostRecently(context),

          Text(
            'Sura List',
            style: Theme.of(context).textTheme.headlineLarge,
          ),
          const SizedBox(height: 10),
          Expanded(
            child: ListView.separated(
              padding: EdgeInsets.zero,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    /// ✅ Save last sura when tapped
                    savedLastSura(
                      suraArName: filterList[index].suraArName,
                      suraEnName: filterList[index].suraEnName,
                      numOfVerses: filterList[index].numberOfVerses,
                    );

                    Navigator.of(context).pushNamed(
                      SuraDetailsScreen.routeName,
                      arguments: filterList[index],
                    );
                  },
                  child: SuraListWidget(
                    suraModel: filterList[index],
                    index: index,
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return const Divider(
                  color: AppColors.white,
                  thickness: 2,
                  indent: 30.5,
                  endIndent: 25.5,
                );
              },
              itemCount: filterList.length,
            ),
          ),
        ],
      ),
    );
  }

  /// ✅ build "Most Recently" widget safely
  Widget buildMostRecently(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Most Recently',
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        const SizedBox(height: 10),
        Container(
          decoration: BoxDecoration(
            color: AppColors.primary,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Text(
                    loadSuraList['suraEnName'] ?? '',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  Text(
                    loadSuraList['suraArName'] ?? '',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  Text(
                   ' ${loadSuraList['numOfVerses']} verses' ?? '',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                ],
              ),
              Image.asset('assets/images/most_recently.png'),
            ],
          ),
        ),
        const SizedBox(height: 10),
      ],
    );
  }

  /// ✅ Save last sura to SharedPreferences
  Future<void> savedLastSura({
    required String suraArName,
    required String suraEnName,
    required String numOfVerses,
  }) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('suraEnName', suraEnName);
    await prefs.setString('suraArName', suraArName);
    await prefs.setString('numOfVerses', numOfVerses);

    /// Update UI immediately after saving
    loadSuraList = {
      'suraEnName': suraEnName,
      'suraArName': suraArName,
      'numOfVerses': numOfVerses,
    };
    setState(() {});
  }

  /// ✅ Load last sura from SharedPreferences
  Future<Map<String, String>> getLastSura() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String suraEnName = prefs.getString('suraEnName') ?? '';
    String suraArName = prefs.getString('suraArName') ?? '';
    String numOfVerses = prefs.getString('numOfVerses') ?? '';

    return {
      'suraEnName': suraEnName,
      'suraArName': suraArName,
      'numOfVerses': numOfVerses,
    };
  }

  /// ✅ Call this in initState to load saved data
  Future<void> loadLastSura() async {
    loadSuraList = await getLastSura();
    setState(() {});
  }
}
