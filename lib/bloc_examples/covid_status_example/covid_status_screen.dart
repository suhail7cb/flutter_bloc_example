import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_example/bloc_examples/covid_status_example/covid_bloc.dart';
import 'package:flutter_bloc_example/network/covid_model.dart';

import '../theme_example/theme_bloc.dart';


class CovidStatusScreen extends StatefulWidget {
  @override
  _CovidStatusScreenState createState() => _CovidStatusScreenState();
}

class _CovidStatusScreenState extends State<CovidStatusScreen> {
  final CovidBloc _newsBloc = CovidBloc();

  @override
  void initState() {
    _newsBloc.add(GetCovidList());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
            title: const Text('COVID-19 List'),
          actions: [
            IconButton(onPressed: (){
              context.read<ThemeBloc>().toggleTheme();
            }, icon: const Icon(Icons.brightness_6))
          ],

        ),
        body: _buildListCovid(),
    );
  }

  Widget _buildListCovid() {
    return Container(
      margin: const EdgeInsets.all(8.0),
      child: BlocProvider(
        create: (_) => _newsBloc,
        child: BlocListener<CovidBloc, CovidState>(
          listener: (context, state) {
            if (state is CovidError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.message!),
                ),
              );
            }
          },
          child: BlocBuilder<CovidBloc, CovidState>(
            builder: (context, state) {
              if (state is CovidInitial) {
                return _buildLoading();
              } else if (state is CovidLoading) {
                return _buildLoading();
              } else if (state is CovidLoaded) {
                return _buildCard(context, state.covidModel);
              } else if (state is CovidError) {
                return Container();
              } else {
                return Container();
              }
            },
          ),
        ),
      ),
    );
  }

  Widget _buildCard(BuildContext context, CovidModel model) {
    return model.countries.isEmpty
     ? const Center(child: Text('No data found'),)
     : ListView.builder(
      itemCount: model.countries.length,
      itemBuilder: (context, index) {
        return Container(
          margin: const EdgeInsets.all(8.0),
          child: Card(
            child: Container(
              margin: const EdgeInsets.all(8.0),
              child: Column(
                children: <Widget>[
                  Text("Country: ${model.countries![index].country}"),
                  Text(
                      "Total Confirmed: ${model.countries[index].totalConfirmed}"),
                  Text("Total Deaths: ${model.countries[index].totalDeaths}"),
                  Text(
                      "Total Recovered: ${model.countries[index].totalRecovered}"),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildLoading() => const Center(child: CircularProgressIndicator());
}