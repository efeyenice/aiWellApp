import 'package:flutter/material.dart';

class BookContactPage extends StatefulWidget {
  const BookContactPage({super.key});

  @override
  State<BookContactPage> createState() => _BookContactPageState();
}

class _BookContactPageState extends State<BookContactPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _reasonController = TextEditingController();
  
  DateTime _selectedDate = DateTime.now().add(const Duration(days: 1));
  String _selectedTime = '10:00 AM';
  String _selectedTherapist = 'Any Available Therapist';

  final List<String> _timeSlots = [
    '9:00 AM', '10:00 AM', '11:00 AM',
    '1:00 PM', '2:00 PM', '3:00 PM', '4:00 PM'
  ];

  final List<Therapist> _therapists = [
    Therapist(
      id: '1',
      name: 'Dr. Sarah Johnson',
      specialty: 'Anxiety & Depression',
      rating: 4.9,
      image: 'assets/images/therapist1.jpg',
    ),
    Therapist(
      id: '2',
      name: 'Dr. Michael Chen',
      specialty: 'Trauma Recovery',
      rating: 4.8,
      image: 'assets/images/therapist2.jpg',
    ),
    Therapist(
      id: '3',
      name: 'Dr. Emily Rodriguez',
      specialty: 'Relationship Counseling',
      rating: 4.7,
      image: 'assets/images/therapist3.jpg',
    ),
  ];

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _reasonController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Book Therapy Session'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Book a Session with a Professional Therapist',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Fill in the details below to schedule a therapy session.',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 24),
              _buildForm(),
              const SizedBox(height: 32),
              const Text(
                'Emergency Contact',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                ),
              ),
              const SizedBox(height: 8),
              const Card(
                color: Color(0xFFFEE8E8),
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'If you\'re experiencing a mental health emergency or feeling suicidal:',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 8),
                      Text('• National Suicide Prevention Lifeline: 988 or 1-800-273-8255'),
                      Text('• Crisis Text Line: Text HOME to 741741'),
                      SizedBox(height: 12),
                      Text('Available 24/7. Free and confidential support for people in distress.'),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildForm() {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Your Information',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          TextFormField(
            controller: _nameController,
            decoration: const InputDecoration(
              labelText: 'Full Name',
              border: OutlineInputBorder(),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your name';
              }
              return null;
            },
          ),
          const SizedBox(height: 16),
          TextFormField(
            controller: _phoneController,
            decoration: const InputDecoration(
              labelText: 'Phone Number',
              border: OutlineInputBorder(),
            ),
            keyboardType: TextInputType.phone,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your phone number';
              }
              return null;
            },
          ),
          const SizedBox(height: 24),
          const Text(
            'Session Details',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          InkWell(
            onTap: () => _selectDate(context),
            child: InputDecorator(
              decoration: const InputDecoration(
                labelText: 'Preferred Date',
                border: OutlineInputBorder(),
              ),
              child: Text(
                '${_selectedDate.day}/${_selectedDate.month}/${_selectedDate.year}',
              ),
            ),
          ),
          const SizedBox(height: 16),
          DropdownButtonFormField<String>(
            decoration: const InputDecoration(
              labelText: 'Preferred Time',
              border: OutlineInputBorder(),
            ),
            value: _selectedTime,
            items: _timeSlots
                .map((time) => DropdownMenuItem(
                      value: time,
                      child: Text(time),
                    ))
                .toList(),
            onChanged: (value) {
              setState(() {
                _selectedTime = value!;
              });
            },
          ),
          const SizedBox(height: 16),
          DropdownButtonFormField<String>(
            decoration: const InputDecoration(
              labelText: 'Select Therapist',
              border: OutlineInputBorder(),
            ),
            value: _selectedTherapist,
            items: [
              const DropdownMenuItem(
                value: 'Any Available Therapist',
                child: Text('Any Available Therapist'),
              ),
              ..._therapists
                  .map((therapist) => DropdownMenuItem(
                        value: therapist.name,
                        child: Text(therapist.name),
                      ))
                  .toList(),
            ],
            onChanged: (value) {
              setState(() {
                _selectedTherapist = value!;
              });
            },
          ),
          const SizedBox(height: 16),
          TextFormField(
            controller: _reasonController,
            decoration: const InputDecoration(
              labelText: 'Reason for Session',
              border: OutlineInputBorder(),
              hintText: 'Briefly describe your reason for booking',
            ),
            maxLines: 3,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please provide a reason for the session';
              }
              return null;
            },
          ),
          const SizedBox(height: 24),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  // Book appointment functionality
                  _showBookingConfirmationDialog();
                }
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
              child: const Text(
                'Book Appointment',
                style: TextStyle(fontSize: 16),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 30)),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  void _showBookingConfirmationDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Booking Confirmation'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Your appointment request has been received.',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 12),
              Text('Date: ${_selectedDate.day}/${_selectedDate.month}/${_selectedDate.year}'),
              Text('Time: $_selectedTime'),
              Text('Therapist: $_selectedTherapist'),
              const SizedBox(height: 12),
              const Text(
                'We will contact you shortly to confirm your appointment.',
                style: TextStyle(fontStyle: FontStyle.italic),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.of(context).pop();
              },
              child: const Text('Return to Home'),
            ),
          ],
        );
      },
    );
  }
}

class Therapist {
  final String id;
  final String name;
  final String specialty;
  final double rating;
  final String image;

  Therapist({
    required this.id,
    required this.name,
    required this.specialty,
    required this.rating,
    required this.image,
  });
} 