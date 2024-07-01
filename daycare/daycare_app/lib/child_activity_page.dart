import 'package:flutter/material.dart';

class ChildActivityPage extends StatelessWidget {
  final Map<String, String> activityData;

  ChildActivityPage({required this.activityData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange[300],
        title: Center(
          child: Text('Child Activity Details',
          style: TextStyle(fontWeight: FontWeight.bold))
      ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: ListView(
          children: <Widget>[
            _buildSectionTitle('Name and Date'),
            _buildDetailCard('Name', activityData['name']),
            _buildDetailCard('Date', activityData['date']),
            _buildSectionTitle('Body Temperature and Conditions'),
            _buildDetailCard('Temperature', activityData['temperature']),
            _buildDetailCard('Condition', activityData['condition']),
            _buildSectionTitle('Meals'),
            _buildDetailCard('Breakfast', activityData['breakfast']),
            _buildDetailCard('Snack', activityData['snack']),
            _buildDetailCard('Lunch', activityData['lunch']),
            _buildDetailCard('Dinner', activityData['dinner']),
            _buildDetailCard('Other', activityData['other']),
            _buildSectionTitle('Toilet'),
            _buildToiletDetail(),
            _buildSectionTitle('Bottle'),
            _buildBottleDetail(),
            _buildSectionTitle('Other'),
            _buildShowerVitaminDetail(),
            _buildSectionTitle('Notes for My Parents'),
            _buildNotesForParentsDetail(),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        title,
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildDetailCard(String title, String? value) {
    return Card(
      child: ListTile(
        title: Text(title),
        subtitle: Text(value ?? ''),
      ),
    );
  }

  Widget _buildToiletDetail() {
    return Column(
      children: [
        _buildDetailCard('Time', activityData['toilet_time']),
        _buildDetailCard('Type', activityData['toilet_tipe']),
        _buildDetailCard('Dry/Wet/BM', activityData['toilet_dry_wet_bm']),
        _buildDetailCard('Notes', activityData['toilet_notes']),
      ],
    );
  }

  Widget _buildBottleDetail() {
    return Column(
      children: [
        _buildDetailCard('Time', activityData['bottle_time']),
        _buildDetailCard('ML', activityData['bottle_ml']),
        _buildDetailCard('Bottle Type', activityData['bottle_type']),
        _buildDetailCard('Notes', activityData['bottle_notes']),
      ],
    );
  }

  Widget _buildShowerVitaminDetail() {
    return Column(
      children: [
        Row(
          children: [
            _buildSmallField('Morning Shower', activityData['shower_morning']),
            _buildSmallField('Afternoon Shower', activityData['shower_afternoon']),
          ],
        ),
        _buildDetailCard('Vitamin', activityData['vitamin']),
      ],
    );
  }

  Widget _buildNotesForParentsDetail() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildDetailCard('ITEM I NEED', ''),
        Wrap(
          spacing: 16,
          runSpacing: 8,
          children: [
            _buildItemDetail('Diapers', activityData['item_needed_Diapers']),
            _buildItemDetail('Hand Towel', activityData['item_needed_Hand Towel']),
            _buildItemDetail('Cream', activityData['item_needed_Cream']),
            _buildItemDetail('Clothes', activityData['item_needed_Clothes']),
            _buildItemDetail('Towel', activityData['item_needed_Towel']),
            _buildItemDetail('Soap & Shampoo', activityData['item_needed_Soap & Shampoo']),
            _buildItemDetail('Milk', activityData['item_needed_Milk']),
            _buildItemDetail('Toothpaste', activityData['item_needed_Toothpaste']),
            _buildItemDetail('Other', activityData['item_needed_Other']),
          ],
        ),
      ],
    );
  }

  Widget _buildItemDetail(String label, String? value) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Checkbox(
          value: value != null,
          onChanged: null,
        ),
        Text(label),
      ],
    );
  }

  Widget _buildSmallField(String label, String? value) {
    return Expanded(
      child: Card(
        child: ListTile(
          title: Text(label),
          subtitle: Text(value ?? ''),
        ),
      ),
    );
  }
}