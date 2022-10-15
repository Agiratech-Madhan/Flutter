class MentionsModel {
  final String m_Header;
  final String m_group;
  final String m_name;
  final String m_time;
  final String m_message;
  final String m_image;
  final String m_reactions;
  MentionsModel(
      {required this.m_Header,
      required this.m_group,
      required this.m_name,
      required this.m_time,
      required this.m_message,
      required this.m_image,
      required this.m_reactions});
}

List<MentionsModel> Mentions_list = [
  MentionsModel(
      m_Header: 'Vignesh mentioned everyone in',
      m_group: '#agira',
      m_name: 'Madhan',
      m_time: 'oct 16 3:15PM',
      m_message:
          'A belated birthday wishes that your life may be filled with joy, peace and the love that you dese ',
      m_image: 'assets/images/person1.jpeg',
      m_reactions: '\u{1f912}'),
  MentionsModel(
      m_Header: 'Vignesh mentioned everyone in',
      m_group: '#agira',
      m_name: 'Sarath',
      m_time: 'oct 5 7:05 PM',
      m_message:
          'A belated birthday wishes that your life may be filled with joy, peace and the love that you dese ',
      m_image: 'assets/images/person1.jpeg',
      m_reactions: '\u{1f912}'),
  MentionsModel(
      m_Header: 'Vignesh mentioned everyone in',
      m_group: '#agira',
      m_name: 'Ssrath',
      m_time: 'oct 16 3:15 PM',
      m_message:
          'A belated birthday wishes that your life may be filled with joy, peace and the love that you dese ',
      m_image: 'assets/images/person1.jpeg',
      m_reactions: '\u{1f912}'),
  MentionsModel(
      m_Header: 'Vignesh mentioned everyone in',
      m_group: '#agira',
      m_name: 'Sasi',
      m_time: 'oct 16 3:15 PM',
      m_message:
          'A belated birthday wishes that your life may be filled with joy, peace and the love that you dese ',
      m_image: 'assets/images/person1.jpeg',
      m_reactions: '\u{1f912}'),
  MentionsModel(
      m_Header: 'Vignesh mentioned everyone in',
      m_group: '#agira',
      m_name: 'Karthi',
      m_time: 'oct 16 3:15 PM',
      m_message:
          'A belated birthday wishes that your life may be filled with joy, peace and the love that you dese ',
      m_image: 'assets/images/person1.jpeg',
      m_reactions: '\u{1f912}'),
];


// List sam=[]
// void main() {
//   for (int i = 0; i < 5; i++) {
//     Mentions_list;
//   }
// }
